Create Database HR_Database_Management_System
CREATE TABLE regions (region_id INT IDENTITY(1,1) PRIMARY KEY, region_name VARCHAR (25) DEFAULT NULL);

CREATE TABLE countries (country_id CHAR (2) PRIMARY KEY, country_name VARCHAR (40) DEFAULT NULL, region_id INT NOT NULL, FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE locations (location_id INT IDENTITY(1,1) PRIMARY KEY,
street_address VARCHAR (40) DEFAULT NULL, postal_code VARCHAR (12) DEFAULT NULL,
city VARCHAR (30) NOT NULL,state_province VARCHAR (25) DEFAULT NULL,
country_id CHAR (2) NOT NULL,FOREIGN KEY (country_id)
REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE jobs (job_id INT IDENTITY(1,1) PRIMARY KEY,
job_title VARCHAR (35) NOT NULL,
min_salary DECIMAL (8, 2) DEFAULT NULL,
max_salary DECIMAL (8, 2) DEFAULT NULL);

CREATE TABLE departments (department_id INT IDENTITY(1,1) PRIMARY KEY,
department_name VARCHAR (30) NOT NULL,
location_id INT DEFAULT NULL,
FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE employees (employee_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR (20) DEFAULT NULL,
last_name VARCHAR (25) NOT NULL,
email VARCHAR (100) NOT NULL,
phone_number VARCHAR (20) DEFAULT NULL,
hire_date DATE NOT NULL,
job_id INT NOT NULL,
salary DECIMAL (8, 2) NOT NULL,
manager_id INT DEFAULT NULL,
department_id INT DEFAULT NULL,
FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (manager_id) REFERENCES employees (employee_id));

CREATE TABLE dependents (dependent_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
relationship VARCHAR (25) NOT NULL,
employee_id INT NOT NULL,
FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE);

select * from regions
Select * from locations
Select * from countries
Select * from jobs
Select * from employees
Select * from dependents

INSERT INTO regions VALUES ('Europe');
INSERT INTO regions VALUES ('Americas');
INSERT INTO regions VALUES ('Asia');
INSERT INTO regions VALUES ('Middle East and Africa');

INSERT INTO countries(country_id,country_name,region_id) VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZW','Zimbabwe',4);

SET IDENTITY_INSERT [HR_Database_Management_System].dbo.locations on
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
SET IDENTITY_INSERT [HR_Database_Management_System].dbo.locations off
Select * from locations

SET IDENTITY_INSERT [HR_Database_Management_System].dbo.jobs on
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (19,'Stock Manager',5500.00,8500.00);
SET IDENTITY_INSERT [HR_Database_Management_System].dbo.jobs off
Select * from jobs


SET IDENTITY_INSERT [HR_Database_Management_System].dbo.departments on
INSERT INTO departments(department_id,department_name,location_id) VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id) VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (11,'Accounting',1700);
SET IDENTITY_INSERT [HR_Database_Management_System].dbo.departments off
Select * from departments


SET IDENTITY_INSERT [HR_Database_Management_System].dbo.employees on
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
 VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);
 SET IDENTITY_INSERT [HR_Database_Management_System].dbo.employees off
 Select * from employees


SET IDENTITY_INSERT [HR_Database_Management_System].dbo.dependents on
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (30,'Sandra','Taylor','Child',176);
SET IDENTITY_INSERT [HR_Database_Management_System].dbo.dependents off
Select * from dependents

--------------------------------------------------------------------------------------------------------------------------------
--                                                 SELECT STATEMENT                                                           --
--------------------------------------------------------------------------------------------------------------------------------

--1)WRITE A QUERY FOR  SELECT STATEMENTS :-
--Syntax of  SELECT STATEMENT:-
--SELECT 
--    select_list
--FROM
--    table_name;

--A.	To get data from all the rows and columns in the employees table:
Select * from employees

--B.	select data from the employee id, first name, last name, and hire date of all rows in the employees table:
Select employee_id, first_name, last_name hire_date from employees

