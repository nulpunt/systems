<IfModule mod_ssl.c>
	    <VirtualHost *:80>
	            ServerName ci.nulpunt.nu
	            #TODO: Update to jenkins@nulpunt.nu when mail forwarder is running
	            ServerAdmin geertjohan.riemer@gmail.com
	            Redirect permanent / https://ci.nulpunt.nu
	    </VirtualHost>

	    <VirtualHost *:443>
	            ServerName ci.nulpunt.nu
	            #TODO: Update to jenkins@nulpunt.nu when mail forwarder is running
	            ServerAdmin geertjohan.riemer@gmail.com

	            ProxyPass / ajp://127.0.0.1:8102/
	            ProxyPassReverse / ajp://127.0.0.1:8102/
	            ProxyRequests Off

	            <Location />
	                    Order allow,deny
	                    Allow from all
	            </Location>

	            LogLevel info ssl:warn
	            ErrorLog ${APACHE_LOG_DIR}/ci.nulpunt.nu.error.log

	            # TODO: create and use certificates for jenkins
	            SSLEngine on
	            SSLCertificateFile /etc/ssl/certs/ci.nulpunt.nu.pem
	            SSLCertificateKeyFile /etc/ssl/private/ci.nulpunt.nu.key
	            SSLVerifyClient none

	    </VirtualHost>
</IfModule>