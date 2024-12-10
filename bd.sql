--NAME: imane zahri
--EMAIL: imanezahri4@gmail.com


CREATE DATABASE streamfilms;

--creation de la table user
CREATE TABLE users (
userId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
firstName VARCHAR(100) NOT NULL,
lastName VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
registrationDate DATE NOT NULL,
subscriptionId INT NOT NULL
);
--creation de la table subscription
CREATE TABLE subscription (
    subscriptionId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    subscriptionType VARCHAR(100) NOT NULL,
)
--liaison du cle etrangere
ALTER TABLE users 
ADD CONSTRAINT idSub FOREIGN KEY (subscriptionId) REFERENCES subscription(subscriptionId)
--creation de la table review
CREATE TABLE review(
reviewId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
userId INT NOT NULL,
movieId INT NOT NULL,
rating INT NOT NULL,
reviewText TEXT NOT NULL,
reviewDate DATE NOT NULL
);
--creation de la table  movie
CREATE TABLE movie( 
movieId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
title VARCHAR(255) NOT NULL,
genre VARCHAR(100),
releaseYear INT NOT NULL,
duration INT NOT NULL,
rating VARCHAR(10)NOT NULL 
);
--ajout du cle etrangere userId a la table movie
ALTER TABLE review
ADD CONSTRAINT idUSER FOREIGN KEY (userId) REFERENCES users(userId)
--ajout du cle etrangere movieId a la table movie
ALTER TABLE review
ADD CONSTRAINT idMovie FOREIGN KEY (movieId) REFERENCES movie(movieId)
-- modification sur type data du champ reviewText
ALTER TABLE review 
MODIFY COLUMN reviewText TEXT NULL;
--creation de la table watchhistory
CREATE TABLE watchhistory(
watchhistoryId INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
userId INT NOT NULL,
movieId INT NOT NULL,
watchDate DATE NOT NULL,
completionPercentage INT DEFAULT 0
)
--ajout de la contrainte de la cle etrangere 
ALTER TABLE watchhistory
ADD CONSTRAINT movieid FOREIGN KEY (movieId) REFERENCES movie(movieId)

--ajout de la contrainte de la cle etrangere 
ALTER TABLE watchhistory
ADD CONSTRAINT userid FOREIGN KEY (userId) REFERENCES users(userId)

