theforeman.operations.foreman_repositories
==========================================

Sets up the Foreman and plugin repositories.

Role Variables
--------------

Optional:

- `foreman_repositories_version`: Version of Foreman to setup repositories for.
- `foreman_repositories_katello_version`: Version of Katello to setup repositories for, set a value for this to configure Katello repositories otherwise no Katello repositories will be configured (default: null)

Example Playbooks
-----------------

Setup repositories for Foreman 3.19:

```yaml
---
- hosts: all
  gather_facts: true
  vars:
    foreman_repositories_version: "3.19"
  roles:
    - foreman_repositories
```

Setup repositories for Katello 4.21 and Foreman 3.19:

```yaml
---
- hosts: all
  gather_facts: true
  vars:
    foreman_repositories_version: "3.19"
    foreman_repositories_katello_version: "4.21"
  roles:
    - foreman_repositories
```
