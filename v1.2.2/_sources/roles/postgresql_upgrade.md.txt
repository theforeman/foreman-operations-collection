theforeman.operations.postgresql_upgrade
========================================

Upgrade Foreman's PostgreSQL from 10 to 12 on EL8.

Example Playbooks
-----------------

```yaml
---
- hosts: all
  gather_facts: true
  roles:
    - postgresql_upgrade
```
