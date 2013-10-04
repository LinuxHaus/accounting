-- no specific sql database selected, yet. Will very likely be MySQL or Postgres
-- pro Postgres:
--   has writeable VIEWs
--   has 'boolean' type
-- pro MySQL:
--   easier replication/setup/tuning

CREATE TABLE accounting (
    accounting_id bigserial,
    timeentry timestamp with timezone,
    customer_id int,
    buzzword_id int,
    ticketnr varchar(255),
    timestart timestamp with timezone,
    timeend timestamp with timezone,
    tickettext varchar(255),
    supporter_id int,
    accountinghint_id bigint,
    accountingstatus_id int);

CREATE TABLE accounting_history (
    accounting_id bigserial,
    timeentry timestamp with timezone,
    customer_id int,
    buzzword_id int,
    ticketnr varchar(255),
    timestart timestamp with timezone,
    timeend timestamp with timezone,
    accountingtext varchar(255),
    supporter_id int,
    accountinghint_id bigint,
    accountingstatus_id int);

CREATE TABLE customers (
	customer_id serial,
    customername varchar(255),
    main_id boolean);
-- main_id: 'true': the preferred name for this id

CREATE TABLE buzzwords (
    buzzword_id serial,
    buzzwordname varchar(255),
    main_id boolean);
-- main_id: 'true': the preferred name for this id

CREATE TABLE supporters (
    supporter_id serial,
    supportername varchar(255));

CREATE TABLE accountinghints (
    accountinghint_id bigint,
    accountingcomment varchar(255));

CREATE TABLE accountingstatus (
    accountingstatus_id serial,
    accountingstatus varchar(255));
