
drop view customerandorders;
-- 1

create view customerandorders as
    select c.*, s.orderId, s.OrderDate, s.TotalAmount,
    o.productId, o.quantity, o.price
    from customer as c
    left join ordersummary as s
    on c.customerId = s.customerId
    left join orderproduct as o
    on s.orderId = o.orderId
    where c.state = 'AL';

-- 2
-- the view is not updatable because it
--      does not select information from a single table
--      it uses join to get from multiples

--3
	grant 
		select on product 
		to MANAGER
		
	grant 
		update, insert on customer
		to MANAGER;

-- 4
    grant 
        select 
        on customerandorders 
        to MANAGER