--C.	to get the first name, last name, salary, and new salary:

SELECT first_name, last_name, salary, salary * 1.1 AS new_salary FROM employees


--D.	Increase the salary two times and named as New_SALARY from employees table
SELECT first_name, last_name, salary, salary * 2 AS New_SALARY FROM employees

-------------------------------------------------------------------------------------------------------------------------------
--                                           ORDER BY STATEMENT                                                              --
-------------------------------------------------------------------------------------------------------------------------------
--2)WRITE A QUERY FOR ORDER BY  STATEMENTS :-
--Syntax of ORDER BY Statements:-
--SELECT 
--    select_list
--FROM
--    table_name
--ORDER BY 
--    sort_expression1 [ASC | DESC],
--  sort_expression 2[ASC | DESC];



--A.	returns the data from the employee id, first name, last name, hire date, and salary column of the employees table:
Select employee_id, first_name, last_name, hire_date, salary from employees


--B.	to sort employees by first names in alphabetical order:
Select * from employees order by first_name

--C.	to sort the employees by the first name in ascending order and the last name in descending order:

SELECT employee_id, first_name, last_name, hire_date, salary FROM employees ORDER BY first_name ASC, last_name ASC

--D.	to sort employees by salary from high to low:
Select * from employees order by salary desc


--E.	to sort the employees by values in the hire_date column from:
select * from employees order by hire_date

--F.	sort the employees by the hire dates in descending order:
select * from employees order by hire_date desc

-------------------------------------------------------------------------------------------------------------------------------
--                                             DISTINCT STATEMENT                                                            --
-------------------------------------------------------------------------------------------------------------------------------

----3)WRITE A QUERY FOR DISTINCT  STATEMENTS :-
--Syntax of DISTINCT Statements:-
--SELECT DISTINCT
--    column1, column2, ...
--FROM
--    table1;

--A.	selects the salary data from the salary column of the employees table and sorts them from high to low:
Select salary from employees order by salary desc


--B.	select unique values from the salary column of the employees table:
select distinct salary from employees

--C.	selects the job id and salary from the employees table:
select job_id, salary from employees

--D.	to remove the duplicate values in job id and salary:
select distinct job_id, salary from employees
select distinct salary from employees

--E.	returns the distinct phone numbers of employees:
select distinct phone_number from employees

-------------------------------------------------------------------------------------------------------------------------------
--                                             TOP N'th STATEMENT                                                            --
-------------------------------------------------------------------------------------------------------------------------------

--4)WRITE A QUERY FOR TOP N  STATEMENTS :-
--Syntax of TOP N Statements(N=Will be any nos)
--SELECT TOP N 
--    column_list
--FROM
--    table1
--ORDER BY column_list

--A.	returns all rows in the employees table sorted by the first_name column.
Select * from employees order by first_name


--B.	to return the first 5 rows in the result set returned by the SELECT clause:
Select Top 5 * from employees

---C.	to return five rows starting from the 4th row:
SELECT * FROM employees ORDER BY employee_id OFFSET 3 ROWS FETCH NEXT 5 ROWS ONLY

select * from employees
--D.	gets the top five employees with the highest salaries.
Select top 5 first_name, salary from employees order by salary Desc


--E.	to get employees who have the 2nd highest salary in the company
SELECT TOP 1* FROM employees WHERE salary < (SELECT MAX(salary) FROM employees)ORDER BY salary DESC

-------------------------------------------------------------------------------------------------------------------------------
--                                           WHERE  CLAUSE and COMPARISON OPERATORS                                                            --
-------------------------------------------------------------------------------------------------------------------------------
Select * from employees
--A.	query finds employees who have salaries greater than 14,000 and sorts the results sets based on the salary in descending order.
Select first_name, salary from employees where employees.salary> 14000 order by salary desc

--B.	query finds all employees who work in the department id 5.
Select first_name, department_id from employees where department_id=5

