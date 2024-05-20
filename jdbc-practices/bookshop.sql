-- author 

insert into author values(null, '...'); 
insert into author(name) values(?); -- no컬럼엔 값 안넣음 

select * from author;
select * from book;

select a.no, a.title, a.status, b.name from book a, author b where a.author_no = b.no order by no desc;