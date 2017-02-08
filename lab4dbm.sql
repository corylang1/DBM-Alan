-- 1 --
select city
from agents
where aid in(
            select aid
            from orders
            where cid = 'c006'	
    		)
;

-- 2 -- 
select distinct pid
from orders
where aid in (
            select distinct aid
            from orders
            where cid = (select cid
                        from customers 
                        where city = 'Kyoto')
)
order by pid DESC
;

-- 3 --
select distinct cid,
		        name
from customers
where cid NOT IN (
                    select cid
                    from customers
                    where cid in (
                                 select cid
                                 from orders
                                 where aid = 'a01')
)
;

-- 4 -- 
select distinct cid, 
				name
from customers
where cid in (
              select cid 
              from Orders
              where pid = 'p01' 
              or pid = 'p07')
;

-- 5 --
select distinct pid
from orders
where cid in(
            select distinct cid
            from orders
            where aid <> 'a08')
order by pid DESC
;

-- 6 --
select name,
	   city,
	   discount
from customers
where cid in(
            select distinct cid
            from orders
            where aid in(
                        select aid
                        from agents
                        where city = 'Tokyo'
                        OR city = 'New York')
    )
;

-- 7 --
select name
from customers
where discount in (

                    select discount
                    from customers
                    where city = 'Duluth'
                    or city = 'London')
;

-- A check constraint is important because it keeps the integrity 
-- of the database. For example, it keeps a user from  inputting a 
-- value into the database that would not make any sense. Putting a 
-- check constraint on a value that cannot be 0 or less, such as age,
-- is a practical example because it will deny the entry if someone
-- inputs an age lower than 1. Another example of a good constraint would
-- be to keep the price of an item above 0. An example of a bad constraint 
-- would be one that is too arbitrary or simply does not need a restraint.
-- An exammple of this would be contraining name length. Using check 
-- constraints is important because they ensure the accuracy and integrity
-- of the data that is being inputted into the database. 