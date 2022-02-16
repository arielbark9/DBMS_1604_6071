CREATE TABLE Area
(
  areaID NUMERIC(3) NOT NULL,
  areaName VARCHAR(20) NOT NULL,
  PRIMARY KEY (areaID)
);

CREATE TABLE City
(
  cityName VARCHAR(20) NOT NULL,
  areaID NUMERIC(3) NOT NULL,
  PRIMARY KEY (cityName, areaID),
  FOREIGN KEY (areaID) REFERENCES Area(areaID)
);

CREATE TABLE Agent
(
  agentID NUMERIC(9) NOT NULL,
  agentName VARCHAR(20) NOT NULL,
  Rating NUMERIC(2) NOT NULL,
  HireYear NUMERIC(4) NOT NULL,
  Salary FLOAT NOT NULL,
  areaID NUMERIC(3) NOT NULL,
  Manager_agentID NUMERIC(9) NOT NULL,
  PRIMARY KEY (agentID),
  FOREIGN KEY (areaID) REFERENCES Area(areaID),
  FOREIGN KEY (Manager_agentID) REFERENCES Agent(agentID)
);

CREATE TABLE Client
(
  clientID VARCHAR(9) NOT NULL,
  clientName VARCHAR(20) NOT NULL,
  phoneNr VARCHAR(10) NOT NULL,
  Address VARCHAR(25) NOT NULL,
  agentID NUMERIC(9) NOT NULL,
  cityName VARCHAR(20) NOT NULL,
  areaID NUMERIC(3) NOT NULL,
  PRIMARY KEY (clientID),
  FOREIGN KEY (agentID) REFERENCES Agent(agentID),
  FOREIGN KEY (cityName, areaID) REFERENCES City(cityName, areaID)
);

CREATE TABLE Meeting
(
  meetingTime DATE NOT NULL,
  agentID NUMERIC(9) NOT NULL,
  clientID VARCHAR(9) NOT NULL,
  PRIMARY KEY (meetingTime, agentID, clientID),
  FOREIGN KEY (agentID) REFERENCES Agent(agentID),
  FOREIGN KEY (clientID) REFERENCES Client(clientID)
);
