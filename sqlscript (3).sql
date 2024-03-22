REM   Script: finalcode
REM   final code

CREATE TABLE Ticket (  
    TicketID NUMBER PRIMARY KEY,  
    TravelerName VARCHAR2(255),  
    TripNumber NUMBER,  
    TripDate DATE,  
    SeatID NUMBER,  
    CarriageNumber NUMBER,  
    TrainNumber NUMBER,  
    SeatNumber NUMBER  
);

CREATE TABLE Train ( 
    TrainNumber NUMBER PRIMARY KEY, 
    Speed FLOAT, 
    CarriageCount NUMBER, 
    ModelNumber NUMBER, 
    Capacity NUMBER 
);

CREATE TABLE Station ( 
    StationCode VARCHAR2(10) PRIMARY KEY, 
    StationName VARCHAR2(255), 
    CityLocation VARCHAR2(255) 
);

CREATE TABLE Traveler ( 
    TravelerID NUMBER PRIMARY KEY, 
    FirstName VARCHAR2(255), 
    MiddleName VARCHAR2(255), 
    LastName VARCHAR2(255), 
    SSN VARCHAR2(20), 
    Age NUMBER, 
    PhoneNumber VARCHAR2(15), 
    Email VARCHAR2(255) 
);

CREATE TABLE Schedule ( 
    TripID NUMBER PRIMARY KEY, 
    TicketsAvailable NUMBER, 
    TicketsBooked NUMBER, 
    Distance FLOAT, 
    TicketPrice NUMBER(10, 2), 
    TripDate DATE, 
    DepartureStationCode VARCHAR2(10), 
    DepartureCity VARCHAR2(255), 
    DepartureTime TIMESTAMP, 
    ArrivalStationCode VARCHAR2(10), 
    ArrivalCity VARCHAR2(255), 
    ArrivalTime TIMESTAMP, 
    FOREIGN KEY (DepartureStationCode) REFERENCES Station(StationCode), 
    FOREIGN KEY (ArrivalStationCode) REFERENCES Station(StationCode) 
);

CREATE TABLE Travels_on (  
    TravelerID NUMBER,  
    TrainNumber NUMBER,  
      
    PRIMARY KEY (TravelerID, TrainNumber),  
    FOREIGN KEY (TravelerID) REFERENCES Traveler(TravelerID),  
    FOREIGN KEY (TrainNumber) REFERENCES Train(TrainNumber)  
) ;

CREATE TABLE Carriage ( 
    CarriageID NUMBER PRIMARY KEY, 
    TrainNumber NUMBER, 
    Capacity NUMBER, 
    Type VARCHAR2(255), 
    FOREIGN KEY (TrainNumber) REFERENCES Train(TrainNumber) 
);

INSERT INTO Ticket (TicketID, TravelerName, TripNumber, TripDate, SeatID, CarriageNumber, TrainNumber, SeatNumber) 
VALUES (1, 'John Doe', 101, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 1, 1, 101, 10);

INSERT INTO Ticket (TicketID, TravelerName, TripNumber, TripDate, SeatID, CarriageNumber, TrainNumber, SeatNumber) 
VALUES (2, 'Jane Smith', 102, TO_DATE('2024-03-16', 'YYYY-MM-DD'), 2, 1, 102, 5);

INSERT INTO Ticket (TicketID, TravelerName, TripNumber, TripDate, SeatID, CarriageNumber, TrainNumber, SeatNumber) 
VALUES (3, 'Alice Johnson', 103, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 3, 2, 101, 15);

INSERT INTO Ticket (TicketID, TravelerName, TripNumber, TripDate, SeatID, CarriageNumber, TrainNumber, SeatNumber) 
VALUES (4, 'Bob Brown', 104, TO_DATE('2024-03-18', 'YYYY-MM-DD'), 4, 2, 103, 20);

INSERT INTO Train (TrainNumber, Speed, CarriageCount, ModelNumber, Capacity) 
VALUES (101, 100.0, 5, 12345, 250);

