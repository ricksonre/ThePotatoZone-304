create table Customer
(
    cid         integer auto_increment,
    pr         integer auto_increment,
    firstName   varchar(50),
    lastName    varchar(50), 
    email       varchar(50),
    phoneNo     integer,
    address     varchar(200),
    city        varchar(20),
    state       varchar(50),
    postcode    varchar(20),
    country     varchar(50),
    UID         varchar(50),
    pass        varchar(50),

    pid         integer,

    primary key(cid),
    foreign key(pid) 
        references PaymentMethod(pid)
);

create domain renrange as integer
    default null
    check(value in (1,2,3,4,5));

create table Review
(
    rid         integer auto_increment,
    rating      renrange,
    comment     varchar(750), 
    rdate       date,
    
    cid         integer,
    prid        integer,

    primary key(rid),
    foreign key(cid)
        references Customer(cid)
        on delete cascade,
    foreign key(prid) 
        references Customer(prid)
        on delete cascade
);

create table OrderSummary
(
    oid             integer auto_increment,
    orderDate       date,
    total           decimal(100,2),
    shipAdd         varchar(50), 
    city            varchar(50), 
    state           varchar(50), 
    country         varchar(50), 
    postcode        integer,



    primary key(oid),
    foreign key(cid)
        references Customer(cid)
        on delete cascade
    foreign key(prid) 
        references Customer(prid)
        on delete cascade
);

//////////////////////////////////////////////


create domain payMethod as char(10)
    default null
    check (value in ( 'PayPal', 'Visa', 'Mastercard'));

create table PaymentMethod
(
    pid         integer,
    method      payMethod,
    paymentNo   integer,
    paymentExp  date,

    cid         integer,

    primary key (pid),
    foreign key (cid) references Customer(cid)
        on delete cascade

);

create table Shipment
(
    sid         integer,
    desc        varchar(500),
    shipDate    date,

    wid         integer,

    primary key (sid),
    foreign key (wid) references Warehouse(wid)
);

create table Warehouse
(
    wid     integer,
    wname   varchar(50),
    
    primary key (wid)
);

create table ShoppingCart
(
    pramt       integer,
    prprice     decimal(100,2),

    cid         integer,
    prid        integer,

    foreign key (cid) references Customer (cid)
        on delete cascade
        on update cascade,
    foreign key (prid) references Product (prid)
        on delete cascade
        on update cascade,
);

create table Product
(
    prid        integer auto_increment,
    name        varchar(50),
    price       decimal(100,2),
    image       varchar(150),
    image2      blob,
    desc        varchar(500),
    
    catid       integer,

    primary key (prid),
    foreign key (catid) references Category(catid)
);

create table Category(
    catid       int auto_increment,
    cname       varchar(50),

    primary key (catid)
);