--C.	query finds the employee whose last name is Chen
Select first_name, last_name from employees where employees.last_name like '%Chen'
--OR
SELECT * FROM employees WHERE last_name = 'Chen'

--D.	To get all employees who joined the company after January 1st, 1999
Select first_name, hire_date from employees where hire_date > '1999-01-01'


--E.	to find the employees who joined the company in 1999,
Select first_name from employees where employees.hire_date between '1999/1/1' and '1999/12/31'
--OR
SELECT * FROM employees WHERE YEAR(hire_date) = 1999

--F.	statement finds the employee whose last name is Himuro
Select first_name, last_name from employees where last_name = 'Himuro'

--G.	the query searches for the string Himuro in the last_name column of the employees table.
Select first_name, last_name from employees where last_name like '%Himuro%'


--H.	to find all employees who do not have phone numbers:
Select first_name, last_name, phone_number from employees where phone_number is null

--I.	returns all employees whose department id is not 8.
SELECT * FROM employees WHERE department_id <> 8
--OR
Select * from employees where department_id not in (8)


--J.	finds all employees whose department id is not eight and ten.
Select first_name, last_name, department_id from employees where department_id not in (8,10) order by first_name

--K.	to find the employees whose salary is greater than 10,000,
Select first_name, last_name, salary from employees where salary>10000

--L.	finds employees in department 8 and have the salary greater than 10,000:
Select first_name, last_name, department_id from employees where employees.department_id=8 and salary>10000


--M.	the statement below returns all employees whose salaries are less than 10,000:
Select first_name, last_name, salary from employees where salary<10000 order by salary DESC

--N.	finds employees whose salaries are greater than or equal 9,000:
Select first_name, last_name, salary from employees where salary>=9000 order by salary


--O.	finds employees whose salaries are less than or equal to 9,000:
Select first_name, last_name, salary from employees where salary<=9000 order by salary DESC


--------------------------------------------------------------------------------------------------------------------------------
--                          TASK 2: Logical Operators and Special  Operators                                                  --
--------------------------------------------------------------------------------------------------------------------------------
Select * from employees

--1)WRITE A QUERY FOR LOGICAL OPERATORS and OTHER ADVANCED OPERATORS:-
------------------------------------------------------------------------------------------------------------------------------
--                                                     Part 1:-                                                             --
------------------------------------------------------------------------------------------------------------------------------
--A.	finds all employees whose salaries are greater than 5,000 and less than 7,000:
Select first_name, salary from employees where salary between 5000 and 7000


--B.	finds employees whose salary is either 7,000 or 8,000:
Select first_name, salary from employees where salary = 7000 or salary = 8000
--OR
SELECT * FROM employees WHERE salary IN (7000, 8000)


--C.	finds all employees who do not have a phone number:
Select first_name, phone_number from employees where phone_number is null


--D.	finds all employees whose salaries are between 9,000 and 12,000.
Select first_name, salary from employees where salary between 9000 and 12000

--E.	finds all employees who work in the department id 8 or 9.
Select first_name, department_id from employees where department_id= 8 OR department_id = 9
--OR
SELECT * FROM employees WHERE department_id IN (8, 9)

--F.	finds all employees whose first name starts with the string jo
Select first_name from employees where first_name like 'jo%'

--G.	finds all employees with the first names whose the second character is h
Select first_name from employees where first_name like '_h%'
--OR
SELECT first_name FROM employees WHERE SUBSTRING(first_name, 2, 1) = 'h'


--H.	finds all employees whose salaries are greater than all salaries of employees in the department 8:
Select * from employees where salary > (Select Max(salary) from employees where department_id=8)


-------------------------------------------------------------------------------------------------------------------------------
--                                                            Part 2:-                                                       --
-------------------------------------------------------------------------------------------------------------------------------
--A.	finds all employees whose salaries are greater than the average salary of every department:
SELECT * FROM employees emp WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = emp.department_id)


