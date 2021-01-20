theforeman.operations.foreman_proxy_certs_generate
==================================================

Generates a certificate bundle for Katello scenario

Role Variables
--------------

Required:

- `foreman_proxy_certs_generate_fqdn`: Target FQDN to generate a certificate bundle for

Optional:

- `foreman_proxy_certs_generate_tarball`: Full path of the tarball that should be generated. Defaults to /root/<foreman_proxy_certs_generate_fqdn>.tar.gz
- `foreman_proxy_certs_generate_options`: Array of options to pass to the installer

Example Playbooks
-----------------

Generate a certificate bundle for the hostname proxy.example.com:

```
---
- hosts: all
  gather_facts: false
  vars:
    foreman_proxy_certs_generate_fqdn: proxy.example.com
  roles:
    - role: foreman_proxy_certs_generate
```
