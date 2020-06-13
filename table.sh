#!/bin/bash

echo "Creating Table from master1"
docker exec -it master1 sh -c 'export MYSQL_PWD=task4; mysql -u root -e "CREATE TABLE task4db.Task4 (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, firstname VARCHAR(30) NOT NULL, lastname VARCHAR(30) NOT NULL, email VARCHAR(50))"'

echo "Viewing Table from master2"
docker exec -it master2 sh -c 'export MYSQL_PWD=task4; mysql -u root -e "show tables in task4db;"'

