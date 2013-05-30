create table Account (id identity,
						email varchar unique,
						password varchar not null,
						fname varchar not null, 
						lname varchar not null,
						gender varchar not null,
						maidenname varchar,
						primary key (id));