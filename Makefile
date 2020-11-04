NAMESPACE := $(shell python -c 'import yaml; print(yaml.safe_load(open("galaxy.yml"))["namespace"])')
NAME := $(shell python -c 'import yaml; print(yaml.safe_load(open("galaxy.yml"))["name"])')
VERSION := $(shell python -c 'import yaml; print(yaml.safe_load(open("galaxy.yml"))["version"])')
MANIFEST := build/collections/ansible_collections/$(NAMESPACE)/$(NAME)/MANIFEST.json

ROLES := $(wildcard roles/*)
PLUGIN_TYPES := $(filter-out __%,$(notdir $(wildcard plugins/*)))
METADATA := galaxy.yml LICENSE README.md requirements.txt CHANGELOG.rst
$(foreach PLUGIN_TYPE,$(PLUGIN_TYPES),$(eval _$(PLUGIN_TYPE) := $(filter-out %__init__.py,$(wildcard plugins/$(PLUGIN_TYPE)/*.py))))
DEPENDENCIES := $(METADATA) $(foreach PLUGIN_TYPE,$(PLUGIN_TYPES),$(_$(PLUGIN_TYPE))) $(foreach ROLE,$(ROLES),$(filter-out $(ROLE)/molecule/%, $(wildcard $(ROLE)/*/*)))

PYTHON_VERSION = $(shell python -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')
COLLECTION_COMMAND ?= ansible-galaxy
SANITY_OPTS = --venv
TEST =
FLAGS =
PYTEST = pytest -n 4 --boxed -v

APIPIE_VERSION ?= v0.3.1

default: help
help:
	@echo "Please use \`make <target>' where <target> is one of:"
	@echo "  help             to show this message"
	@echo "  info             to show infos about the collection"
	@echo "  lint             to run code linting"
	@echo "  test             to run unit tests"
	@echo "  livetest         to run test playbooks live (without vcr)"
	@echo "  sanity           to run santy tests"
	@echo "  setup            to set up test, lint"
	@echo "  test-setup       to install test dependencies"
	@echo "  test_<test>      to run a specific unittest"
	@echo "  livetest_<test>  to run a specific unittest live (without vcr)"
	@echo "  record_<test>    to (re-)record the server answers for a specific test"
	@echo "  clean_<test>     to run a specific test playbook with the teardown and cleanup tags"
	@echo "  dist             to build the collection artifact"

info:
	@echo "Building collection $(NAMESPACE)-$(NAME)-$(VERSION)"
	@echo "  roles:\n $(foreach ROLE,$(notdir $(ROLES)),   - $(ROLE)\n)"
	@echo " $(foreach PLUGIN_TYPE,$(PLUGIN_TYPES), $(PLUGIN_TYPE):\n $(foreach PLUGIN,$(basename $(notdir $(_$(PLUGIN_TYPE)))),   - $(PLUGIN)\n)\n)"

lint: $(MANIFEST)

sanity: $(MANIFEST)
	# Fake a fresh git repo for ansible-test
	cd $(<D) ; git init ; echo tests > .gitignore ; ansible-test sanity $(SANITY_OPTS) --python $(PYTHON_VERSION)

test: $(MANIFEST)
	$(PYTEST) $(TEST)

test-check-mode: $(MANIFEST)
	$(PYTEST) 'tests/test_crud.py::test_check_mode'

test-other:
	$(PYTEST) -k 'not test_crud.py'

clean_%: FORCE $(MANIFEST)
	ansible-playbook --tags teardown,cleanup -i tests/inventory/hosts 'tests/test_playbooks/$*.yml'

setup: test-setup

test-setup:
	pip install --upgrade 'pip<20'
	pip install --upgrade -r requirements-dev.txt

$(MANIFEST): $(NAMESPACE)-$(NAME)-$(VERSION).tar.gz
	ansible-galaxy collection install -p build/collections $< --force

build/src/%: %
	install -m 644 -DT $< $@

$(NAMESPACE)-$(NAME)-$(VERSION).tar.gz: $(addprefix build/src/,$(DEPENDENCIES))
	ansible-galaxy collection build build/src --force

dist: $(NAMESPACE)-$(NAME)-$(VERSION).tar.gz

publish: $(NAMESPACE)-$(NAME)-$(VERSION).tar.gz
	ansible-galaxy collection publish --api-key $(GALAXY_API_KEY) $<

clean:
	rm -rf build docs/plugins

doc-setup:
	pip install --upgrade -r docs/requirements.txt
doc: $(MANIFEST)
	mkdir -p ./docs/plugins ./docs/roles
	cat ./docs/roles.rst.template > ./docs/roles/index.rst
	for role_readme in roles/*/README.md; do \
		ln -f -s ../../$$role_readme ./docs/roles/$$(basename $$(dirname $$role_readme)).md; \
		echo " * :doc:\`$$(basename $$(dirname $$role_readme))\`" >> ./docs/roles/index.rst; \
	done
	antsibull-docs collection --use-current --squash-hierarchy --dest-dir ./docs/plugins $(NAMESPACE).$(NAME)
	make -C docs html

FORCE:

.PHONY: help dist lint sanity test test-crud test-check-mode test-other livetest setup test-setup doc-setup doc publish FORCE
