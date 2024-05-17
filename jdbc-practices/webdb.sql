-- insert (insertEx01.java 테스트) 
insert into dept values(null, '디자인팀');

-- select 
select * from dept; 
select * from emp;

-- delete
-- delete from dept where no = 1; -- 그냥 삭제하면 fk에서 이상현상..나옴 
delete from dept where no = 7;

-- update
update dept set name = '시스템개발' where no = 2;