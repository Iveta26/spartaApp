#!/bin/bash

# update <- to ensure package source list is up to date
sudo apt update -y


# upgrade <- installs latests packages of linux
sudo apt upgrade -y


# install nginx
sudo apt install nginx -y

# enable nginx - when VM restarts nginx will automatically start
sudo systemctl enable nginx

# install sed
sudo apt install sed -y

# setup reverse proxy
sudo sed -i 's#try_files $uri $uri/ =404;#proxy_pass http://localhost:3000;#g' /etc/nginx/sites-available/default

# restart to apply changes
sudo systemctl restart nginx

# cat /etc/nginx/sites-available/default

# download node source
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# install node js
sudo apt install nodejs -y

# install pm2
sudo npm install pm2 -g

# create env var. Enter IP and port of the DB
# export DB_HOST=mongodb://172.166.128.199:27017/posts

git clone https://github.com/Iveta26/spartaApp sparta_app

cd .
cd app

# downloads required dependencies for nodejs. checks for DB_HOST var
npm install

#pm2 runs app in the background
pm2 start app.js
