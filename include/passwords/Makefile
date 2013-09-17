all:
	@echo "targets; encrypt, decrypt, commit, encrypt-kdb, decrypt-kdb"

%-encrypt:
	./groupenc.sh sysadmins $*

%-decrypt:
	git pull
	gpg --quiet -d $*

commit:
	git commit 00-base.kdb.asc

encrypt-kdb: 00-base.kdb-encrypt

decrypt-kdb:
	git pull
	gpg --quiet -d 00-base.kdb.asc > 00-base.kdb

encrypt: encrypt-kdb
decrypt: decrypt-kdb
