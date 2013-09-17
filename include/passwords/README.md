include/passwords
================

The passwords are in various KeePassX databases. For an overview, see below.
The files are encrypted with GnuPG, an open source implementatino of PGP and has
to be decrypted before KeePassX can open it.

Every sysadmin has a personal PGP key. The files are encrypted with these keys,
depending on required access. This means that every sysadmin can decrypt the
databases they have access to.

The database itself is also password locked. This password has to be shared out
of band through a reasonably secure channel.

/Never/ push the decrypted .kdb files to Git!



Decrypting
----------

`$ make decrypt`



Encrypting
----------
`$ make encrypt`



groupenc.sh
----------

Encryption and decryption is done with the bash script groupenc.sh. This script
contains the PGP keys of the sysadmins and it is where it's where access levels
are defined. It can be used as follows:

`$ ./groupenc.sh <group> <file>`

For example:

`$ ./groupenc.sh sysadmins 00-base.kdb`

/Never/ push the decrypted .kdb files to Git!
