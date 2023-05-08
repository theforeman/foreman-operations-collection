theforeman.operations.installer
===============================

Run the foreman-installer

Role Variables
--------------

Required:

- `foreman_installer_scenario`: The installer scenario to run, this is required to be set. You can find the list of all scenario available by running `foreman-installer --list-scenarios` command.

Optional:

- `foreman_installer_package`: Package containing the installer scenario
- `foreman_installer_options`: Array of options to pass to the installer
- `foreman_installer_verbose`: Enables verbose output mode in the installer
- `foreman_installer_no_colors`: Disables color output from the installer
- `foreman_installer_command`: Installer command to run, can be used by derivative projects to specify a branded command
- `foreman_installer_locale`: Locale to run the installer with, this must not be ```C```, defaults to ```en_US.UTF-8```
- `foreman_installer_timeout`: Time allowed for installer to run before it is assumed failed, defaults to 30m

Example Playbooks
-----------------

Run the installer with the `katello` scenario, setting the initial organization and admin password:

```yaml
- hosts: target-host
  roles:
    - role: theforeman.operations.installer
      vars:
        foreman_installer_scenario: katello
        foreman_installer_package: foreman-installer-katello
        foreman_installer_options:
          - '--foreman-initial-organization "ACME Inc"'
          - '--foreman-initial-admin-password changeme'
```
