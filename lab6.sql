-- 1--
select c.name, c.city
from customers c inner join products p on c.city = p.city
where c.city in (
    			select city
    			from (select city,
                      count (*)
                      from products
                      group by city
                      order by count (*) DESC, city
                    limit 1
                      ) sub2
    )
    group by c.city, c.name
;

-- 2 --
select name
from products
where priceUSD > (select avg(priceUSD)
				  from products
                  )
order by name DESC
;

-- 3 --
select c.name, p.pid, sum(totalUSD)
from customers c inner join orders o on c.cid = o.cid
inner join products p on p.pid = o.pid
group by c.name, p.pid
order by sum(totalUSD) ASC
;

-- 4 -- 

select distinct c.name, 
coalesce (sum(totalUSD), 0) as "Sum of orders"
from customers c left outer join orders o on c.cid = o.cid
group by c.name
order by name ASC
;
	
-- 5 --
select c.name as "Customer Name", p.name as "Product Name", a.name as "Agent Name"
from customers c inner join orders o on c.cid = o.cid
inner join products p on p.pid = o.pid
inner join agents a on a.aid = o.aid
where c.name in(
                select c.name
                from customers c inner join orders o on c.cid = o.cid
                inner join agents a on o.aid=a.aid
                where a.city = 'Newark'
                    )
;

-- 6 --
select o.ordNumber,
	   o.cid,
       o.aid,
       o.pid,
       (o.qty * p.priceUSD) - (c.discount / 100)* (o.qty * p.priceUSD) as "Real Price",
       o.totalUSD as "OrdersPrice"
from orders o inner join customers c on o.cid = c.cid
			  inner join products p on o.pid = p.pid
              inner join agents a on o.aid = a.aid
where o.totalUSD <> (o.qty * p.priceUSD) - (c.discount / 100)* (o.qty * p.priceUSD)
;

-- 7 --
-- Left and right outer join are used to return values that are not in both tables being compared. For example,
-- looking at the customers and orders table, we realize that not every customer makes an order. Therefore, there are 
-- customer names in the customers table that are not in the orders table. Left outer join would help us return all of
-- the customer names if we were to use them for analysis. 

select distinct c.name
from customers c left outer join orders o on o.cid = c.cid;

-- This is useful because it allows us to see all of the names. If we did a normal inner join or a right outer join,
-- then we would not have seen Weyland because he does not appear in the orders table

select distinct c.name
from customers c inner join orders o on c.cid = o.cid;

select distinct c.name
from customers c right outer join orders o on o.cid = c.cid;

-- Using this, we can use left and right outer join to manipulate which data we want to show and which data to do 
-- analysis on.
