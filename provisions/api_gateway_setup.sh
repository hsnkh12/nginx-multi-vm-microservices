sudo cat <<EOT > node_app_config

server {

  listen 80;

    location / {

    proxy_pass http://192.168.33.2:80;

    }

    location /api {

    proxy_pass http://192.168.33.3:80;

    }

}

EOT

sudo mv api_gateway_config /etc/nginx/sites-available/api_gateway
sudo rm -rf /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/api_gateway /etc/nginx/sites-enabled/api_gateway

sudo service nginx restart