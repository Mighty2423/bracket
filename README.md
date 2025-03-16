# Bracket Tournament Management System
Bracket is a web-based tournament management system for volleyball tournaments. It includes a frontend for users, a PHP backend for business logic, and a MySQL database hosted on AWS RDS. The entire application is containerized using Docker and deployed to AWS ECS.

## Features
- User registration and login
- Team management
- Tournament scheduling
- Match tracking
- Automated database setup using AWS RDS

## Project Structure
```
bracket/
├── backend/
│   ├── Dockerfile-backend  # Backend Dockerfile
│   ├── db_connect.php      # Database connection script
│   ├── fetch_schedule.php  # Fetch tournament schedule
│   └── register.php        # User registration logic
├── frontend/
│   ├── Dockerfile-frontend # Frontend Dockerfile (nginx)
│   ├── index.html          # Main website page
│   ├── schedule.html
│   ├── script.js           # JavaScript logic
│   └── styles.css          # CSS styles
├── database/
│   ├── database.sql        # SQL schema for database setup
└── docker/
    ├── deploy.sh           # Deployment script
    ├── docker-compose.yml  # Docker compose file for all services
    ├── Dockerfile          # Optional: Combined Dockerfile for the project
```

## Prerequisites
Before you start, ensure you have the following installed:
- Docker
- Docker Compose
- AWS CLI configured with necessary permissions
Install Required Packages
You'll need Nginx, MySQL (or use Docker for it), Docker, and Docker Compose.
Update System & Install Basics
sudo yum update -y
sudo yum install -y git unzip
Install Docker
sudo yum install -y docker
sudo systemctl enable docker
sudo systemctl start docker
•	Add your user to the docker group (so you don’t need sudo for Docker commands): 
sudo usermod -aG docker ec2-user
Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
(Optional) Install MySQL (if not using Docker)
sudo yum install -y mariadb-server
sudo systemctl enable mariadb
sudo systemctl start mariadb
•	Secure the MySQL installation: 
sudo mysql_secure_installation

## Setup and Installation
### 1️⃣ Clone the Repository
```sh
git clone https://github.com/Mighty2423/bracket.git
cd bracket/docker
```

### 2️⃣ Build and Run the Services Locally (For Testing)
```sh
docker-compose up --build
```

### 3️⃣ Verify Services Are Running
Check running containers:
```sh
docker ps
```
Expected services:
- **frontend** (NGINX)
- **backend** (PHP)
- **db** (AWS RDS - No local container needed)

### 4️⃣ Check Database Setup in AWS RDS
To verify database tables:
```sh
mysql -h bracket.xxxxxxx.us-east-1.rds.amazonaws.com -uadmin -ppassword -e "SHOW TABLES IN bracket;"
```
Expected tables:
- Users
- Teams
- Tournaments
- Matches
- Locations
- Registrations

## Deploying to AWS

### 1️⃣ **Setup AWS RDS for MySQL**
- Go to **AWS RDS** and create a MySQL database.
- Set database name: `bracket`
- Set username: `admin`
- Store password securely in **AWS Secrets Manager**.

### 2️⃣ **Deploy Backend & Frontend to AWS ECS**
- Build Docker images and push to **ECR**:
  ```sh
  docker build -t bracket-backend ./backend
  docker build -t bracket-frontend ./frontend
  ```
- Create **ECS Fargate Services** for frontend and backend.
- Use an **Application Load Balancer (ALB)** for traffic routing.

### 3️⃣ **Update Nginx for AWS**
Ensure `nginx.conf` correctly routes requests:
```nginx
location /api/ {
    proxy_pass http://backend-service:8080/; # Use ECS Service Name
}
```

### 4️⃣ **Monitor Logs in CloudWatch**
Check logs:
```sh
aws logs describe-log-groups --query "logGroups[*].logGroupName"
aws logs tail /ecs/backend-service
```

## Stopping and Cleaning Up
To stop containers locally:
```sh
docker-compose down
```
To remove all containers and volumes locally:
```sh
docker-compose down -v
```

For AWS, delete ECS services, ECR images, and RDS instances when finished.

## Troubleshooting
### Problem: Database not connecting
✅ Ensure that the **RDS instance is publicly accessible** and allows inbound MySQL connections (port 3306).
✅ Check **Security Groups** in AWS and allow traffic from ECS.
✅ Verify **database credentials** stored in AWS Secrets Manager.

### Problem: Containers fail to start
✅ Run `docker-compose up --build` to rebuild images.
✅ Use `docker logs <container_id>` for debugging errors.

## Future Improvements
- Implement authentication system
- Improve UI/UX
- Add tournament analytics
- Optimize AWS deployment for scalability
