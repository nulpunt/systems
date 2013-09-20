<IfModule mod_ssl.c>
	<VirtualHost _default_:80>
		ServerName jenkins.nulpunt.nu
		#TODO: Update to jenkins@nulpunt.nu when mail forwarder is running
		ServerAdmin geertjohan.riemer@gmail.com
		Redirect permanent / https://jenkins.nulpunt.nu
	</VirtualHost>

	<VirtualHost _default_:443>
		ServerName jenkins.nulpunt.nu
		#TODO: Update to jenkins@nulpunt.nu when mail forwarder is running
		ServerAdmin geertjohan.riemer@gmail.com

		ProxyPass / ajp://127.0.0.1:8102/jenkins/
		ProxyPassReverse / ajp://127.0.0.1:8102/jenkins/
		ProxyRequests Off

		<Location />
			Order allow,deny
			Allow from all
		</Location>

		LogLevel info ssl:warn
		ErrorLog ${APACHE_LOG_DIR}/jenkins.nulpunt.nu.error.log

		# TODO: create and use certificates for jenkins
		SSLEngine on
		SSLCertificateFile /etc/ssl/certs/nulpunt.argure.nl.pem
		SSLCertificateKeyFile /etc/ssl/private/nulpunt.argure.nl.key
		SSLVerifyClient none

	</VirtualHost>
</IfModule>