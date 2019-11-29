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
    CREATE TRIGGER updateordersummary
    	AFTER UPDATE ON orderproduct
    	REFERENCING
			NEW ROW AS UpdatedR
			OLD ROW AS OldR
    	UPDATE ordersummary SET totalAmount = totalAmount +(UpdatedR.quantity*UpdatedR.price)-(OldR.quantity*OldR.price) WHERE UpdatedR.orderId = ordersummary.orderId

    CREATE TRIGGER insertordersummary
		AFTER INSERT ON orderproduct
		REFERENCING
			NEW ROW AS UpdatedR
		FOR EACH ROW
		UPDATE ordersummary SET totalAmount = totalAmount +UpdatedR.quantity*UpdatedR.price WHERE UpdatedR.orderId = ordersummary.orderId

    CREATE TRIGGER deleteordersummary
		AFTER DELETE ON orderproduct
		REFERENCING
			OLD ROW AS OldR
		FOR EACH ROW
		UPDATE ordersummary SET totalAmount = totalAmount -OldR.quantity*OldR.price WHERE OldR.orderId = ordersummary.orderId
--2


