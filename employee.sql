drop database if exists employeedb;
create database employeedb;
\c employeedb

drop table if exists employee;
create table employee(id serial primary key,name varchar(255),email varchar(255),department varchar(255),designation varchar(255),salary float);

insert into employee(name,email,department,designation,salary) values('Om Ghodekar','om@gmail.com','it','frontend developer',22000);
insert into employee(name,email,department,designation,salary) values('Vinayak Ghule','vinayak@gmail.com','it','backend developer',25000);
insert into employee(name,email,department,designation,salary) values('Rudresh Honrao','rudresh@gmail.com','it','fullstack developer',28000);

select * from employee;

\c employeedb
create table users(id serial primary key, name varchar(255),username varchar(255) unique,userpassword varchar(255));
insert into users values('Om Ghodekar','om@gmail.com','password');
select * from users;