#!/bin/bash


#we need to give this user permissions to replicate  mysql data:
sql_stmt='GRANT REPLICATION SLAVE ON *.* TO "master_user"@"%" IDENTIFIED BY "task4_pwd"; FLUSH PRIVILEGES;'
docker exec master1 sh -c "export MYSQL_PWD=task4; mysql -u root -e '$sql_stmt'"

sql_stmt='GRANT REPLICATION SLAVE ON *.* TO "master_user"@"%" IDENTIFIED BY "task4_pwd"; FLUSH PRIVILEGES;'
docker exec master2 sh -c "export MYSQL_PWD=task4; mysql -u root -e '$sql_stmt'"

