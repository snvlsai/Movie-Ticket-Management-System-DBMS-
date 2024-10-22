create database Movie_Ticket;

use  Movie_Ticket;

create table Movie_Show(
Show_Id int primary key,
Show_Date date,
Show_Time time,
Movie_Title varchar(20),
Movie_Stars varchar(30),
Movie_Desc varchar(30)
);

create table Tickets(
Ticket_Id int primary key,
Movie_Title varchar(20),
Price float,
Screen_No int,
Seat_Nos int,
Show_Date date,
Show_Time time,
Theater_Name varchar(20)
);

create table Customer(
Cust_id int primary key,
First_Name varchar(20),
Last_Name varchar(20),
Age int
);

create table Mobile_Numbers(
Mobile_No bigint,
Cust_id int,
foreign key(Cust_id) references Customer(Cust_id)
);

create table Email_ids(
Email_id varchar(50),
Cust_id int,
foreign key(Cust_id) references Customer(Cust_id)
);

insert into  Movie_Show values(
'1', '2024-04-27', '12:00','Aaveesham','Fahad Fasil','It is a action block Movie'
);
select * from Tickets;

insert into Customer values(
007,'Noel','Ebe','20'
);

insert into Tickets values(
06,' Dil Bachera',900,2,4,'2024-04-27','12:00','pvr ripples','002','3'
);

update Customer
set age='19'
where Cust_id=1;

insert into  Movie_Show values(
'3', '2024-04-27', '12:00','salaar','prabhas ','It is a action Movie');

alter table Tickets
drop foreign key Cust_id;
ALTER TABLE Tickets
add Cust_id int,
add Show_id int,
add FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),
add foreign key (Show_id) references Movie_Show(Show_id);

select b.First_Name, a.Movie_Title,a.Theater_Name
from Tickets as a
Join Customer as b on a.Cust_id=b.Cust_id;

select First_Name , Age 
from Customer 
where Age>=18;

create table Screen(
Screen_No int primary key,
No_of_Seats int
);
insert into Screen values(
3,1500);

create table Theatre(
Theatre_id int primary key,
Theatre_Name varchar(30),
Location Varchar(50),
Show_id int,
Screen_No int,
foreign key (Show_id) references Movie_Show(Show_id),
foreign key (Screen_No) references Screen(Screen_No)
);


insert into Theatre values(
4,'Pvr inox','vijayawada',2,2);

create view Loc_Chennai as
select Theatre_Name,location
from Theatre 
where location='Chennai';

select * from Loc_Chennai;

create view Movie_details as
select Movie_Title,Movie_Stars,Movie_Desc
from Movie_Show;

select * from Tickets;

create view Customer_avg as
select Cust_id, avg(price)
from Tickets
group by Cust_id;

select * from Customer_avg;


SELECT MAX(total_amount_spent) as Maximum_Amount FROM (
     SELECT Cust_id, SUM(price) AS total_amount_spent     
     FROM Tickets     
     GROUP BY Cust_id ) 
     AS id_total_spent;



create view Cust_A as
select First_Name , Age 
from Customer 
where Age>=18;

select * from Cust_A;


create view high_Cust as
SELECT c.First_Name, t.Maximum_Amount 
FROM (     
SELECT Cust_id, MAX(total_amount_spent) AS Maximum_Amount      
FROM (        
 SELECT Cust_id, SUM(Price) AS total_amount_spent            
  FROM Tickets             
  GROUP BY Cust_id)AS id_total_spent    
  GROUP BY Cust_id ) AS t 
  JOIN Customer c ON t.Cust_id = c.Cust_id LIMIT 1;
  
select * from high_Cust;
select a.Theatre_Name , b.Movie_Title
from Theatre as a
join Movie_Show as b on a.Show_id=b.Show_id;

