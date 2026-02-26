drop database if exists employeedb;
create database employeedb;

drop table if exists employee;
create table employee(id serial primary key,name varchar(20),email varchar(20),department varchar(20),designation varchar(20),salary float);

insert into employee(name,email,department,designation,salary) values('Om Ghodekar','om@gmail.com','it','frontend developer',22000);
insert into employee(name,email,department,designation,salary) values('Vinayak Ghule','vinayak@gmail.com','it','backend developer',25000);
insert into employee(name,email,department,designation,salary) values('Rudresh Honrao','rudresh@gmail.com','it','fullstack developer',28000);

select * from employee;