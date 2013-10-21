# To use this file you must create a symlink to this file in your
# caspar environment. For example:
#
# # mkdir -p /usr/local/include/caspar/mk
# # ln -s /home/argure/nulpunt/systems/include/caspar/nulpunt.mk \
# 	/usr/local/include/caspar/mk/nulpunt.mk
#
# This file can be used in systems/%hostname%/include/install.mk by
# adding:
#
# -include caspar/mk/nulpunt.mk

# Definitions shared among all systems.
apache2-check = ssh $1 "cd / && env - /usr/sbin/apache2ctl configtest"
apache2-reload = "$(apache2-check) && service apache2 reload"
apache2-restart = "$(apache2-check) && service apache2 restart"
aptitude-update = ssh $1 aptitude update
aptitude-upgrade = $(aptitude-update) && aptitude full-upgrade
clamav-freshclam = ssh $1 freshclam
clamav-restart = ssh $1 service clamav-daemon restart
dovecot-reload = ssh $1 service dovecot reload
dovecot-restart = ssh $1 service dovecot restart
exim4-reload = ssh $1 service exim4 reload
exim4-restart = ssh $1 service exim4 restart
fail2ban-reload = ssh $1 service fail2ban reload
fai2ban-restart = ssh $1 service fail2ban restart
grub2-reload = ssh $1 update-grub
jenkins-restart = ssh $1 service jenkins restart
mongodb-restart = ssh $1 service monogodb restart
mysql-reload = ssh $1 service mysql reload
mysql-restart = ssh $1 service mysql restart
php5-reload = ssh $1 service php5-fpm reload
php5-restart = ssh $1 service php5-fpm restart
saslauthd-reload = ssh $1 service saslauthd reload
saslauthd-restart = ssh $1 service saslauthd restart
shorewall-restart = ssh $1 "shorewall safe-restart && shorewall6 safe-restart"
spamassassin-reload = ssh $1 service spamassassin reload
spamassassin-restart = ssh $1 service spamassassin restart
ssh-reload = ssh $1 service ssh reload
ssh-restart = ssh $1 "sshd -t && service ssh restart"
ssh-permissions = ssh $1 "chown -R root: $(csp_DIR); chmod 600 $(csp_DIR)/authorized_keys; chmod 700 $(csp_DIR)"
sudo-reload = ssh $1 "chmod 440 /etc/sudoers /etc/sudoers.d/*; visudo -c"

%-a2enconf:
	for suh in ($csp_UHOSTS); do \
		ssh $$suh "a2enconf $*;  cd / && env - /usr/sbin/apache2ctl configtest && service apache2 reload" ; \
	done

%-a2disconf:
	for suh in ($csp_UHOSTS); do \
		ssh $$suh "a2disconf $*;  cd / && env - /usr/sbin/apache2ctl configtest && service apache2 reload" ; \
	done

%-a2enmod:
	for suh in ($csp_UHOSTS); do \
		ssh $$suh "a2enmod $*;  cd / && env - /usr/sbin/apache2ctl configtest && service apache2 restart" ; \
	done

%-a2dismod:
	for suh in ($csp_UHOSTS); do \
		ssh $$suh "a2dismod $*;  cd / && env - /usr/sbin/apache2ctl configtest && service apache2 restart" ; \
	done

%-a2ensite:
	for suh in ($csp_UHOSTS); do \
		ssh $$suh "a2ensite $*;  cd / && env - /usr/sbin/apache2ctl configtest && service apache2 reload" ; \
	done

%-a2dissite:
	for suh in ($csp_UHOSTS); do \
		ssh $$suh "a2dissite $*;  cd / && env - /usr/sbin/apache2ctl configtest && service apache2 reload" ; \
	done



# Host definitions

SEEAS_H = \
	edi.nulpunt.nu

ALL_H = \
	$(SEEAS_H)



include caspar/mk/caspar.mk
-include caspar/mk/local.mk
