theforeman.operations.ansible_repositories
=========================================

Sets up Ansible repositories

Role Variables
--------------

None

Example Playbooks
-----------------

Setup repositories for default Ansible 2.9 for use by installer:

```yaml
---
- hosts: all
  gather_facts: true
  roles:
    - ansible_repositories
```
