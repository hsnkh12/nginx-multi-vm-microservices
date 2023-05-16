sudo apt install nodejs -y
sudo apt install npm -y
sudo apt install git
sudo apt install docker.io

mkdir service1
cd service1
git clone https://github.com/hsnkh12/node-backend-for-test/
npm i
docker build -t service1 .

docker run -d -p 8000:8000 --env PORT=8000 service1
docker run -d -p 8001:8001 --env PORT=8001 service1

cd
mkdir service2
cp service1/* service2/
cd service2 
docker build -t service2 .

docker run -d -p 8002:8002 --env PORT=8002 service1
docker run -d -p 8003:8003 --env PORT=8003 service1


sudo cat <<EOT > node_app_config

http {
    upstream service1 {
        server 192.168.33.2:8000;
        server 192.168.33.2:8001;
    }

    upstream service2 {
        server 192.168.33.2:8002;
        server 192.168.33.2:8003;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://service1;
        }

        location /s2 {
            proxy_pass http://service2;
        }
    }
}

EOT

sudo mv node_app_config /etc/nginx/sites-available/node_app
sudo rm -rf /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/node_app /etc/nginx/sites-enabled/node_app

sudo service nginx restart