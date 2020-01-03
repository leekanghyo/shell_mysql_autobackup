#!bin/sh

DATE=$(date +%Y%m%d)

/usr/bin/mysqldump --login-path=overload MyDB > /home/dev_backup/mysql_MyDB_back_${DATE}.sql
chown root:root /home/dev_backup/mysql_MyDB_back_${DATE}.sql
chmod 755 //home/dev_backup/mysql_MyDB_back_${DATE}.sql
