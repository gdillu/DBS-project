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


********This is not the final version ************

# Queries used
"INSERT INTO login(user_name,password,income,Currency) VALUES(?,?,?,?)"
"SELECT login_id,expense_id,dateq,Item_name,Amt,Notes FROM expense WHERE expense_id="+id;
"Update expense set login_id=?,categoty_id=?,Item_name=?,dateq=?,Amt=?,Notes=? where expense_id=id
DELETE FROM expense WHERE expense_id="+id
"SELECT c.cate_name,SUM(e.Amt) FROM category c,expense e WHERE e.login_id="+userid+" AND c.category_id=e.categoty_id GROUP BY e.categoty_id";
query="SELECT l.user_name,c.c_name,l.income FROM login l,Currency c WHERE login_id="+userid+" AND c.c_id=l.Currency";
query2="SELECT e.dateq,c.cate_name,e.Item_name,e.Amt,e.expense_id FROM expense e,category c,login l WHERE e.login_id=l.login_id AND c.category_id=e.categoty_id AND l.login_id="+userid;
query3="SELECT SUM(e.Amt) FROM expense e,login l WHERE e.login_id=l.login_id AND e.login_id="+userid;
SELECT login_id FROM login WHERE user_name=\""+user+"\" AND password=\""+pass+"\""
