#disable default nodejs
dnf module disable nodejs -y

#enable nodejs 20 version
dnf module enable nodejs:20 -y

#install nodejs
dnf install nodejs -y

#create directory
mkdir /app

#download application code
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip

cd /app

unzip /tmp/backend.zip

#download dependcies
npm install

#create backend service file
cp backend.service /etc/systemd/system/backend.service

## Reload and enable backend service
systemctl daemon-reload
systemctl enable backend
systemctl start backend

dnf install mysql-server -y

mysql -h 172.31.23.214 -u root -pExpenseApp@1 < /app/schema/backend.sql