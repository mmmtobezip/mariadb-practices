select * from user;
select * from blog;
select * from category;
select * from post;

DELETE FROM category WHERE id='test@gmail.com';
DELETE FROM blog WHERE id='test@gmail.com';
DELETE FROM user WHERE id='test@gmail.com';

select no
from post
where category_no = 2
order by reg_date desc;