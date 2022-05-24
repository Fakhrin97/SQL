create database Sales

use Sales

create table Notebooks(
Id tinyint primary key identity,
[Name] nvarchar(30) not null,
Price int 
)

create table Brands(
Id tinyint primary key identity,
[Name] nvarchar(30) not null
)

alter table Brands
add constraint CK_Name check(Len([Name])>3)

alter table Notebooks
add constraint DF_Price Default 200 for Price

insert into Brands
values('Acer'),
('Lenova'),
('Mack')

insert into Notebooks
values('Air M1',2000),
('M1 Pro',3000),
('Rog Strix',1000),
('ThinkBook',300),
('Legion',450),
('ThinkPad',500)

alter table Notebooks
add Brand_Id tinyint foreign key references Brands(Id)
--butun notebooks
select n.Name,b.Name as BrandName,n.Price as [Price] from Notebooks as n
inner join Brands as b
on n.Brand_Id = b.Id
--brend namesinde a olan
select n.Name,b.Name as BrandName,n.Price as [Price] from Notebooks as n 
inner join Brands as b
on n.Brand_Id = b.Id where CHARINDEX('a',b.Name)>0
--1000 den yuxari ve 300 500 araligi
select n.Name,b.Name as BrandName,n.Price as [Price] from Notebooks as n 
inner join Brands as b
on n.Brand_Id = b.Id where n.Price>1000 or n.Price between 300 and 500



