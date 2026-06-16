theforeman.operations.openvox_repositories
=========================================

Sets up OpenVox repositories

Role Variables
--------------

Optional:

- `foreman_openvox_repositories_version`: Version of OpenVox to setup repositories for (default: 8)

Example Playbooks
-----------------

Setup repositories for default OpenVox 8 for use by installer:

```yaml
---
- hosts: all
  gather_facts: true
  roles:
    - openvox_repositories
```

Setup repositories for OpenVox 7:

```yaml
---
- hosts: all
  gather_facts: true
  vars:
    foreman_openvox_repositories_version: 7
  roles:
    - openvox_repositories
```
