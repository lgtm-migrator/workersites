create table Account (id identity,
						email varchar unique,
						password varchar not null,
						firstName varchar not null, 
						lastName varchar not null,
						gender varchar not null,
						maidenname varchar,
						primary key (id));