#!/bin/bash

# Encrypt a file with GPG so that multiple people can decrypt the file.
# usage: groupenc.sh <group> <filename>

argure=98C9D1FC2C64E0AADA49175FE048E6B1ECC14594 

sysadmins="$argure"

eval "groupmembers=\$$1"

case $groupmembers in '')
	echo "Recipient not found. Usage: groupenc group file" >&2
	case $1 in *[A-Z]*)
		echo "(Try lowercase!)" >&2
	esac
	exit 1
esac

shift

gpg --keyserver pgp.surfnet.nl --no-auto-check-trustdb --recv $groupmembers
exec gpg -ea --no-auto-check-trustdb --no-encrypt-to \
	$(for i in $groupmembers; do echo -r 0x$i; done) \
	"$@"
