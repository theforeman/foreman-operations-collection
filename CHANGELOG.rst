===================================
theforeman.operations Release Notes
===================================

.. contents:: Topics


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
