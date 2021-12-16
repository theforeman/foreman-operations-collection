theforeman.operations.prepare_realm
===================================

Prepare FreeIPA domain for foreman realm integartion and get keytab

Prerequisites
-------------

* This role introduce a dependency on the `freeipa.ansible_freeipa` collection. This collection is not an hard requirement for this collection as it is not mandatory for other common operations. Be sure to add manually this collection to your `requirements.yml` file or install it before running this role.
* The server must be already part of a FreeIPA domain. To automate the FreeIPA client registraion, please see `ipaclient` role documentation of `freeipa.ansible_freeipa` collection.

Role Variables
--------------

Required:

- `foreman_prepare_realm_freeipa_password`: Password for FreeIPA domain principal, this is required to be set.

Optional:

- `foreman_prepare_realm_freeipa_principal`: FreeIPA domain principal. This principal must have admin rights on the domain. Defaults to `admin`.
- `foreman_prepare_realm_freeipa_server`: FreeIPA server from where to fetch user keytab. If not provided, `server` value from `/etc/ipa/default.conf` file will be used.
- `foreman_prepare_realm_freeipa_realm`: FreeIPA realm.If not provided, `realm` value from `/etc/ipa/default.conf` file will be used.
- `foreman_prepare_realm_user`: FreeIPA user used for Foreman-FreeIPA integration. Defaults to `realm-proxy`.
- `foreman_prepare_realm_keytab_path`: FreeIPA realm user keytab path. Dfaults to `/etc/foreman-proxy/realm.keytab`.
- `foreman_prepare_realm_force_keytab_refresh`: Force execution of keytab retrivial. By default keytab is retrivied only if keytab file don't exist. Defaults to `false`.

Example Playbooks
-----------------

Run the prepare realm with non default admin user and run the installer

```yaml
- hosts: target-host
  roles:
    # Prepare FreeIPA realm integration
    - role: theforeman.operations.prepare_realm
      vars:
        foreman_prepare_realm_freeipa_principal: admin-user
        foreman_prepare_realm_freeipa_password: changeme
        foreman_prepare_realm_freeipa_realm: EXAMPLE.COM

    # Run the installer with FreeIPA realm integration options
    - role: theforeman.operations.installer
      vars:
        foreman_installer_options:
          - "--foreman-proxy-realm true"
          - "--foreman-proxy-realm-keytab '/etc/foreman-proxy/realm.keytab'"
          - "--foreman-proxy-realm-principal 'realm-proxy@EXAMPLE.COM'"
          - "--foreman-proxy-freeipa-remove-dns true"
```

