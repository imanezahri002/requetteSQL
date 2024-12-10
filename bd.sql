-- name:ZAHRI IMANE
-- email:imanezahri4@gmail.com

-- creation dB
CREATE DATABASE streamovies;

-- utilisation dB pour  creation des tables
USE streamovies;

-- creation 1st table subscription
CREATE TABLE subscription(
    subscriptionId int AUTO_INCREMENT PRIMARY KEY,
    subscriptionType ENUM('premium','basic'),
    monthlyFee DECIMAL(10,2) NOT NULL
);

-- create 2nd table users
CREATE TABLE users(
    userId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    registrationDate DATE NOT NULL,
    subscriptionId INT NOT NULL, 
    FOREIGN KEY (subscriptionId) REFERENCES subscription(subscriptionId)
);

-- create 3rd table movie
CREATE TABLE movie(
    movieId INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    releaseYear INT NOT NULL, 
    duration int NOT NULL,
    rating VARCHAR(10) NOT NULL
);

-- create 4th table whatchistory
CREATE TABLE whatchhistory(
    whatchhistoryId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
        FOREIGN KEY (userId) REFERENCES users(userId),
    movieId INT NOT NULL,
        FOREIGN KEY (movieId) REFERENCES movie(movieId),
    whatchDate DATE NOT NULL,
    completionPercentage INT NOT NULL DEFAULT 0
);

-- create the last table review
CREATE TABLE review(
    reviewId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
        FOREIGN KEY (userId) REFERENCES users(userId),
    movieId INT NOT NULL,
        FOREIGN KEY (movieId) REFERENCES movie(movieId),
    rating INT NOT NULL DEFAULT 0,
    reviewText TEXT NULL,
    reviewDate DATE
);
--requete un
INSERT INTO movie (title, genre, releaseYear, duration,rating)
VALUES ('Data Science Adventures', 'Documentary', 2021,100,'L');
--requete deux Rechercher des films : Lister tous les films du genre "Comedy" sortis après 2020
SELECT * FROM movie WHERE genre="Comedy" AND releaseYear>2020
-- requete trois Mise à jour des abonnements : Passer tous les utilisateurs de "Basic" à "Premium"
UPDATE `users` SET `subscriptionId`=2;
--requete quatre Afficher les abonnements : Joindre les utilisateurs à leurs types d'abonnements.
SELECT firstName,lastName,subscriptionType FROM users s INNER JOIN subscription sub ON s.subscriptionId=sub.subscriptionId;
--requete cinq: Filtrer les visionnages : Trouver tous les utilisateurs ayant terminé de regarder un film.
SELECT firstName,lastName FROM users s INNER JOIN watchhistory w ON s.userId=w.userId WHERE completionPercentage=100;

