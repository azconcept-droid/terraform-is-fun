# Cloud SQL with Terraform
- mkdir sql-with-terraform
- cd sql-with-terraform
- gsutil cp -r gs://spls/gsp234/gsp234.zip .
- unzip gsp234.zip
- terraform init
- terraform plan -out=tfplan
- terraform apply tfplan

- wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy

When you start the proxy, you provide it with the following sets of information:

    What Cloud SQL instances it should establish connections to
    Where it will listen for data coming from your application to be sent to Cloud SQL
    Where it will find the credentials it will use to authenticate your application to Cloud SQL

export GOOGLE_PROJECT=$(gcloud config get-value project)

MYSQL_DB_NAME=$(terraform output -json | jq -r '.instance_name.value')
MYSQL_CONN_NAME="${GOOGLE_PROJECT}:us-west1:${MYSQL_DB_NAME}"

./cloud_sql_proxy -instances=${MYSQL_CONN_NAME}=tcp:3306

Now you'll start another Cloud Shell tab by clicking on plus (+) icon. You'll use this shell to connect to the Cloud SQL proxy.

echo MYSQL_PASSWORD=$(terraform output -json | jq -r '.generated_user_password.value')

mysql -udefault -p --host 127.0.0.1 default