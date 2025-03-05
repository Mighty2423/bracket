@echo off
echo Organizing project files based on your GitHub repository...

:: Create necessary directories
mkdir frontend
mkdir backend
mkdir database
mkdir .github\workflows

:: Create subdirectories in frontend
mkdir frontend\assets
mkdir frontend\components
mkdir frontend\responsive

:: Create subdirectories in backend (for future use)
mkdir backend\api
mkdir backend\auth

:: Display confirmation
echo Directories created successfully.

:: Move frontend files to frontend directory
echo Moving frontend files...
move index.html frontend\
move styles.css frontend\
move script.js frontend\

:: If there are any database files (you don't have any yet), move them here
echo Moving database files (if any)...
:: move init.sql database\

:: Move GitHub Actions files into workflows directory
echo Moving GitHub Actions files...
move .github\deploy.yml .github\workflows\
move .github\lint.yml .github\workflows\

:: Create Dockerfile for frontend (if you want to containerize the frontend)
echo Creating Dockerfile for frontend...
echo FROM nginx:latest > frontend\Dockerfile
echo COPY frontend/ /usr/share/nginx/html >> frontend\Dockerfile
echo EXPOSE 80 >> frontend\Dockerfile
echo CMD ["nginx", "-g", "daemon off;"] >> frontend\Dockerfile

:: Create docker-compose.yml for local development (optional)
echo Creating docker-compose.yml for local development...
echo version: "3.8" > docker-compose.yml
echo services: >> docker-compose.yml
echo   frontend: >> docker-compose.yml
echo     build: ./frontend >> docker-compose.yml
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

:: Display success message
echo Project files have been successfully organized.

:: Pause to keep the window open
pause

