# Poweradmin for PowerDNS Server

## RUNNING

Login:
``admin / admin``

## ENVIRONMENT

The following environment variables are used:

* **POWERADMIN\_HOSTMASTER**:
  The default emailaddress to use for the RP in the SOA record. For example: ``hostmaster.example.net``.
  Default: "&lt;empty&gt;",
  Possible Values: "&lt;string&gt;"
* **POWERADMIN\_NS1**:
  The default primary nameserver.
  Default: ``8.8.8.8``,
  Possible Values: "&lt;string&gt;"
* **POWERADMIN\_NS2**:
  The default secondary nameserver.
  Default: ``8.8.4.4``,
  Possible Values: "&lt;string&gt;"
* **DNS\_TTL**:
  The default TTL for records (in seconds of course).
  Default: ``86400``,
  Possible Values: "&lt;integer&gt;"

### DATABASE

* **MYSQL\_HOST**:
  MySQL Server.
  Default: ``localhost``,
  Possible Values: "FQDN or IP"
* **MYSQL\_PORT**:
  MySQL Server Port.
  Default: ``3306``,
  Possible Values: "&lt;integer&gt;"
* **MYSQL\_USER**:
  MySQL User.
  Default: ``pdns``,
  Possible Values: "&lt;string&gt;"
* **MYSQL\_PASS**:
  MySQL Password.
  Default: "&lt;empty&gt;",
  Possible Values: "&lt;string&gt;"
* **MYSQL\_DB**:
  MySQL Database.
  Default: ``pdns``,
  Possible Values: "&lt;string&gt;"
