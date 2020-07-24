GRANT ALL ON book TO elon2;
GRANT ALL ON orders TO elon2;
GRANT ALL ON customer To elon2;

SET TRANSACTION NAME 'T1';
SELECT*
FROM book
Where bookid=1;

UPDATE book
SET price = 7100
WHERE bookid=1;

SELECT *
FROM book
Where bookid=1;

COMMIT;

/* 데드락 예제*/

SET TRANSACTION NAME 'T1';

UPDATE book SET price = price +100 WHERE bookid=1;

UPDATE book SET price = price + 100 WHERE bookid=2; /*교착상태 메시지 출력*/

commit;

/*반복불가능 읽기방지*/

create table users(id number, name varchar2(20), age number);

INSERT into users values(1,'hong gildong',30);
commit;

set transaction isolation level read committed; 
select sum(price) 총액 from book;
select sum(price) 총액 from book;
commit;

/*SERIALIZABLE 모드*/
SET transaction isolation level serializable;
select sum(price) 총액 FROM book;
select sum(price) 총액 from book;
commit;