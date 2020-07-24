SET TRANSACTION NAME 'T2';
SELECT*
FROM elon.book
WHERE bookid=1;

Update elon.book
SET price = price + 100
WHERE bookid=1;

SELECT *
FROM elon.book
WHERE bookid=1;

Commit;
/*데드락 확인 예제*/

SET TRANSACTION NAME 'T1';

UPDATE elon.book SET price = price +100 WHERE bookid=2;

UPDATE elon.book SET price = price + 100 WHERE bookid=1;

commit;

/*반복불가능 읽기*/

set transaction isolation level read committed; 
select sum(price) 총액 from elon.book;
update elon.book set price=price+500 where bookid=1;
select sum(price) 총액 from elon.book;
commit;

/*serializable*/
set transaction isolation level read committed;
select sum(price) 총액 from elon.book;
insert into elon.book values(12,'테스트','테스트출판사',5500);
select sum(price) 총액 from elon.book;
commit;