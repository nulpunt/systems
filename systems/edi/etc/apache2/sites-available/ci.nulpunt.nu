<IfModule mod_ssl.c>
        <VirtualHost *:80>
                ServerName ci.nulpunt.nu
                ServerAdmin jenkins-ci@nulpunt.nu
                Redirect permanent / https://ci.nulpunt.nu
        </VirtualHost>

        <VirtualHost *:443>
                ServerName ci.nulpunt.nu
                ServerAdmin jenkins-ci@nulpunt.nu

                ProxyPass / ajp://127.0.0.1:8102/
                ProxyPassReverse / ajp://127.0.0.1:8102/
                ProxyRequests Off

                <Location />
                        Order allow,deny
                        Allow from all
                </Location>

                LogLevel info ssl:warn
                ErrorLog ${APACHE_LOG_DIR}/ci.nulpunt.nu.error.log

                # TODO: create and use certificates for ci
                SSLEngine on
                #SSLCertificateFile /etc/ssl/certs/ci.nulpunt.nu.pem
                #SSLCertificateKeyFile /etc/ssl/private/ci.nulpunt.nu.key
                SSLCertificateFile /etc/ssl/certs/nulpunt.argure.nl.pem
                SSLCertificateKeyFile /etc/ssl/private/nulpunt.argure.nl.key
                SSLVerifyClient none

        </VirtualHost>
</IfModule>
