<IfModule mod_ssl.c>
	<VirtualHost _default_:80>
		ServerName nulpunt.argure.nl
		ServerAdmin argure@argure.nl
		Redirect permanent / https://nulpunt.argure.nl/
	</VirtualHost>

	<VirtualHost _default_:443>
		ServerName nulpunt.argure.nl
		ServerAdmin argure@argure.nl

		DocumentRoot /srv/nulpunt.argure.nl

		LogLevel info ssl:warn
		ErrorLog ${APACHE_LOG_DIR}/nulpunt.argure.nl/error.log

		SSLEngine on
		SSLCertificateFile /etc/ssl/certs/nulpunt.argure.nl.pem
		SSLCertificateKeyFile /etc/ssl/private/nulpunt.argure.nl.key
		SSLVerifyClient none

		<Directory />
			Options FollowSymLinks
			AllowOverride None
		</Directory>

		<Directory /srv/nulpunt.argure.nl/>
			Options Indexes FollowSymLinks MultiViews
			AllowOverride None
			Order allow,deny
			allow from all
		</Directory>

	</VirtualHost>
</IfModule>
