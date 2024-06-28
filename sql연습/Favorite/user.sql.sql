select * from board;
select  count(*) from board;

select * from user;

show tables;
select * from user;

insert into user values(null, '관리자', 'admin@mysite.com', password('1234'), 'female', current_date(), 'ADMIN');

alter table user add column role enum('ADMIN', 'USER') not null default 'USER';

select * from site;
