CREATE DATABASE Academy_dz2;


USE Academy_dz2;


CREATE TABLE Groups(
    Id int primary key identity NOT NULL,
	Naame nvarchar(10) unique NOT NULL,
	Rating int check(1 <= Rating AND Rating <= 5) NOT NULL,
	Yeaar int check(1 <= Yeaar AND Yeaar <= 5) NOT NULL
);


CREATE TABLE Departments(
    Id int primary key identity NOT NULL,
	Financing money check(Financing >= 0) default(0) NOT NULL,
	Naame nvarchar(100) unique NOT NULL
);


CREATE TABLE Faculties(
    Id int primary key identity NOT NULL,
	Dean nvarchar(max) NOT NULL,
	Naame nvarchar(100) unique NOT NULL
);


CREATE TABLE Teachers(
    Id int primary key identity NOT NULL,
	EmploymentDate date check(EmploymentDate >= '1990-01-01') NOT NULL,
	IsAssistant bit default(0) NOT NULL,
	IsProfessor bit default(0) NOT NULL,
	Naame nvarchar(max) NOT NULL,
	Position nvarchar(max) NOT NULL,
	Premium money check(Premium >= 0) default(0) NOT NULL,
	Salary money check(Salary > 0) NOT NULL,
	Surname nvarchar(max) NOT NULL
);
--1
SELECT Naame, Financing, Id FROM Departments;
--2
SELECT Naame AS [Group Name], Rating AS [Group Rating] FROM Groups;
--3
SELECT
  Surname,
  CASE 
    WHEN Premium > 0 
    THEN Salary * 100.0 / Premium 
    ELSE NULL 
  END AS "%ставки до надбавки",
  CASE 
    WHEN (Salary + Premium) > 0 
    THEN Salary * 100.0 / (Salary + Premium) 
    ELSE NULL 
  END AS "%ставки до зарплати"
FROM Teachers;
--4
SELECT Concat('The dean of faculty ',Naame, ' is ', Dean) AS Faculties_and_deans FROM Faculties;
--5
SELECT Surname FROM Teachers WHERE IsProfessor = 1 AND Salary > 1050;
--6
SELECT Naame FROM Departments WHERE Financing < 11000 OR Financing > 25000;
--7
SELECT Naame FROM Faculties WHERE Naame != 'Computer Science' ;
--8
SELECT Surname, Position FROM Teachers WHERE IsProfessor = 0 ;
--9
SELECT Surname, Position, Salary, Premium FROM Teachers WHERE 160 <= Premium AND Premium <= 550 ;
--10
SELECT Surname, Salary FROM Teachers WHERE IsAssistant = 1;
--11
SELECT Surname, Position FROM Teachers WHERE EmploymentDate < '2000-01-01' ;
--12
SELECT Naame AS [Name of Department] FROM Departments WHERE Naame < 'Software Development' ORDER BY Naame;
--13
SELECT Surname FROM Teachers WHERE IsAssistant = 1 AND (Salary + Premium) < 1200;
--14
SELECT Naame FROM Groups WHERE Yeaar = 5 AND 2 <= Rating AND Rating <= 4;
--15
SELECT Surname FROM Teachers WHERE IsAssistant = 1 AND Salary < 550 OR Premium < 200;