---
id: nginx
title: Reverse-Proxy
sidebar_label: Nginx (Reverse-Proxy)
---

## Why Nignx rather than Apache?

I have deployed reverse proxies in front of quite a few apps at this point using both Apache and Nginx to facilitate this need. Of all my experiences doing so, this was the most frustrating.
Below you will find the details for the deployment of both Apache and Nginx. However, Nginx is the one currently in use, Apache manipulates the URI in strange ways which caused errors when CAS redirects the user back to the App, Apache would try to add text to the URI...It wasn't worth the time to fix. I spun up Nginx and it worked first try. 

I included the Apache configs below if it is ever necessary to use Apache over Nginx.


## SSL

Both Nginx and Apache were set up to pull the Cert and Pem from a directory named `ssl` placed in the root of the repo. Make sure the full chain and key are located in the directory, otherwise issues will ensue.

### How do I renew/get a new Cert?

run the following to get a new cert:
```
sudo certbot certonly --standalone
```

Once run the new cert and key can be found in `/etc/letsencrypt/live/war.marist.ai`. Next copy the `fullchain.pem` and `privkey.pem` files into the `ssl` directory in the reverse proxy repo. (A better idea would be to make these symlinks...)

## Nginx

### Adding an Endpoint

To add an endpoint to the Reverse Proxy a few steps have to be taken

#### Adding a Proxy Pass

