# Retail-Business-Management-System
A Retail Busines System is a system designed to simplify the management of online retail store activities using PLSQL, SQL(Backend) and Java(User Friendly Interface) 

Functionalities of above system includes customer ordering any item and the way it will affect other factors such as Updation of Total items in warehouse, If quantity less than required quantity then order the items from supplier, supplier info, Purchase items history, invoice generation, Employees information, Discount information etc.

#Design
-------------
Gathered Information, Derived relations between entities of the Retail Business Management model.
Designed Oracle relational Database and menu driven interface so that customers can order items through user friendly interface. Achieved connectivity with Database via JDBC.

Details and Steps :
------------------------------
#There are four programs :
1.	jdbcdemo1.java: This program demonstrates how to connect to the Oracle server as well as several basic ways to run SQL queries (include select, update and insert) within a Java program. 
2.	jdbcdemo2.java: This program demonstrates how to call a stored PL/SQL procedure within a Java program. 
3.	jdbcdemo3.java: This program demonstrates how to call a stored package function to get a record set from a table using ref cursor.
4.	jdbcdemo4.java: This program is similar to jdbcdemo3.jave except that the function used in program has a parameter. 


# Example: Create the table in your Oracle account and insert values into it
create table students2
(sid char(4) primary key,
 firstname varchar2(15),
 lastname varchar2(15),
 status varchar2(10),
 gpa number(3,2),
 email varchar2(20));

insert into students2 values ('B001', 'Anne', 'Broder', 'senior', 3.17, 'broder@bu.edu');
insert into students2 values ('B002', 'Terry', 'Buttler', 'senior', 3, 'buttler@bu.edu');
insert into students2 values ('B003', 'Tracy', 'Wang', 'senior', 4, 'wang@bu.edu');
insert into students2 values ('B004', 'Barbara', 'Callan', 'junior', 2.5, 'callan@bu.edu');
insert into students2 values ('B005', 'Jack', 'Smith', 'MS', 3.2, 'smith@bu.edu');
insert into students2 values ('B006', 'Terry', 'Zillman', 'PhD', 4, 'zillman@bu.edu');
insert into students2 values ('B007', 'Becky', 'Lee', 'senior', 4, 'lee@bu.edu');
insert into students2 values ('B008', 'Tom', 'Baker', 'freshman', , 'baker@bu.edu');


#Created Stored Procedures, Functions, Packages, Triggers, Exceptions and maintained logs using PLSQL

#To run the jdbcdemo.java on university cloud:
o	javac -cp /usr/lib/oracle/18.3/client64/lib/ojdbc8.jar jdbcdemo1.java
o	java -cp /usr/lib/oracle/18.3/client64/lib/ojdbc8.jar jdbcdemo1.java


#To run the jdbcdemo.java on university cloud:
o	javac -cp /usr/lib/oracle/18.3/client64/lib/ojdbc8.jar jdbcdemo2.java
o	java -cp /usr/lib/oracle/18.3/client64/lib/ojdbc8.jar jdbcdemo2.java

#To run the jdbcdemo.java on university cloud:
o	javac -cp /usr/lib/oracle/18.3/client64/lib/ojdbc8.jar jdbcdemo3.java
o	java -cp /usr/lib/oracle/18.3/client64/lib/ojdbc8.jar jdbcdemo3.java

#To run the jdbcdemo.java on university cloud:
o	javac -cp /usr/lib/oracle/18.3/client64/lib/ojdbc8.jar jdbcdemo4.java
o	java -cp /usr/lib/oracle/18.3/client64/lib/ojdbc8.jar jdbcdemo4.java




