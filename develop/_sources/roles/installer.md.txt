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

Example Playbooks
-----------------

Run the installer setting the initial admin password:

```yaml
- hosts: target-host
  roles:
    # Run installer with katello scenario
    - role: theforeman.operations.installer
      vars:
        foreman_installer_scenario: katello
        foreman_installer_options:
          - '--foreman-initial-admin-password changeme'
```
