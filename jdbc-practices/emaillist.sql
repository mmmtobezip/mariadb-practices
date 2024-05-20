desc emaillist;
-- (c)reate
insert into emaillist values(null, '둘', '리', 'dooly@gmail.com');

-- (r)ead
select no, first_name, last_name, email from emaillist order by no desc;

-- (d)elete 
delete from emaillist where email = 'dooly@gmail.com';

select * from emaillist;