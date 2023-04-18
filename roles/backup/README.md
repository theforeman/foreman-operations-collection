theforeman.operations.backup
============================

Sets up backup cronjob using `foreman_maintain`, creating one full backup each Sunday and incremental ones otherwise.

Role Variables
--------------

* `foreman_backup_destination`: Destination where to write the backups to, defaults to `/var/backup/foreman`
* `foreman_backup_type`: Backup type, can be either `online` or `offline`, defaults to `online`
* `foreman_backup_keep_full`: How many full (weekly) backups to keep, defaults to `2`

Example Playbooks
-----------------

```yaml
---
- hosts: all
  gather_facts: true
  roles:
    - backup
```
