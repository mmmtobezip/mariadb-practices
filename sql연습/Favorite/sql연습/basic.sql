select version(), current_date, now() from dual;

-- 수학함수, 사칙연산 ok
select sin(pi()/4), 1+2*3-4/5 from dual;

-- 대소문자 구분 구분x
select version(), current_DATE, NOW() from dual;

show tables;
-- table 생성: DDL
create table pet(
	name varchar(100),
    owner varchar(50),
    species varchar(20),
    gender char(1),
    birth date,
    death date
);

-- schema 확인
describe pet;
desc pet;

-- table 삭제
drop table pet;
show tables;

-- insert: DML(C)
INSERT INTO pet
		values('성탄이', '안대혁', 'dog', 'm', '2007-12-15', NULL);

-- select: DML(R)
select * from pet;

-- update: DML(U)
UPDATE
	pet
SET
	name = '오타니'
WHERE
	name = '성탄이';

-- delete: DML(D)
DELETE FROM pet
WHERE name = '오타니';

-- load data
LOAD data local infile '/root/pet.txt' INTO TABLE pet