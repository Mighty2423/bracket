CREATE DATABASE VolleyballTournament; 
USE VolleyballTournament;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    role ENUM('player', 'coach', 'parent', 'organizer'),
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip_code VARCHAR(20)
);

CREATE TABLE Teams (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    coach_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (coach_id) REFERENCES Users(user_id) ON DELETE SET NULL
);

CREATE TABLE Tournaments (
    tournament_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES Locations(location_id) ON DELETE SET NULL
);

CREATE TABLE Matches (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_id INT,
    team1_id INT,
    team2_id INT,
    score_team1 INT DEFAULT 0,
    score_team2 INT DEFAULT 0,
    match_time DATETIME,
    location_id INT,
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id),
    FOREIGN KEY (team1_id) REFERENCES Teams(team_id),
    FOREIGN KEY (team2_id) REFERENCES Teams(team_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

CREATE TABLE Registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    tournament_id INT,
    team_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Schedule (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT,
    match_time DATETIME NOT NULL,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id) ON DELETE CASCADE
);


INSERT INTO Users (name, email, role, password) VALUES
('Alice Johnson', 'alice@example.com', 'player', 'hashedpass1'),
('Bob Smith', 'bob@example.com', 'coach', 'hashedpass2'),
('Charlie Brown', 'charlie@example.com', 'parent', 'hashedpass3'),
('David Wilson', 'david@example.com', 'organizer', 'hashedpass4'),
('Emma Davis', 'emma@example.com', 'player', 'hashedpass5'),
('Frank Green', 'frank@example.com', 'coach', 'hashedpass6'),
('Grace Hall', 'grace@example.com', 'parent', 'hashedpass7');
INSERT INTO Locations (name, address, city, state, zip_code) VALUES
('Central Sports Complex', '123 Main St', 'New York', 'NY', '10001'),
('East Side Gym', '456 East St', 'Los Angeles', 'CA', '90001'),
('Westfield Arena', '789 West St', 'Chicago', 'IL', '60601');
INSERT INTO Teams (name, coach_id) VALUES
('Red Hawks', 2),
('Blue Warriors', 6),
('Green Titans', 2);
INSERT INTO Tournaments (name, start_date, end_date, location_id) VALUES
('Spring Volleyball Tournament', '2025-04-01', '2025-04-05', 1),
('Summer Championship', '2025-06-10', '2025-06-15', 2);
INSERT INTO Matches (tournament_id, team1_id, team2_id, score_team1, score_team2, match_time, location_id) VALUES
(1, 1, 2, 25, 22, '2025-04-01 10:00:00', 1),
(1, 2, 3, 18, 25, '2025-04-02 14:00:00', 1),
(2, 1, 3, 21, 25, '2025-06-11 12:00:00', 2);
INSERT INTO Registrations (user_id, tournament_id, team_id) VALUES
(1, 1, 1),
(5, 1, 1),
(6, 2, 2),
(3, 1, 3),
(2, 2, 2);
INSERT INTO Schedule (match_id, match_time) VALUES
(1, '2025-04-01 10:00:00'),
(2, '2025-04-02 14:00:00'),
(3, '2025-06-11 12:00:00');
