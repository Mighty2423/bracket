# Bracket Tournament Management System

Bracket is a web-based tournament management system for volleyball tournaments. It includes a frontend for users, a PHP backend for business logic, and a MySQL database for storing tournament data. The entire application is containerized using Docker.

## Features
- User registration and login
- Team management
- Tournament scheduling
- Match tracking
- Automated database setup using Docker

---

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

---

## Prerequisites
Before you start, ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

---

## Setup and Installation
### 1️⃣ Clone the Repository
```sh
git clone https://github.com/Mighty2423/bracket.git
cd bracket/docker
```

### 2️⃣ Build and Run the Services
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
- **db** (MySQL)

### 4️⃣ Check Database Setup
To verify database tables:
```sh
docker exec -it <db_container_id> mysql -uadmin -ppassword -e "SHOW TABLES IN bracket;"
```
Expected tables:
- Users
- Teams
- Tournaments
- Matches
- Locations
- Registrations

---

## Stopping and Cleaning Up
To stop containers:
```sh
docker-compose down
```

To remove all containers and volumes:
```sh
docker-compose down -v
```

---

## Troubleshooting
**Problem:** MySQL database not initializing properly.
- Ensure the `database.sql` file is correctly mapped in `docker-compose.yml`:
  ```yaml
  volumes:
    - ./database/database.sql:/docker-entrypoint-initdb.d/database.sql
  ```

**Problem:** Containers fail to start
- Run `docker-compose up --build` to rebuild images
- Use `docker logs <container_id>` for debugging

---

## Future Improvements
- Implement authentication system
- Improve UI/UX
- Add tournament analytics
- Deploy to AWS using ECS and RDS

---

## Contributors
- **Alton [Your Name]** - Developer
- **[Team Member Names]** - Roles

---

## License
This project is open-source under the MIT License.