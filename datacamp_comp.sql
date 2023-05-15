create database datacamp_comp;
show databases;
use datacamp_comp;
create table products (
product_id int,
product_name varchar(500),
brand_id int,
category_id int,
model_year date,
list_pice float8);
select * from products;
create table brands(
brand_id int, 
brand_name varchar(500));
select * from brands;
create table categories(
category_id int,
category_name varchar(500));
select * from categories;

/*alter table products
modify model_year year;*/

#most price item
select product_name from products
where list_pice = (select max(list_pice) from products);
#least priced product
select product_name from products
where list_pice = (select min(list_pice) from products);

select * from brands;

#the number of products in differnet categories my company sells
select count(p.product_id) as no_of_products, c.category_name 
from products as p
left join categories as c 
on c.category_id = p.category_id
group by category_name;

#top three brands with highest avergae price list
select avg(list_pice) as avg_price, b.brand_name from products as p 
left join brands as b on p.brand_id = b.brand_id
group by b.brand_id
order by avg_price desc limit 3;

#top three categories with the highest average price
select avg(list_pice) as avg_price, c.category_name from products as p 
left join categories as c on p.category_id = c.category_id
group by c.category_id
order by avg_price desc limit 3;

#top three categories and brands with highest avg price
select avg(list_pice) as avg_price, b.brand_name, c.category_name from products as p 
left join brands as b on p.brand_id = b.brand_id
left join categories as c on p.category_id = c.category_id
group by b.brand_id, c.category_id
order by avg_price desc;

#other insights
/* The brand 'trek' made the highest average sales across the following categories Electric Bikes, road bikes and 
cyclocross bicycles respectively in descending order.
The brand that made the lowest average sale was Sun Biycles next to Strider next to Haro all from the same 
category of Children Bicycles
The children bicycle category has the least sales among all catrgories and sun bycles hasthe least sales in all brands
*/