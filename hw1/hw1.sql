CREATE TABLE Branch
(
  ID INT NOT NULL,
  location INT NOT NULL,
  yearStart INT NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Permanent-Equipment
(
  ID INT NOT NULL,
  lastMaintenance INT NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Renewing-Equipment
(
  ID INT NOT NULL,
  lastRenew INT NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Worker
(
  ID INT NOT NULL,
  type INT NOT NULL,
  citizenship INT NOT NULL,
  gender INT NOT NULL,
  startDate INT NOT NULL,
  birthDate INT NOT NULL,
  ID INT NOT NULL,
  ManagesID INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Branch(ID),
  FOREIGN KEY (ManagesID) REFERENCES Branch(ID)
);
