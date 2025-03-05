@echo off
echo Creating the project folder structure...

:: Create necessary directories
mkdir frontend
mkdir backend
mkdir database
mkdir .github\workflows

:: Create subdirectories in frontend
mkdir frontend\assets
mkdir frontend\components
mkdir frontend\responsive

:: Create subdirectories in backend (For future use if PHP or other backend services are added)
mkdir backend\api
mkdir backend\auth

:: Display confirmation
echo Directories created successfully.

:: Move frontend files
echo Moving frontend files...
move index.html frontend\
move styles.css frontend\
move script.js frontend\

:: Move database-related files if any
echo Moving database files...
move init.sql database\
move docker-compose.yml database\

:: Move GitHub Actions workflow files
echo Moving GitHub Actions files...
move deploy.yml .github\workflows\
move lint.yml .github\workflows\

:: Create Dockerfile for frontend (if not already present)
echo Creating Dockerfile for frontend...
echo FROM nginx:latest > Dockerfile
echo COPY frontend/ /usr/share/nginx/html >> Dockerfile
echo EXPOSE 80 >> Dockerfile
echo CMD ["nginx", "-g", "daemon off;"] >> Dockerfile

:: Create docker-compose.yml for local development (if not already present)
echo Creating docker-compose.yml for local development...
echo version: "3.8" > docker-compose.yml
echo services: >> docker-compose.yml
echo   frontend: >> docker-compose.yml
echo     build: . >> docker-compose.yml
echo     ports: >> docker-compose.yml
echo       - "80:80" >> docker-compose.yml
echo   db: >> docker-compose.yml
echo     image: mysql:5.7 >> docker-compose.yml
echo     restart: always >> docker-compose.yml
echo     environment: >> docker-compose.yml
echo       MYSQL_ROOT_PASSWORD: rootpassword >> docker-compose.yml
echo       MYSQL_DATABASE: bracket >> docker-compose.yml
echo       MYSQL_USER: admin >> docker-compose.yml
echo       MYSQL_PASSWORD: password >> docker-compose.yml
echo     ports: >> docker-compose.yml
echo       - "3306:3306" >> docker-compose.yml

:: Create deploy.sh script for deployment (optional, if planning to deploy via shell)
echo Creating deploy.sh script...
echo #!/bin/bash > deploy.sh
echo ecs-cli configure --cluster my-cluster --region us-east-1 --access-key AWS_ACCESS_KEY --secret-key AWS_SECRET_KEY >> deploy.sh
echo ecs-cli compose --file docker-compose.yml --project-name bracket service up >> deploy.sh

:: Display completion message
echo Project has been organized successfully!

:: End
pause
