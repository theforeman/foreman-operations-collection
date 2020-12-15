theforeman.operations.installer
===============================

Run the foreman-installer

Role Variables
--------------

Required:

- `installer_scenario`: The installer scenario to run, this is required to be set

Optional:

- `installer_package`: Package containing the installer scenario
- `installer_options`: Array of options to pass to the installer
- `installer_verbose`: Enables verbose output mode in the installer
- `installer_no_colors`: Disables color output from the installer
- `installer_command`: Installer command to run, can be used by derivative projects to specify a branded command

Example Playbooks
-----------------

Run the installer setting the initial admin password:

```yaml
- hosts: target-host
  roles:
    - role: theforeman.operations.installer
      vars:
        installer_options:
          - '--foreman-initial-admin-password changeme'
```
