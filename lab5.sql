-- 1 --
select a.city
from agents a inner join orders o on a.aid = o.aid
inner join customers c on o.cid = c.cid
where c.cid = 'c006'
,
 
-- 2 --
select distinct p.pid
from products p inner join orders o on p.pid = o.pid
inner join agents a on a.aid = o.aid
inner join customers c on c.cid = o.cid
where c.city = 'Kyoto'
order by pid DESC
;
 
-- 3 -- 
Select name
from customers
where cid not in(
    		select cid
    		from orders
    		)
;
 
-- 4 -- 
select c.name
from customers c 
full outer join orders o on c.cid = o.cid
where o.cid is NULL

;
 
-- 5 --
select distinct c.name,
                a.name
from customers c inner join orders o on c.cid = o.cid
inner join agents a on a.aid = o.aid
inner join products p on p.pid = o.pid
where c.city = a.city
;
 
-- 6 --
select c.name as "Customer Name",
       a.name as "Agent Name",
       c.city as "City"
from customers c inner join agents a on c.city = a.city

where c.city = a.city
;
 
-- 7 --
select name, city
from customers
where city in (
                select city
                from ( select city,
                        count (*)
                        from products
                        group by city
                        order by count (*) ASC, city
                        limit 1
                        )sub2
      			)
group by city,name;