Add the new endpoint as a entry in the [config file](https://github.com/Capping-WAR/ReverseProxy/blob/master/nginx.conf)

Example: 
```conf
server {
    listen 80;
    
    location / {
        proxy_pass http://10.11.17.26:30080/;
    }
}
```

### Redeploy the Reverse Proxy

On the server take down the running proxy and remove its image from the server. Next after pulling the latest changes from GitHub, in the root directory of this repo run:

```
docker-compose up
```

## Apache

Apache Reverse Proxy for Production Server

The Reverse Proxy runs as an Apache2 server within a docker container. When a new application is set up and given a port, an endpoint should be configured for it.

### Adding an Endpoint

To add an endpoint to the Reverse Proxy a few steps have to be taken

#### Adding a Proxy Pass

First head to the site configuration file and add a Proxy at the bottom of the file before the `</VirtualHost>`.

Example Proxy Config:
```config
# War Docs

ProxyPass /docs http://war.marist.ai:3001
ProxyPassReverse /docs http://war.marist.ai:3001

<Location /docs/*>
 Order allow,deny
 Allow from all
</Location>
```

**Note: If the app needs to be available on https as well, add the same configurations to the https site configuration file**

### Redeploy the Reverse Proxy

On the server take down the running proxy and remove its image from the server. Next after pulling the latest changes from GitHub, in the root directory of this repo run:

```
docker-compose up
```


### Site Configs


#### Dockerfile

```
FROM httpd:latest

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
RUN mkdir -p /usr/local/apache2/conf/sites/
RUN echo "127.0.0.1 war.marist.ai" >> /etc/hosts

EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]
```

#### war.conf
```
<VirtualHost *:80>
    
    ServerName war.marist.ai

    #Load the SSL module that is needed to terminate SSL on Apache
    LoadModule ssl_module modules/mod_ssl.so

    ErrorLog logs/war.log
    CustomLog logs/war-access.log combined

    # The ProxyPass directive specifies the mapping of incoming requests to the backend server (or a cluster of servers known as a Balancer group).
    # It proxies the requests only with matching URI “/blog”
    ProxyPreserveHost On

    ############## ROOT ###################
    Redirect /* https://war.marist.ai
    ############## ROOT ###################
</VirtualHost>
```

#### war-ssl.conf
```
Listen 443

<VirtualHost *:443>

    ServerName war.marist.ai

    #Load the SSL module that is needed to terminate SSL on Apache
    LoadModule ssl_module modules/mod_ssl.so

    #This directive toggles the usage of the SSL/TLS Protocol Engine for proxy. Without this you cannot use HTTPS URL as your Origin Server
    SSLProxyEngine on    

    ErrorLog logs/war-ssl.log
    CustomLog logs/war-ssl-access.log combined

    #   SSL Engine Switch:
    #   Enable/Disable SSL for this virtual host.
    SSLEngine on
    # SSLProtocol "SSLv3+TLSv1"
    SSLCipherSuite "ALL:!ADH:!aNULL:!eNULL:!LOW:!EXP:RC4+RSA:+HIGH:+MEDIUM"


    #   A self-signed (snakeoil) certificate can be created by installing
    #   the ssl-cert package. See
    #   /usr/share/doc/apache2/README.Debian.gz for more info.
    #   If both key and certificate are stored in the same file, only the
    #   SSLCertificateFile directive is needed.
    SSLCertificateFile    /usr/local/apache2/ssl/cert.pem
    SSLCertificateKeyFile    /usr/local/apache2/ssl/privkey.pem

    #   Server Certificate Chain:
    #   Point SSLCertificateChainFile at a file containing the
    #   concatenation of PEM encoded CA certificates which form the
    #   certificate chain for the server certificate. Alternatively
    #   the referenced file can be the same as SSLCertificateFile
    #   when the CA certificates are directly appended to the server
    #   certificate for convinience.
    
    SSLCertificateChainFile /usr/local/apache2/ssl/chain.pem

    # Proxies
    <Proxy *>
        Order deny,allow
        Allow from all
    </Proxy>

    ProxyRequests Off
    ProxyPreserveHost On

    ############## WAR UI ###################

    # ROOT
    ProxyPass / http://war.marist.ai:8081
    ProxyPassReverse / http://war.marist.ai:8081

    <Location />
        Order allow,deny
        Allow from all
    </Location>

    # Login
    ProxyPass /login http://war.marist.ai:8081/login
    ProxyPassReverse /login http://war.marist.ai:8081/login

    <Location /login/*>
        Order allow,deny
        Allow from all
    </Location>

    # Logout
    ProxyPass /logout http://war.marist.ai:8081/logout
    ProxyPassReverse /logout http://war.marist.ai:8081/logout

    <Location /logout/*>
        Order allow,deny
        Allow from all
    </Location>

    # about
    ProxyPass /about http://war.marist.ai:8081/about
    ProxyPassReverse /about http://war.marist.ai:8081/about

    <Location /about>
        Order allow,deny
        Allow from all
    </Location>

    # ai
    ProxyPass /ai http://war.marist.ai:8081/ai
    ProxyPassReverse /ai http://war.marist.ai:8081/ai

    <Location /ai>
        Order allow,deny
        Allow from all
    </Location>

    # admin
    ProxyPass /admin http://war.marist.ai:8081/admin
    ProxyPassReverse /admin http://war.marist.ai:8081/admin

    <Location /admin>
        Order allow,deny
        Allow from all
    </Location>

    # faq
    ProxyPass /faq http://war.marist.ai:8081/faq
    ProxyPassReverse /faq http://war.marist.ai:8081/faq

    <Location /faq>
        Order allow,deny
        Allow from all
    </Location>

    # static
    ProxyPass /static http://war.marist.ai:8081
    ProxyPassReverse /static http://war.marist.ai:8081

    <Location /static/*>
        Order allow,deny
        Allow from all
    </Location>
    ############## WAR UI ###################

    ############## WAR API ##################
    ProxyPass /api/war http://war.marist.ai:8080
    ProxyPassReverse /api/war http://war.marist.ai:8080

    <Location /api/war/*>
        Order allow,deny
        Allow from all
    </Location>
    ############## WAR API ##################

    ####### WAR Docs ########
    ProxyPass /docs http://war.marist.ai:8082
    ProxyPassReverse /docs http://war.marist.ai:8082

    <Location /docs/*>
        Order allow,deny
        Allow from all
    </Location>
    ####### WAR Docs ########
</VirtualHost>
```