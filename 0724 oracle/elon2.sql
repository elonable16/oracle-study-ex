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
/*����� Ȯ�� ����*/

SET TRANSACTION NAME 'T1';

UPDATE elon.book SET price = price +100 WHERE bookid=2;

UPDATE elon.book SET price = price + 100 WHERE bookid=1;

commit;

/*�ݺ��Ұ��� �б�*/

set transaction isolation level read committed; 
select sum(price) �Ѿ� from elon.book;
update elon.book set price=price+500 where bookid=1;
select sum(price) �Ѿ� from elon.book;
commit;

/*serializable*/
set transaction isolation level read committed;
select sum(price) �Ѿ� from elon.book;
insert into elon.book values(12,'�׽�Ʈ','�׽�Ʈ���ǻ�',5500);
select sum(price) �Ѿ� from elon.book;
commit;