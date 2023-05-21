# Nextcloud - Passman demo container

FROM nextcloud:26-apache

RUN ln -s /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled/ && \
    sed  -i '0,/.*SSLCertificateChainFile.*/s/.*SSLCertificateChainFile.*/SSLCertificateChainFile \/etc\/ssl\/private\/fullchain.pem/' /etc/apache2/sites-enabled/default-ssl.conf && \
    sed -i '0,/.*ssl-cert-snakeoil.pem.*/s/.*ssl-cert-snakeoil.pem.*/SSLCertificateFile \/etc\/ssl\/private\/cert.pem/' /etc/apache2/sites-enabled/default-ssl.conf && \
    sed -i '0,/.*SSLCertificateKeyFile.*/s/.*SSLCertificateKeyFile.*/SSLCertificateKeyFile \/etc\/ssl\/private\/privkey.pem/' /etc/apache2/sites-enabled/default-ssl.conf && \
    a2enmod ssl

COPY ./docker_demo_start.sh /
RUN chmod +x /docker_demo_start.sh

ENTRYPOINT ["/docker_demo_start.sh"]
