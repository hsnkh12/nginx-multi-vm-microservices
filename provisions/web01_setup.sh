sudo apt install nodejs -y
sudo apt install npm -y
sudo apt install git
sudo apt install docker.io

mkdir service1
cd service1
git clone https://github.com/hsnkh12/node-backend-for-test/
npm i
docker build -t service1 .

docker run -d -p 5000:5000 --env PORT=5000 service1
docker run -d -p 5001:5001 --env PORT=5001 service1

cd
mkdir service2
cp service1/* service2/
cd service2 
docker build -t service2 .

docker run -d -p 5002:5002 --env PORT=5002 service1
docker run -d -p 5003:5003 --env PORT=5003 service1


sudo cat <<EOT > node_app_config

http {
    upstream service1 {
        server 192.168.33.2:5000;
        server 192.168.33.2:5001;
    }

    upstream service2 {
        server 192.168.33.2:5002;
        server 192.168.33.2:5003;
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