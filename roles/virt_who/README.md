theforeman.operations.virt_who
==============================

Install and configure virt-who for hypervisor-to-Foreman/Satellite reporting.

This role replaces the bash deployment script from the `foreman_virt_who_configure` plugin with an idempotent Ansible role. It installs virt-who, encrypts credentials, writes the per-config and global configuration files, and manages the virt-who service.

Requirements
------------

- Target host must be RHEL/CentOS family
- virt-who >= 0.24.2 must be available in configured repositories
- The `virt-who-password` utility (shipped with virt-who) is used for credential encryption

Role Variables
--------------

Required:

- `foreman_virt_who_hypervisor_type`: Hypervisor type — `esx`, `hyperv`, `libvirt`, `kubevirt`, or `ahv`.
- `foreman_virt_who_satellite_url`: Foreman or Satellite FQDN (used as `rhsm_hostname`).
- `foreman_virt_who_organization_label`: Organization label (Candlepin owner).
- `foreman_virt_who_service_user`: RHSM service user username.
- `foreman_virt_who_service_user_password`: RHSM service user password (will be encrypted on the target host).

Conditionally required:

- `foreman_virt_who_hypervisor_server`: Hypervisor server URL/hostname. Required for all types except `kubevirt`.
- `foreman_virt_who_hypervisor_username`: Hypervisor username. Required for all types except `kubevirt`.
- `foreman_virt_who_hypervisor_password`: Hypervisor password (will be encrypted on the target host). Required for `esx`, `hyperv`, and `ahv`.
- `foreman_virt_who_kubeconfig_path`: Path to kubeconfig file. Required for `kubevirt`.

Optional:

- `foreman_virt_who_identifier`: Config section name and filename base. Default: `virt-who-config`.
- `foreman_virt_who_hypervisor_id`: Hypervisor identification method — `hostname`, `uuid`, or `hwuuid`. Default: `hostname`.
- `foreman_virt_who_interval`: Reporting interval in seconds. Default: `7200`.
- `foreman_virt_who_debug`: Enable debug logging. Default: `false`.
- `foreman_virt_who_filtering_mode`: Host filtering mode — `none`, `whitelist`, or `blacklist`. Default: `none`.
- `foreman_virt_who_whitelist`: Comma-separated list of hosts to include (when filtering_mode is `whitelist`).
- `foreman_virt_who_blacklist`: Comma-separated list of hosts to exclude (when filtering_mode is `blacklist`).
- `foreman_virt_who_filter_host_parents`: Comma-separated list of parent compute resources to include (ESX, whitelist mode).
- `foreman_virt_who_exclude_host_parents`: Comma-separated list of parent compute resources to exclude (ESX, blacklist mode).
- `foreman_virt_who_http_proxy`: Full proxy URL (e.g., `http://proxy.example.com:8080`).
- `foreman_virt_who_no_proxy`: Comma-separated list of hosts/domains to bypass proxy.
- `foreman_virt_who_prism_flavor`: AHV Prism type — `central` or `element`. Default: `central`.
- `foreman_virt_who_ahv_internal_debug`: AHV internal debug value (only used when hypervisor_type is `ahv`).

Example Playbooks
-----------------

Deploy a VMware ESX configuration:

```yaml
- hosts: virt-who-hosts
  roles:
    - role: theforeman.operations.virt_who
      vars:
        foreman_virt_who_identifier: virt-who-config-1
        foreman_virt_who_hypervisor_type: esx
        foreman_virt_who_hypervisor_server: vcenter.example.com
        foreman_virt_who_hypervisor_username: readonly@vsphere.local
        foreman_virt_who_hypervisor_password: changeme
        foreman_virt_who_satellite_url: satellite.example.com
        foreman_virt_who_organization_label: Default_Organization
        foreman_virt_who_service_user: virt_who_reporter_1
        foreman_virt_who_service_user_password: secret
        foreman_virt_who_interval: 3600
```

Deploy a KubeVirt configuration:

```yaml
- hosts: virt-who-hosts
  roles:
    - role: theforeman.operations.virt_who
      vars:
        foreman_virt_who_identifier: virt-who-config-2
        foreman_virt_who_hypervisor_type: kubevirt
        foreman_virt_who_kubeconfig_path: /etc/virt-who/kubeconfig
        foreman_virt_who_satellite_url: satellite.example.com
        foreman_virt_who_organization_label: Default_Organization
        foreman_virt_who_service_user: virt_who_reporter_2
        foreman_virt_who_service_user_password: secret
```