--B.	finds all employees who have dependents:
Select dependents.first_name, dependent_id from dependents 
inner join employees on dependents.employee_id=employees.employee_id

--C.	to find all employees whose salaries are between 2,500 and 2,900:
Select first_name, salary from employees where salary between 2500 and 2900

--D.	to find all employees whose salaries are not in the range of 2,500 and 2,900:
Select first_name, salary from employees where salary not between 2500 and 2900


--E.	to find all employees who joined the company between January 1, 1999, and December 31, 2000:
select first_name, hire_date from employees where hire_date between '1999-01-01' and '2000-12-31'

--F.	to find employees who have not joined the company from January 1, 1989 to December 31, 1999:
select first_name, hire_date from employees where hire_date not between '1989-01-01' and '1999-12-31'


--G.	to find employees who joined the company between 1990 and 1993:
select first_name, hire_date from employees where hire_date between '1990-01-01' and '1993-12-31'
--OR
SELECT * FROM employees WHERE YEAR(hire_date) BETWEEN 1990 AND 1993


-------------------------------------------------------------------------------------------------------------------------------
--                                                 Part 3:-                                                                  --
-------------------------------------------------------------------------------------------------------------------------------
--A.	to find all employees whose first names start with Da
Select first_name from employees where first_name like 'Da%'


--B.	to find all employees whose first names end with er
Select first_name from employees where first_name like '%er'


--C.	to find employees whose last names contain the word an:
Select first_name from employees where first_name like '%an'


--D.	retrieves employees whose first names start with Jo and are followed by at most 2 characters:
SELECT * FROM employees WHERE first_name LIKE 'Jo__'

--E.	to find employees whose first names start with any number of characters and are followed by at most one character:
SELECT *FROM employees WHERE first_name LIKE '_%_'


--F.	to find all employees whose first names start with the letter S but not start with Sh:
SELECT * from employees WHERE first_name LIKE 'S%' AND first_name NOT LIKE 'Sh%'


------------------------------------------------------------------------------------------------------------------------------
--                                                      Part 4:-                                                            --
------------------------------------------------------------------------------------------------------------------------------
--A.	retrieves all employees who work in the department id 5.
Select first_name, department_id from employees where department_id = 5

--B.	To get the employees who work in the department id 5 and with a salary not greater than 5000.
Select first_name, salary, department_id from employees where department_id = 5 and salary<5000

--C.	statement gets all the employees who are not working in the departments 1, 2, or 3.
Select first_name, department_id from employees where department_id not in ( 1,2,3) order by department_id

--D.	retrieves all the employees whose first names do not start with the letter D.
select first_name from employees where employees.first_name not like 'D%'

--E.	to get employees whose salaries are not between 5,000 and 1,000.
Select first_name, salary from employees where salary not between 1000 and 5000 order by salary
--OR
Select first_name, salary from employees where salary > 5000 order by salary
------------------------------------------------------------------------------------------------------------------------------
--                                                      Part 5:-                                                            --
------------------------------------------------------------------------------------------------------------------------------

--A.	Write a query to get the employees who do not have any dependents by above image
Select employees.first_name, dependents.dependent_id from employees left join dependents on employees.employee_id=dependents.employee_id
where dependent_id is null

--B.	To find all employees who do not have the phone numbers
select first_name, phone_number from employees where phone_number is null

--C.	To find all employees who have phone numbers
select first_name, phone_number from employees where phone_number is not null


-------------------------------------------------------------------------------------------------------------------------------
--                                               TASK 3:                                                                     --
--                                               JOINS:-                                                                     --
--                                         SQL INNER JOIN clause                                                             --
-------------------------------------------------------------------------------------------------------------------------------

--1)	Write a Query to 
--A.	To get the information of the department id 1,2, and 3
Select * from departments where department_id in (1,2,3)

