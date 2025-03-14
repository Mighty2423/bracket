export AWS_ACCESS_KEY=$(aws secretsmanager get-secret-value --secret-id mySecret | jq -r .SecretString | jq -r .AWS_ACCESS_KEY)
export AWS_SECRET_KEY=$(aws secretsmanager get-secret-value --secret-id mySecret | jq -r .SecretString | jq -r .AWS_SECRET_KEY)

ecs-cli configure --cluster my-cluster --region us-east-1
ecs-cli compose --file docker-compose.yml --project-name bracket service up
chmod +x deploy.sh
