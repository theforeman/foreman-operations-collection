theforeman.operations.cloud_connector
=====================================

Install and configure Red Hat Cloud Connector

Role Variables
--------------

Required:

- `foreman_cloud_connector_url`: The URL of the Foreman server.
- `foreman_cloud_connector_user`: The username cloud connector will use to talk to Foreman API.
- `foreman_cloud_connector_password`: The password cloud connector will use to talk to Foreman API.

Example Playbooks
-----------------

Run the installer setting the initial admin password:
Configure Cloud Connector:

```yaml
- hosts: target-host
  roles:
    - role: theforeman.operations.cloud_connector
      vars:
        foreman_cloud_connector_url: https://foreman.example.com
        foreman_cloud_connector_user: admin
        foreman_cloud_connector_password: changeme
```
