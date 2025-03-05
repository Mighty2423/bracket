#!/bin/bash 
ecs-cli configure --cluster my-cluster --region us-east-1 --access-key AWS_ACCESS_KEY --secret-key AWS_SECRET_KEY 
ecs-cli compose --file docker-compose.yml --project-name bracket service up 
