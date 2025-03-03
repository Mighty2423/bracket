# Bracket Project

## Setup Instructions

### 1. **Docker Setup**
- Clone the repository and navigate to the project directory.
- Build the Docker containers using:
  ```bash
  docker-compose up --build
  ```
- Access the app at `http://localhost:8080`.

### 2. **Connecting to RDS**
- Set up **Amazon RDS** and create a MySQL database instance.
- In the `db_connect.php` file, update the database connection with your RDS credentials:
  ```php
  $servername = "your-rds-endpoint";
  $username = "your-username";
  $password = "your-password";
  $dbname = "your-database-name";
  ```
  
### 3. **Deploy to AWS ECS**
- Make sure the Docker image is pushed to **Amazon ECR**.
- Use the ECS deploy GitHub Action to deploy the app to ECS after pushing to the `main` branch.

---

This structure should guide the user on how to connect the system. Let me know if you need further adjustments!