INSERT INTO Train (TrainNumber, Speed, CarriageCount, ModelNumber, Capacity) 
VALUES (102, 120.0, 6, 54321, 300);

INSERT INTO Train (TrainNumber, Speed, CarriageCount, ModelNumber, Capacity) 
VALUES (103, 110.0, 4, 98765, 200);

INSERT INTO Carriage (CarriageID, TrainNumber, Capacity, Type) 
VALUES (1, 101, 50, 'First Class');

INSERT INTO Carriage (CarriageID, TrainNumber, Capacity, Type) 
VALUES (2, 102, 60, 'Economy');

INSERT INTO Carriage (CarriageID, TrainNumber, Capacity, Type) 
VALUES (3, 103, 40, 'Business');

INSERT INTO Station (StationCode, StationName, CityLocation) 
VALUES ('ST001', 'Station A', 'City A');

INSERT INTO Station (StationCode, StationName, CityLocation) 
VALUES ('ST002', 'Station B', 'City B');

INSERT INTO Station (StationCode, StationName, CityLocation) 
VALUES ('ST003', 'Station C', 'City C');

INSERT INTO Schedule (TripID, TicketsAvailable, TicketsBooked, Distance, TicketPrice, TripDate, DepartureStationCode, DepartureCity, DepartureTime, ArrivalStationCode, ArrivalCity, ArrivalTime) 
VALUES (101, 50, 20, 100.0, 50.00, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'ST001', 'City A', TO_TIMESTAMP('2024-03-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST002', 'City B', TO_TIMESTAMP('2024-03-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Schedule (TripID, TicketsAvailable, TicketsBooked, Distance, TicketPrice, TripDate, DepartureStationCode, DepartureCity, DepartureTime, ArrivalStationCode, ArrivalCity, ArrivalTime) 
VALUES (102, 60, 25, 120.0, 45.00, TO_DATE('2024-03-16', 'YYYY-MM-DD'), 'ST002', 'City B', TO_TIMESTAMP('2024-03-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST003', 'City C', TO_TIMESTAMP('2024-03-16 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Schedule (TripID, TicketsAvailable, TicketsBooked, Distance, TicketPrice, TripDate, DepartureStationCode, DepartureCity, DepartureTime, ArrivalStationCode, ArrivalCity, ArrivalTime) 
VALUES (103, 40, 15, 80.0, 60.00, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 'ST003', 'City C', TO_TIMESTAMP('2024-03-17 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST001', 'City A', TO_TIMESTAMP('2024-03-17 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Traveler (TravelerID, FirstName, MiddleName, LastName, SSN, Age, PhoneNumber, Email) 
VALUES (1, 'John', NULL, 'Doe', '123-45-6789', 30, '1234567890', 'john.doe@example.com');

INSERT INTO Traveler (TravelerID, FirstName, MiddleName, LastName, SSN, Age, PhoneNumber, Email) 
VALUES (2, 'Jane', NULL, 'Smith', '987-65-4321', 25, '9876543210', 'jane.smith@example.com');

INSERT INTO Traveler (TravelerID, FirstName, MiddleName, LastName, SSN, Age, PhoneNumber, Email) 
VALUES (3, 'Alice', NULL, 'Johnson', '456-78-9123', 35, '4567891230', 'alice.johnson@example.com');

INSERT INTO Traveler (TravelerID, FirstName, MiddleName, LastName, SSN, Age, PhoneNumber, Email) 
VALUES (4, 'Bob', NULL, 'Brown', '789-12-3456', 40, '7891234560', 'bob.brown@example.com');

INSERT INTO Travels_on (TravelerID, TrainNumber) VALUES (1, 101);

INSERT INTO Travels_on (TravelerID, TrainNumber) VALUES (2, 102);

INSERT INTO Travels_on (TravelerID, TrainNumber) VALUES (3, 101);

INSERT INTO Travels_on (TravelerID, TrainNumber) VALUES (4, 103);

SELECT * FROM Train;

SELECT StationCode, StationName FROM Station;

SELECT StationCode, StationName FROM Station;

SELECT s.DepartureCity, s.ArrivalCity, s.DepartureTime, s.Distance, s.TicketPrice, t.FirstName, t.PhoneNumber, t.Age 
FROM Schedule s 
JOIN Ticket tk ON s.TripID = tk.TripNumber 
JOIN Traveler t ON tk.TravelerName = t.FirstName || ' ' || t.LastName 
WHERE s.TripID = 101;

SELECT TripNumber, TicketID, TravelerName 
FROM Ticket 
WHERE TripDate = TO_DATE('2024-03-15', 'YYYY-MM-DD');

SELECT * 
FROM Ticket 
WHERE TravelerName = 'John Doe';

SELECT * 
FROM Schedule 
WHERE TripDate = TO_DATE('2024-03-15', 'YYYY-MM-DD');

SELECT TripID, TicketsAvailable 
FROM Schedule;

SELECT TripID, DepartureCity, ArrivalCity 
FROM Schedule;

SELECT SUM(TicketPrice) AS TotalRevenue 
FROM Schedule 
WHERE TripDate BETWEEN TO_DATE('2024-03-15', 'YYYY-MM-DD') AND TO_DATE('2024-03-17', 'YYYY-MM-DD');

SELECT AVG(Speed) AS AverageSpeed 
FROM Train;

SELECT DepartureCity, COUNT(*) AS DepartureCount 
FROM Schedule 
GROUP BY DepartureCity 
ORDER BY DepartureCount DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT ArrivalCity, COUNT(*) AS ArrivalCount 
FROM Schedule 
GROUP BY ArrivalCity 
ORDER BY ArrivalCount DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT * 
FROM Schedule 
ORDER BY DepartureTime;

SELECT t.TrainNumber, SUM(s.Distance) AS TotalDistance 
FROM Train t 
JOIN Schedule s ON t.TrainNumber = s.TripID 
GROUP BY t.TrainNumber;

SELECT TripNumber, COUNT(*) AS TotalTicketsBooked 
FROM Ticket 
GROUP BY TripNumber;

SELECT * 
FROM Traveler;

CREATE TABLE Ticket (  
    TicketID NUMBER PRIMARY KEY,  
    TravelerName VARCHAR2(255),  
    TripNumber NUMBER,  
    TripDate DATE,  
    SeatID NUMBER,  
    CarriageNumber NUMBER,  
    TrainNumber NUMBER,  
    SeatNumber NUMBER  
);

CREATE TABLE Train ( 
    TrainNumber NUMBER PRIMARY KEY, 
    Speed FLOAT, 
    CarriageCount NUMBER, 
    ModelNumber NUMBER, 
    Capacity NUMBER 
);

CREATE TABLE Station ( 
    StationCode VARCHAR2(10) PRIMARY KEY, 
    StationName VARCHAR2(255), 
    CityLocation VARCHAR2(255) 
);

CREATE TABLE Traveler ( 
    TravelerID NUMBER PRIMARY KEY, 
    FirstName VARCHAR2(255), 
    MiddleName VARCHAR2(255), 
    LastName VARCHAR2(255), 
    SSN VARCHAR2(20), 
    Age NUMBER, 
    PhoneNumber VARCHAR2(15), 
    Email VARCHAR2(255) 
);

CREATE TABLE Schedule ( 
    TripID NUMBER PRIMARY KEY, 
    TicketsAvailable NUMBER, 
    TicketsBooked NUMBER, 
    Distance FLOAT, 
    TicketPrice NUMBER(10, 2), 
    TripDate DATE, 
    DepartureStationCode VARCHAR2(10), 
    DepartureCity VARCHAR2(255), 
    DepartureTime TIMESTAMP, 
    ArrivalStationCode VARCHAR2(10), 
    ArrivalCity VARCHAR2(255), 
    ArrivalTime TIMESTAMP, 
    FOREIGN KEY (DepartureStationCode) REFERENCES Station(StationCode), 
    FOREIGN KEY (ArrivalStationCode) REFERENCES Station(StationCode) 
);

CREATE TABLE Travels_on (  
    TravelerID NUMBER,  
    TrainNumber NUMBER,  
      
    PRIMARY KEY (TravelerID, TrainNumber),  
    FOREIGN KEY (TravelerID) REFERENCES Traveler(TravelerID),  
    FOREIGN KEY (TrainNumber) REFERENCES Train(TrainNumber)  
) ;

CREATE TABLE Carriage ( 
    CarriageID NUMBER PRIMARY KEY, 
    TrainNumber NUMBER, 
    Capacity NUMBER, 
    Type VARCHAR2(255), 
    FOREIGN KEY (TrainNumber) REFERENCES Train(TrainNumber) 
);

INSERT INTO Ticket (TicketID, TravelerName, TripNumber, TripDate, SeatID, CarriageNumber, TrainNumber, SeatNumber) 
VALUES (1, 'John Doe', 101, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 1, 1, 101, 10);

INSERT INTO Ticket (TicketID, TravelerName, TripNumber, TripDate, SeatID, CarriageNumber, TrainNumber, SeatNumber) 
VALUES (2, 'Jane Smith', 102, TO_DATE('2024-03-16', 'YYYY-MM-DD'), 2, 1, 102, 5);

INSERT INTO Ticket (TicketID, TravelerName, TripNumber, TripDate, SeatID, CarriageNumber, TrainNumber, SeatNumber) 
VALUES (3, 'Alice Johnson', 103, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 3, 2, 101, 15);

INSERT INTO Ticket (TicketID, TravelerName, TripNumber, TripDate, SeatID, CarriageNumber, TrainNumber, SeatNumber) 
VALUES (4, 'Bob Brown', 104, TO_DATE('2024-03-18', 'YYYY-MM-DD'), 4, 2, 103, 20);

INSERT INTO Train (TrainNumber, Speed, CarriageCount, ModelNumber, Capacity) 
VALUES (101, 100.0, 5, 12345, 250);

INSERT INTO Train (TrainNumber, Speed, CarriageCount, ModelNumber, Capacity) 
VALUES (102, 120.0, 6, 54321, 300);

INSERT INTO Train (TrainNumber, Speed, CarriageCount, ModelNumber, Capacity) 
VALUES (103, 110.0, 4, 98765, 200);

INSERT INTO Carriage (CarriageID, TrainNumber, Capacity, Type) 
VALUES (1, 101, 50, 'First Class');

INSERT INTO Carriage (CarriageID, TrainNumber, Capacity, Type) 
VALUES (2, 102, 60, 'Economy');

INSERT INTO Carriage (CarriageID, TrainNumber, Capacity, Type) 
VALUES (3, 103, 40, 'Business');

INSERT INTO Station (StationCode, StationName, CityLocation) 
VALUES ('ST001', 'Station A', 'City A');

INSERT INTO Station (StationCode, StationName, CityLocation) 
VALUES ('ST002', 'Station B', 'City B');

INSERT INTO Station (StationCode, StationName, CityLocation) 
VALUES ('ST003', 'Station C', 'City C');

INSERT INTO Schedule (TripID, TicketsAvailable, TicketsBooked, Distance, TicketPrice, TripDate, DepartureStationCode, DepartureCity, DepartureTime, ArrivalStationCode, ArrivalCity, ArrivalTime) 
VALUES (101, 50, 20, 100.0, 50.00, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'ST001', 'City A', TO_TIMESTAMP('2024-03-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST002', 'City B', TO_TIMESTAMP('2024-03-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Schedule (TripID, TicketsAvailable, TicketsBooked, Distance, TicketPrice, TripDate, DepartureStationCode, DepartureCity, DepartureTime, ArrivalStationCode, ArrivalCity, ArrivalTime) 
VALUES (102, 60, 25, 120.0, 45.00, TO_DATE('2024-03-16', 'YYYY-MM-DD'), 'ST002', 'City B', TO_TIMESTAMP('2024-03-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST003', 'City C', TO_TIMESTAMP('2024-03-16 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Schedule (TripID, TicketsAvailable, TicketsBooked, Distance, TicketPrice, TripDate, DepartureStationCode, DepartureCity, DepartureTime, ArrivalStationCode, ArrivalCity, ArrivalTime) 
VALUES (103, 40, 15, 80.0, 60.00, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 'ST003', 'City C', TO_TIMESTAMP('2024-03-17 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST001', 'City A', TO_TIMESTAMP('2024-03-17 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Traveler (TravelerID, FirstName, MiddleName, LastName, SSN, Age, PhoneNumber, Email) 
VALUES (1, 'John', NULL, 'Doe', '123-45-6789', 30, '1234567890', 'john.doe@example.com');

INSERT INTO Traveler (TravelerID, FirstName, MiddleName, LastName, SSN, Age, PhoneNumber, Email) 
VALUES (2, 'Jane', NULL, 'Smith', '987-65-4321', 25, '9876543210', 'jane.smith@example.com');

INSERT INTO Traveler (TravelerID, FirstName, MiddleName, LastName, SSN, Age, PhoneNumber, Email) 
VALUES (3, 'Alice', NULL, 'Johnson', '456-78-9123', 35, '4567891230', 'alice.johnson@example.com');

INSERT INTO Traveler (TravelerID, FirstName, MiddleName, LastName, SSN, Age, PhoneNumber, Email) 
VALUES (4, 'Bob', NULL, 'Brown', '789-12-3456', 40, '7891234560', 'bob.brown@example.com');

INSERT INTO Travels_on (TravelerID, TrainNumber) VALUES (1, 101);

INSERT INTO Travels_on (TravelerID, TrainNumber) VALUES (2, 102);

INSERT INTO Travels_on (TravelerID, TrainNumber) VALUES (3, 101);

INSERT INTO Travels_on (TravelerID, TrainNumber) VALUES (4, 103);

SELECT * FROM Train;

SELECT StationCode, StationName FROM Station;

SELECT StationCode, StationName FROM Station;

SELECT s.DepartureCity, s.ArrivalCity, s.DepartureTime, s.Distance, s.TicketPrice, t.FirstName, t.PhoneNumber, t.Age 
FROM Schedule s 
JOIN Ticket tk ON s.TripID = tk.TripNumber 
JOIN Traveler t ON tk.TravelerName = t.FirstName || ' ' || t.LastName 
WHERE s.TripID = 101;

SELECT TripNumber, TicketID, TravelerName 
FROM Ticket 
WHERE TripDate = TO_DATE('2024-03-15', 'YYYY-MM-DD');

SELECT * 
FROM Ticket 
WHERE TravelerName = 'John Doe';

SELECT * 
FROM Schedule 
WHERE TripDate = TO_DATE('2024-03-15', 'YYYY-MM-DD');

SELECT TripID, TicketsAvailable 
FROM Schedule;

SELECT TripID, DepartureCity, ArrivalCity 
FROM Schedule;

SELECT SUM(TicketPrice) AS TotalRevenue 
FROM Schedule 
WHERE TripDate BETWEEN TO_DATE('2024-03-15', 'YYYY-MM-DD') AND TO_DATE('2024-03-17', 'YYYY-MM-DD');

SELECT AVG(Speed) AS AverageSpeed 
FROM Train;

SELECT DepartureCity, COUNT(*) AS DepartureCount 
FROM Schedule 
GROUP BY DepartureCity 
ORDER BY DepartureCount DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT ArrivalCity, COUNT(*) AS ArrivalCount 
FROM Schedule 
GROUP BY ArrivalCity 
ORDER BY ArrivalCount DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT * 
FROM Schedule 
ORDER BY DepartureTime;

SELECT t.TrainNumber, SUM(s.Distance) AS TotalDistance 
FROM Train t 
JOIN Schedule s ON t.TrainNumber = s.TripID 
GROUP BY t.TrainNumber;

SELECT TripNumber, COUNT(*) AS TotalTicketsBooked 
FROM Ticket 
GROUP BY TripNumber;

SELECT * 
FROM Traveler;

