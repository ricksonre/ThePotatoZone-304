drop view customerandorders;

--Question 1 - Views and Security
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
    -- does it grant only ???

--Question 2 - Triggers
--1
    create trigger update_total_amount
        after update on orderproduct
        for each row
        update ordersummary
        set ordersummary.TotalAmount = 
            ();

        select orderId, sum(price*quantity) as totalAmount
        from orderproduct
        group by orderId;
        --------------?????????????????????????/

    create trigger insert_total_amount
        after insert on orderproduct
        for each row

    create trigger delete_total_amount
        after delete on orderproduct
        for each row
--2
