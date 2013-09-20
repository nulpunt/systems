<IfModule mod_ssl.c>
	<VirtualHost :80>
		ServerName jenkins.nulpunt.nu
		ServerAdmin geertjohan.riemer@gmail.com #TODO: Update to jenkins@nulpunt.nu when mail forwarder is running
		Redirect permanent / https://jenkins.nulpunt.nu
	</VirtualHost>

	<VirtualHost :443>
		ServerName jenkins.nulpunt.nu
		ServerAdmin jenkins@nulpunt.nu

		ProxyPass / ajp://127.0.0.1:8102/jenkins/
		ProxyPassReverse / ajp://127.0.0.1:8102/jenkins/
		ProxyRequests Off

		<Location />
			Order allow,deny
			Allow from all
		</Location>

		LogLevel info ssl:warn
		ErrorLog ${APACHE_LOG_DIR}/jenkins.nulpunt.nu/error.log

		# TODO: create and use certificates for jenkins
		SSLEngine on
		SSLCertificateFile /etc/ssl/certs/nulpunt.argure.nl.pem
		SSLCertificateKeyFile /etc/ssl/private/nulpunt.argure.nl.key
		SSLVerifyClient none

	</VirtualHost>
</IfModule>