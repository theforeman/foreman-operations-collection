# Foreman Operations Collection ![Build Status](https://github.com/theforeman/foreman-operations-collection/workflows/CI/badge.svg)

Ansible assets for managing Foreman operations such as install, upgrade or maintenance tasks.

## Documentation

A list of all assets and their documentation can be found at [theforeman.org/plugins/foreman-operations-collection](https://theforeman.org/plugins/foreman-operations-collection/).

## Support

### Supported Foreman and plugins versions

Ansible assets should support any currently stable Foreman release and the matching set of plugins.
Some modules have additional features/arguments that are only applied when the corresponding plugin is installed.

We actively test the modules against the latest stable Foreman release and the matching set of plugins.

### Supported Ansible Versions

The supported Ansible versions are aligned with currently maintained Ansible versions. You can find the list of maintained Ansible versions [here](https://docs.ansible.com/ansible/latest/reference_appendices/release_and_maintenance.html#release-status).

### Supported Python Versions

Ansible only supports Python 2.7 and 3.5 (and higher). These are also the only Python versions we develop and test the modules against.

### Known issues

## Installation

There are currently two ways to use the modules in your setup: install from Ansible Galaxy or via RPM. RPM installation is planned for a future release.

### Installation from Ansible Galaxy

You can install the collection from [Ansible Galaxy](https://galaxy.ansible.com/theforeman/operations) by running `ansible-galaxy collection install theforeman.operations`.

After the installation, the assets are available as `theforeman.operations.<name>`. Please see the [Using Ansible collections documentation](https://docs.ansible.com/ansible/devel/user_guide/collections_using.html) for further details.

### Installation via RPM

The collection is planned to be available as `ansible-collection-theforeman-operations` from the `client` repository on `yum.theforeman.org` starting with a future Foreman release.

After installing the RPM, you can use the modules in the same way as when they are installed directly from Ansible Galaxy.

## Dependencies

These dependencies are required for the Ansible controller, not the Foreman server.

* `PyYAML`
