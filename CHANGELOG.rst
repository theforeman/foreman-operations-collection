===================================
theforeman.operations Release Notes
===================================

.. contents:: Topics

v3.0.0
======

Minor Changes
-------------

- cloud_connector role - Remove receptor cleanup steps in configure cloud connector
- cloud_connector role - Restart rhcd after writing out config file
- foreman_repositories role - disable Pulpcore module on upgrades to Katello 4.11+
- foreman_repositories role - only enable the Pulpcore module for Katello up to 4.10, later versions use demodularized Pulpcore repos
- metrics role - new role to setup PCP integration with Foreman 3.9 and newer
- puppet_repositories role - Add support for Puppet 7 and 8

Breaking Changes / Porting Guide
--------------------------------

- foreman_repositories role - drop default ``foreman_repositories_version``, you now have always to specify which version you want to deploy
- foreman_repositories role - drop support for CentOS 7 repositories
- foreman_repositories role - drop support for Foreman pre 3.2 / Katello pre 4.4 repositories
- postgresql_upgrade role - removed the role as it was only needed for Foreman before 2.5
- puppet_repositories role - Drop support for Puppet 5

v2.1.0
======

v2.0.0
======

Minor Changes
-------------

- cloud_connector role - don't mark proxy.conf systemd drop-in word-inaccessible, there is no benefit and systemd warns about this (https://bugzilla.redhat.com/show_bug.cgi?id=2169682)

Breaking Changes / Porting Guide
--------------------------------

- ansible_repositories role - removed as it's not required anymore since EL 8.6 contains ``ansible-core``

v1.3.0
======

Minor Changes
-------------

- new role to configure backups using ``foreman-maintain``
- update default Foreman to 3.5
- update default Puppet to 7

Bugfixes
--------

- cloud_connector role - Ensure ``rhcd.service`` starts after system reboots
- fix paths in execution-environment.yml (https://bugzilla.redhat.com/show_bug.cgi?id=2156941)

v1.2.3
======

Bugfixes
--------

- foreman_repositories - also enable pulpcore module when enabling katello

v1.2.2
======

Bugfixes
--------

- cloud_connector role - use a regular expression to parse the CN from the cert

v1.2.1
======

Bugfixes
--------

- fix parsing of openssl certificate subject for EL7 and EL8

v1.2.0
======

Minor Changes
-------------

- add HTTP proxy support for cloud connector

v1.1.1
======

Bugfixes
--------

- update FORWARDER_URL for cloud connector

v1.1.0
======

Minor Changes
-------------

- cloud_connector - new role for installing Cloud Connector (https://github.com/theforeman/foreman-operations-collection/pull/85)

v1.0.2
======

Bugfixes
--------

- installer role - don't fail execution in check mode

v1.0.1
======

Bugfixes
--------

- correct collection metadata, so it can be uploaded to Galaxy

v1.0.0
======

Release Summary
---------------

This is the first stable release of the ``theforeman.operations`` collection.

v0.3.0
======

v0.2.0
======

v0.1.0
======
