USE lab_mysql;

CREATE TABLE Cars (
  CarID TINYINT(2) NOT NULL AUTO_INCREMENT, 
  VIN CHAR(17) NOT NULL, 
  Manufacturer VARCHAR(20), 
  Model VARCHAR(20), 
  Year YEAR, 
  Color VARCHAR(10),
  PRIMARY KEY (CarID)
);

CREATE TABLE Customers (
  CustomerID SMALLINT(4) AUTO_INCREMENT, 
  ClientID CHAR(4) NOT NULL, 
  Name VARCHAR(40) NOT NULL, 
  Phone VARCHAR(20) NOT NULL, 
  Email VARCHAR(40), 
  Address VARCHAR(40), 
  City VARCHAR(20), 
  StateProvince VARCHAR(20), 
  Country VARCHAR(30), 
  PostalCode VARCHAR(10),
  PRIMARY KEY (CustomerID)
);

CREATE TABLE Salespersons (
  SalespersonID TINYINT(2) AUTO_INCREMENT, 
  StaffID CHAR(4) NOT NULL, 
  Name VARCHAR(40) NOT NULL, 
  Store VARCHAR(40),
  PRIMARY KEY (SalespersonID)
);

CREATE TABLE Invoices (
  InvoiceID SMALLINT(5) AUTO_INCREMENT, 
  InvoiceNumber INT(9) NOT NULL, 
  Date DATE, 
  CarID TINYINT(2) NOT NULL, 
  CustomerID SMALLINT(4) NOT NULL, 
  SalespersonID TINYINT(2) NOT NULL,
  PRIMARY KEY (InvoiceID),
  FOREIGN KEY (CarID) REFERENCES Cars(CarID),
  FOREIGN KEY (SalespersonID) REFERENCES Salespersons(SalespersonID),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);