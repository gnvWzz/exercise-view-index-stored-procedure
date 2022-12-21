create database demo;

use demo;

create table Products(
id int primary key,
productCode varchar(60) not null unique,
productName varchar(60) not null unique,
productPrice bigint not null,
productAmount int,
productDescription varchar(255) not null,
productStatus int not null
);

insert into Products value
(1, 'A01', 'Banh-AFC', 10000, 50, 'abcxyz', 1),
(2, 'A02', 'Banh-kem', 20000, 25, 'xyzabc', 0),
(3, 'B01', 'Keo-dua', 5000, 100, 'abxy', 1),
(4, 'B02', 'Keo-sua', 2000, 200, 'xyab', 0);

create unique index idx_product_code
on Products (productCode);

create unique index idx_product_name_and_price
on Products (productName, productPrice);

explain select * from Products;

create view view_products as 
select productCode, productName, productPrice, productStatus
from Products;

create or replace view view_products as
select productCode, productName, productPrice, productStatus
from Products;

drop view view_products;

delimiter // 
create procedure getProducts()
begin
select * from Products;
end //
delimiter ;

call getProducts();

delimiter //
create procedure addProduct(id int, `code` varchar(60), `name` varchar(60), price bigint, amount int, `description` varchar(255), `status` int)
begin
insert into Products values
(id, `code`, `name`, price, amount, `description`, `status`);
end //
delimiter ;

call addProduct(5, 'C01', 'giay-an', 1000, 1000, 'abcxyzqwe', 1);

delimiter //
create procedure editProduct(id int, `code` varchar(60), `name` varchar(60), price bigint, amount int, `description` varchar(255), `status` int)
begin
update Products
set productCode = `code`, productName = `name`, productPrice = price, productAmount = amout, productDescription = `description`, productStatus = `status`
where id = id;
end //
delimiter ;

delimiter //
create procedure removeProduct(id int)
begin
delete  
from Products
where id = id;
end //
delimiter ;