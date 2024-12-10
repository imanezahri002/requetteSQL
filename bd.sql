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


