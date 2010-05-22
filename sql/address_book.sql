-- Author: Benjamin Oakes <hello@benjaminoakes.com>

create table people (
  id integer primary key autoincrement,
  first_name varchar(255),
  middle_name varchar(255),
  last_name varchar(255),
  birthday date,
  type varchar(50)
);

create table addresses (
  id integer primary key autoincrement,
  person_id integer,
  type varchar(50),
  address varchar(255),
  city varchar(255),
  state varchar(50),
  zip varchar(15)
);

create table phone_numbers (
  id integer primary key autoincrement,
  person_id integer,
  type varchar(50),
  number varchar(50)
);

create table email_addresses (
  id integer primary key autoincrement,
  person_id integer,
  type varchar(50),
  email_address varchar(255)
);

