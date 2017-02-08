-- 1 --
select ordnumber,
	   totalusd
       from orders
;

-- 2 --
select name,
	   city
from agents
where name = 'Smith'
;

-- 3 --
select pid,
	   name,
       priceusd,
       quantity
from products
where quantity > 200100
order by quantity DESC
;

-- 4 --
select city,
	   name
from customers 
where city = 'Duluth'
;

-- 5 --
select name,
	   city
from agents
where city <> 'New York'
  and city <> 'Duluth'
;

-- 6 --
select *
from products 
where city <> 'Dallas'
  and city <> 'Duluth'
  and priceusd >= 1
order by pid ASC
;

-- 7 --
select *
from orders
where month = 'Jan'
   or month = 'Feb'
;

-- 8 --
select *
from orders
where month = 'Feb'
  and totalusd >= 600
;

-- 9 --
select *
from orders
where cid = 'c006'
;