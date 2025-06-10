CREATE DATABASE Academy_dz2;

GO;

USE Academy_dz2;

GO;

CREATE TABLE Groups(
    Id int primary key identity NOT NULL,
	Naame nvarchar(10) unique NOT NULL,
	Rating int check(1 <= Rating AND Rating <= 5) NOT NULL,
	Yeaar int check(1 <= Yeaar AND Yeaar <= 5) NOT NULL
);

GO;

CREATE TABLE Departments(
    Id int primary key identity NOT NULL,
	Financing money check(Financing >= 0) default(0) NOT NULL,
	Naame nvarchar(100) unique NOT NULL
);

GO;

CREATE TABLE Faculties(
    Id int primary key identity NOT NULL,
	Naame nvarchar(100) unique NOT NULL
);

GO;

CREATE TABLE Teachers(
    Id int primary key identity NOT NULL,
	EmploymentDate date check(EmploymentDate >= 1990-01-01) NOT NULL,
	Naame nvarchar(max) NOT NULL,
	Premium money check(Premium >= 0) default(0) NOT NULL,
	Salary money check(Salary > 0) NOT NULL,
	Surname nvarchar(max) NOT NULL
)

GO;