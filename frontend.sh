#install a package
dnf install nginx -y

#copy reverse proxy configuration
cp expense.conf /etc/nginx/default.d/expense.conf

#remove default content
rm -rf usr/share/ngin/html/*

#download content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip

#extract content
cd usr/share/nginx/html
unzip tmp/frontend.zip


#enable and start a service
systemctl enable nginx
systemctl restart nginx
