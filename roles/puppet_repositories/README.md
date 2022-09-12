theforeman.operations.puppet_repositories
=========================================

Sets up Puppet repositories

Role Variables
--------------

Optional:

- `foreman_puppet_repositories_version`: Version of Puppet to setup repositories for (default: 7)

Example Playbooks
-----------------

Setup repositories for default Puppet 7 for use by installer:

```yaml
---
- hosts: all
  gather_facts: true
  roles:
    - puppet_repositories
```

Setup repositories for Puppet 6:

```yaml
---
- hosts: all
  gather_facts: true
  vars:
    foreman_puppet_repositories_version: 6
  roles:
    - puppet_repositories
```
