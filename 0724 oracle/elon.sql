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

/* ����� ����*/

SET TRANSACTION NAME 'T1';

UPDATE book SET price = price +100 WHERE bookid=1;

UPDATE book SET price = price + 100 WHERE bookid=2; /*�������� �޽��� ���*/

commit;

/*�ݺ��Ұ��� �б����*/

create table users(id number, name varchar2(20), age number);

INSERT into users values(1,'hong gildong',30);
commit;

set transaction isolation level read committed; 
select sum(price) �Ѿ� from book;
select sum(price) �Ѿ� from book;
commit;

/*SERIALIZABLE ���*/
SET transaction isolation level serializable;
select sum(price) �Ѿ� FROM book;
select sum(price) �Ѿ� from book;
commit;