--B.	To get the information of employees who work in the department id 1, 2 and 3
Select first_name, department_id from employees where department_id in (1,2,3) 
--OR
Select employees.first_name, departments.department_id from employees inner join departments
on employees.department_id=departments.department_id where departments.department_id in (1,2,3)

 --SQL LEFT JOIN clause
--Write a Query :--
--A.	To query the country names of US, UK, and China
Select country_name from countries where countries.country_name in ('United States of America', 'United Kingdom', 'China')

--B.	query retrieves the locations located in the US, UK and China:
Select * from locations left join countries on locations.country_id= countries.country_id
where countries.country_name in ('United States of America', 'United Kingdom', 'China')


--C.	To join the countries table with the locations table
Select * from countries left join locations on countries.country_id=locations.country_id


--D.	to find the country that does not have any locations in the locations table
Select countries.country_name, locations.location_id, locations.city from countries left join locations
on countries.country_id=locations.country_id where location_id is null

--create two new tables: baskets and fruits for the demonstration. 
--Each basket stores zero or more fruits and each fruit can be stored in zero or one basket.

CREATE  TABLE  fruits (fruit_id  INT PRIMARY KEY, fruit_name  VARCHAR (255) NOT NULL, basket_id  INTEGER);
CREATE TABLE baskets (basket_id  INT PRIMARY KEY, basket_name  VARCHAR (255) NOT NULL);


INSERT  INTO  baskets  (basket_id, basket_name) VALUES(1, 'A'),(2, 'B'),(3, 'C');
INSERT  INTO  fruits (fruit_id, fruit_name, basket_id) VALUES(1, 'Apple', 1),(2, 'Orange', 1),(3, 'Banana', 2),(4, 'Strawberry', NULL);


Select * from baskets
Select * from fruits

--A.	Write a query to returns each fruit that is in a basket and each basket that has a fruit, 
--but also return each fruit that is not in any basket and each basket that does not have any fruit.

Select * from fruits full join baskets on fruits.basket_id=baskets.basket_id

--B.	Write a query to find the empty basket, which does not store any fruit.
Select baskets.basket_id, basket_name from baskets left join fruits on baskets.basket_id=fruits.basket_id
where fruits.fruit_name is null

--C.	Write a query which fruit is not in any basket.
Select fruits.fruit_name from fruits left join baskets on fruits.basket_id=baskets.basket_id
where baskets.basket_id is null

------------------------------------------------------------------------------------------------------------------------------
--                                                   Cross Join                                                             --
------------------------------------------------------------------------------------------------------------------------------

--   We will create two new tables for the demonstration of the cross join:
--•	 sales_organization table stores the sale organizations.
--•	 sales_channel table stores the sales channels.

CREATE  TABLE  sales_organization (sales_org_id  INT PRIMARY KEY, sales_org  VARCHAR (255));

CREATE  TABLE  sales_channel (channel_id  INT PRIMARY KEY, channel  VARCHAR (255));

INSERT INTO sales_organization (sales_org_id, sales_org) VALUES (1, 'Domestic'), (2, 'Export');
INSERT INTO sales_channel (channel_id, channel) VALUES (1, 'Wholesale'), (2, 'Retail'), (3, 'eCommerce'), (4, 'TV Shopping');

Select * from sales_channel
Select * from  sales_organization

--Write a Query To find the all possible sales channels that a sales organization 

Select * from sales_channel cross join sales_organization


------------------------------------------------------------------------------------------------------------------------------
--                                                Group by Clause                                                            --
------------------------------------------------------------------------------------------------------------------------------
Select * from employees
Select * from departments
--Write a  Query
--A.	to group the values in department_id column of the employees table:
Select Count(first_name) 'count_of_emp', department_id from employees group by department_id

--B.	to count the number of employees by department:
Select department_id, Count(first_name) 'count of names' from employees group by department_id

--C.	returns the number of employees by department
Select department_id, Count(first_name) 'count of names' from employees group by department_id


--D.	to sort the departments by headcount:
Select department_name, count(departments.department_name) 'head_count' from departments left join employees on departments.department_id=employees.department_id
group by department_name order by 'head_count' desc


