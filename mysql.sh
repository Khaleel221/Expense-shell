#install mysql server
dnf install mysql-server -y

#enable and restart service
systemctl enable mysql-server
systectl start mysql-server

#set password
mysql_secure_installation --set-root-pass ExpenseApp@1
