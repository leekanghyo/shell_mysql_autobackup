# shell_mysql_autobackup
 How to auto backup mysql on linux.

<b>1. Register loginpath with mysql_config_editor</b>
<pre>
 <code>
  $mysql_config_editor set --login-path=[path name] --host=[host addr] --user=[account name] --password --port=[port number] --socket=[soket number]
 </code>
</pre>
<b>2. Write shell script(ex - db_backup.sh)</b>
<pre>
 <code>
  #!bin/sh
  
  DATE=$(date +%Y%m%d)
  
  # connect and create backup sql file.
  /usr/bin/mysqldump --login-path=[path name] [DB name] > /home/[Your Backup Folder]/mysql_back_${DATE}.sql
  
  # Owned by the root account.
  chown root:root /home/[Your Backup Folder]/mysql_back_${DATE}.sql
  
  # Non-root users can only read
  chmod 755 /home/[Your Backup Folder]/mysql_back_${DATE}.sql
 
 </code>
</pre>
<b>3. Grant execute permission on the file</b>
<pre>
 <code>
  $chmod -x db_backup.sh
 </code>
</pre>
<b>4. edit crontab</b>
<p>
<pre>
 <code>
  $crontab -e
 </code>
</pre>

Specify a file to run regularly in crontab, like this.
<pre>
 <code>
  #Run every hour at 0
  0 0 * * * /bin/sh db_backup.sh > /dev/null 2>&1
 </code>
</pre>
</p>