--E.	to find departments with headcounts are greater than 5:
Select departments.department_name, COUNT(Employees.Employee_ID) 'Num_Employees' from departments left join employees on departments.department_id=employees.department_id
group by department_name having Count(department_name) > 5


Select * from departments
	

--F.	returns the minimum, maximum and average salary of employees in each department.
Select department_id, MIN(salary) 'Min Sal' from employees Group by department_id
Select department_id, MAX(salary) 'Max Sal' from employees Group by department_id
Select department_id, AVG(salary) 'AVG Sal' from employees Group by department_id

--G.	To get the total salary per department,
Select department_id, SUM(salary)'Total_Salary' from employees Group by department_id

--H.	groups rows with the same values both department_id and job_id columns in the same group 
--      then return the rows for each of these groups
SELECT Department_ID, Job_ID, COUNT(*) AS Num_Employees FROM Employees GROUP BY Department_ID, Job_ID



------------------------------------------------------------------------------------------------------------------------------
--                                              Group by Having Clause                                                            --
------------------------------------------------------------------------------------------------------------------------------
Select * from employees
Select * from departments
Select * from dependents
Select * from jobs
Select * from countries
Select * from locations


--Write a Query 
--A.	To get the managers and their direct reports, and  to group employees by the managers and to count the direct reports.
Select manager_id, Count(first_name)'direct reports' from employees Group by manager_id

--B.	To find the managers who have at least five direct reports
Select manager_id, Count(first_name)'direct reports' from employees Group by manager_id
having (Select Count(first_name)'direct reports')>=5

--C.	calculates the sum of salary that the company pays for each department and 
--      selects only the departments with the sum of salary between 20000 and 30000.
Select department_id, SUM(salary)'Total Sal' from employees Group by department_id
Having (Select SUM(salary)) between 20000 and 30000

--D.	To find the department that has employees with the lowest salary greater than 10000
SELECT Department_ID, MIN(Salary) AS Lowest_Salary FROM Employees WHERE 
Salary > 10000 GROUP BY Department_ID ORDER BY Lowest_Salary

--E.	To find the departments that have the average salaries of employees between 5000 and 7000
Select department_id, SUM(salary)'Total Sal' from employees Group by department_id
Having (Select AVG(salary)) between 5000 and 7000
--OR
SELECT Department_ID, AVG(Salary) AS Avg_Salary FROM Employees
GROUP BY Department_ID HAVING AVG(Salary) BETWEEN 5000 AND 7000

------------------------------------------------------------------------------------------------------------------------------
--                                              SET Operator                                                                --
------------------------------------------------------------------------------------------------------------------------------

--      Write a Query to combine the first name and last name of employees and dependents
Select first_name, last_name from employees
Union
Select first_name, last_name from dependents
--OR
Select first_name, last_name from employees
Union all
Select first_name, last_name from dependents


--      Write a Query to Applies the INTERSECT operator to the A and B tables 
--      and sort the combined result set by the id column in descending order.

Select first_name, last_name, employee_id from employees
intersect
Select first_name, last_name, employee_id from dependents


--A.	finds all employees who have at least one dependent.
SELECT * FROM Employees WHERE EXISTS (SELECT 1 FROM Dependents WHERE Dependents.Employee_ID = Employees.Employee_ID)


--B . finds employees who do not have any dependents:
SELECT * FROM Employees WHERE NOT EXISTS (SELECT 1 FROM Dependents WHERE Dependents.Employee_ID = Employees.Employee_ID)

--OR

Select employees.first_name, dependent_id from employees left join dependents on employees.employee_id=dependents.employee_id where dependents.dependent_id is null

Select * from employees
Select * from dependents


--Questions: -
--A.	Suppose the current year is 2000. How to use the simple CASE expression to get the work anniversaries of employees by 

