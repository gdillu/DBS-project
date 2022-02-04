# DBS-project
The Home expense Management system
It is Just a simple Prototype for Engineering 2nd year Stuents How the  Frontend And Backend Works.This Project is Done as a Part of Assigment
***************This is a just a prototype to understand,Not a final version***************
Process to be done:
## Install xampp latest version,and install mysql connector zip and tomcate server 9.0 package from your browser
CREATE TABLE Login(
  login_id INT(10)PRIMARY KEY AUTOINCREMENT,
  user_name VARCHAR(200) UNIQUE,
  password VARCHAR(200),
  currency INT(5),
  income INT(20),
  FOREIGN KEY currency REFERENCES Currency(c_id));
  
CREATE TABLE Currency(
    c_id INT(20) PRIMARY KEY AUTO INCREMENT,
    c_name VARCHAR(10),
    );

CREATE TABLE Category(
  cate_id INT(20) AUTO INCREMENT,
  cate_name VARCHAR(50) UNIQUE,
  );
********This is not the final version **************
CREATE TABLE Expense(
  Expense_id INT(20) PRIMARY KEY AUTO INCREMENT,
  dateq DATE,
  Item_Name VARCHAR(20),
  Notes VARHAR(100),
  Amt INT(10),
  login_id INT(10),
  Category_id INT(10),
  FOREIGN KEY Category_id REFERENCES Category(Cate_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY login_id REFERENCES Login(login_id) ON DELETE CASCADE ON UPDATE CASCADE);
  
These are the create tables for sql n phpmyadmin copy this and u are allset to go
