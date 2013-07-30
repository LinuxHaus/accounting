CREATE TABLE accounting (
    accounting_id bigint,
    customer_id int,
    buzzword_id int,
    ticketnr varchar(255),
    starttime timestamp with timezone,
    endtime timestamp with timezone,
    tickettext varchar(255),
    supporter_id int,
    accountinghint_id bigint,
    accountingstatus_id int);

CREATE TABLE customers (
	customer_id int,
    customername varchar(255),
    main_id boolean);
-- main_id: 'true': the preferred name for this id

CREATE TABLE buzzwords (
    buzzword_id int,
    buzzwordname varchar(255),
    main_id boolean);
-- main_id: 'true': the preferred name for this id

CREATE TABLE supporters (
    supporter_id int,
    supportername varchar(255));

CREATE TABLE accountinghints (
    accountinghint_id bigint,
    accountingcomment varchar(255));

CREATE TABLE accountingstatus (
    accountingstatus_id int,
    accountingstatus varchar(255));
