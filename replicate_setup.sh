
#!/bin/bash

#Added Replication on Master Node 2
master1_status=`docker exec master1 sh -c 'export MYSQL_PWD=task4; mysql -u root -e "SHOW MASTER STATUS"'`
master1_file=`echo $master1_status | awk '{print $6}'`
master1_pos=`echo $master1_status | awk '{print $7}'`


master1_stmt="CHANGE MASTER TO MASTER_HOST='master1',MASTER_USER='master_user',MASTER_PASSWORD='task4_pwd',MASTER_LOG_FILE='$master1_file',MASTER_LOG_POS=$master1_pos; START SLAVE;"
master1_cmd='export MYSQL_PWD=task4; mysql -u root -e "'
master1_cmd+="$master1_stmt"
master1_cmd+='"'
docker exec master2 sh -c "$master1_cmd"

docker exec master2 sh -c "export MYSQL_PWD=task4; mysql -u root -e 'SHOW SLAVE STATUS \G'"


#Added Replication on Master Node 1
master2_status=`docker exec master2 sh -c 'export MYSQL_PWD=task4; mysql -u root -e "SHOW MASTER STATUS"'`
master2_file=`echo $master2_status | awk '{print $6}'`
master2_pos=`echo $master2_status | awk '{print $7}'`

master2_stmt="CHANGE MASTER TO MASTER_HOST='master2',MASTER_USER='master_user',MASTER_PASSWORD='task4_pwd',MASTER_LOG_FILE='$master2_file',MASTER_LOG_POS=$master2_pos; START SLAVE;"
master2_cmd='export MYSQL_PWD=task4; mysql -u root -e "'
master2_cmd+="$master2_stmt"
master2_cmd+='"'
docker exec master1 sh -c "$master2_cmd"

docker exec master1 sh -c "export MYSQL_PWD=task4; mysql -u root -e 'SHOW SLAVE STATUS \G'"

