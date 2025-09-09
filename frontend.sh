#install a package
dnf install nginx

#enable and start a service
systemctl enable nginx
systemctl start nginx

#remove default content
rm -rf usr/share/ngin/html/*

#download content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip

#extract content
cd usr/share/nginx/html
unzip tmp/frontend.zip


#restart nginx service
systemctl restart nginx
