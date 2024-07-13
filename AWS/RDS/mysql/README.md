# DB RESTORE ON AWS USING TERRAFORM

Useful commands
=================

- terraform init
- terraform plan
- terraform apply
- aws configure 
- aws rds describe-orderable-db-instance-options --engine mysql --db-instance-class db.t2.micro --region eu-north-1


db_instance_endpoint = "mysqlinstance.cn6qeai2cnp3.eu-north-1.rds.amazonaws.com:3306"
security_group_id = "sg-01650122ee6fe456c"

mysql -h mysql–instance1.123456789012.us-east-1.rds.amazonaws.com -P 3306 -u mymasteruser -p

1. Install tmux ( sudo apt install tmux )
2. Install mysql ( sudo apt install mysql-client-core-8.0 )
3. Install Pipe Viewer ( sudo apt-get install pv )
4. Prepare the database backup (.sql file)
5. Start a new tmux session ( tmux new-session -t database-restore )
6. Run the pv command to start the restore ( pv [backupfile_name].sql | mysql -u [username] -p -h [host] [database_name] )
7. Enter the database password
8. Monitor the progress 