SELECT Employee_ID, First_Name, Last_Name, Hire_Date,
CASE WHEN YEAR(Hire_Date) = 2000 THEN 'New Employee'
     WHEN YEAR(Hire_Date) = 1999 THEN '1 Year Anniversary'
     WHEN YEAR(Hire_Date) = 1998 THEN '2 Year Anniversary'
     WHEN YEAR(Hire_Date) = 1997 THEN '3 Year Anniversary'
     ELSE 'More than 3 Years'
     END AS Work_Anniversary FROM Employees

--B.	Write a Query If the salary is less than 3000, the CASE expression returns “Low”. 
--      If the salary is between 3000 and 5000, it returns “average”. When the salary is greater than 5000, 
--      the CASE expression returns “High”.
Select first_name, salary,
CASE
WHEN employees.salary <= 3000 THEN 'LOW'
WHEN employees.salary between 3000 and 5000 THEN 'Average'
WHEN employees.salary >= 5000 THEN 'High'
ELSE 'NA'
END AS 'Sal_catagory'
from employees


--Write a Query to update Sarah’s last name from Bell to Lopez

Update employees Set last_name = 'Lopez' where first_name = 'Sarah'
Select * from employees

--------------------------------------------------------------------------------------------------------------------------------
--                                FINAL TASK (Advanced Queries)                                                               --
--------------------------------------------------------------------------------------------------------------------------------
select * from regions
Select * from employees order by salary
Select * from locations
Select * from countries
Select * from jobs
Select * from dependents
Select * from departments
--Write a Query: -

--A.    Find all departments located at the location whose id is 1700 and
--find all employees that belong to the location 1700 by using the department id list of the previous query

select employees.first_name, locations.location_id, departments.department_name from employees left join departments 
on employees.department_id=departments.department_id 
left join locations on locations.location_id=departments.location_id where locations.location_id= 1700 

--B.	to find all employees who do not locate at the location 1700:
select employees.first_name, locations.location_id, departments.department_name from employees left join departments 
on employees.department_id=departments.department_id 
left join locations on locations.location_id=departments.location_id where locations.location_id!= 1700 

--C.	finds the employees who have the highest salary:
Select Top 1 first_name, salary from employees order by salary desc

--D.	finds all employees who salaries are greater than the average salary of all employees:
Select first_name, salary from employees where employees.salary> (Select AVG(salary) from employees)


--E.	finds all departments which have at least one employee with the salary is greater than 10,000:
SELECT department_id, department_name FROM departments 
WHERE department_id IN (SELECT DISTINCT department_id FROM employees WHERE salary > 10000)


--F.	finds all departments that do not have any employee with the salary greater than 10,000:
SELECT department_id, department_name FROM departments WHERE department_id NOT IN (SELECT DISTINCT department_id FROM employees WHERE salary > 10000)

--G.	to find the lowest salary by department:
Select MIN(Salary), department_id from employees Group by department_id


--H.	finds all employees whose salaries are greater than the lowest salary of every department:
SELECT e.employee_id, e.first_name, e.salary, e.department_id FROM employees e
WHERE e.salary > 
(SELECT MIN(salary) FROM employees e2 WHERE e2.department_id = e.department_id);


--I.	finds all employees whose salaries are greater than or equal to the highest salary of every department
Select first_name, salary, department_id from employees e1 where salary>=(Select Max(salary) from employees e2 where e1.department_id=e2.department_id
Group by department_id)


--J.	returns the average salary of every department
Select AVG(salary)'AVG Sal', department_id from employees Group by department_id

--K.	to calculate the average of average salary of departments :
SELECT AVG(average_salary) AS average_of_average_salary FROM (SELECT AVG(salary) AS average_salary
FROM employees GROUP BY department_id) AS department_avg


--L.	finds the salaries of all employees, their average salary, and the difference between the salary of each employee 
--      and the average salary.
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    e.salary, 
    AVG(e.salary) OVER() AS average_salary,
    e.salary - AVG(e.salary) OVER() AS salary_difference
FROM employees e
