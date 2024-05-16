-- cast
-- '2013-01-09'를 포맷팅하고자함. 
select '12345' + 10, cast('12345' as int) + 10 from dual;
select date_format(cast('2013-01-09' as date), '%Y년 %m월 %d일') from dual;
select cast(cast(1-2 as unsigned) as signed) from dual; -- signed: -1로 돌아갈것 
select cast(cast(1-2 as unsigned) as int) from dual; 
select cast(cast(1-2 as unsigned) as integer) from dual; 

-- type
-- 문자: varchar, char (대략 maximum 4,000byte), varchar의 경우 varchar(20) 등 사이즈를 주는게 의미없을 수 있음. 변할 수 있는 타입형임(늘었다 줄었다.)-> 공간을 아껴 쓸 수 있음. / char는 사이즈를 주면 해당 사이즈만큼 고정 할당되기에, 모든 컬럼의 사이즈가 고정된 경우(e.g. 전화번호/주민등록번호 등) 사용하면 좋다. -> 공간을 fit하게 사용, 빠르게 사용 가능
-- 문자: text(varchar보다 크게 잡을 수 있는), CLOB(Charactor Large OBject)
-- 정수: medium int, int(=signed, integer), unsigned, big int
-- 실수: float, double  
-- 시간: date, datetime
-- LOB: CLOB, BLOB(Binary Large OBject) 