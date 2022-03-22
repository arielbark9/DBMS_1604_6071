<--Drop TABLE Branch CASCADE CONSTRAINTS;
<--Drop TABLE Permanent_Equipment;
<--Drop TABLE Renewing_Equipment;
<--Drop TABLE Equipment;
<--Drop TABLE Worker;


CREATE TABLE Branch
(
  ID INT,
  location Varchar(20) NOT NULL,
  yearStart INT NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Equipment
(
  ID INT,
  equipmentName Varchar(20),
  PRIMARY KEY (ID)
);

CREATE TABLE Permanent_Equipment
(
  ID INT,
  branchID INT NOT NULL,
  equipmentID INT NOT NULL,
  lastMaintenance Date,
  PRIMARY KEY (ID),
  FOREIGN KEY (branchID) REFERENCES Branch(ID),
  FOREIGN KEY (equipmentID) REFERENCES Equipment(ID)
);

CREATE TABLE Renewing_Equipment
(
  ID INT,
  lastRenew Date,
  branchID INT NOT NULL,
  equipmentID INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (branchID) REFERENCES Branch(ID),
  FOREIGN KEY (equipmentID) REFERENCES Equipment(ID)
);

CREATE TABLE Worker
(
  ID INT,
  workerType Varchar(20),
  citizenship Varchar(20),
  gender Char,
  startDate Date NOT NULL,
  birthDate Date NOT NULL,
  branchID INT NOT NULL,
  manager INT not null,
  PRIMARY KEY (ID),
  FOREIGN KEY (branchID) REFERENCES Branch(ID),
  Check(gender = 'M' OR gender = 'F')
);
