CREATE TABLE summer
( sid NUMBER,
  class VARCHAR2(20),
  price NUMBER
  );
  
INSERT INTO summer VALUES (100, 'FORTRAN', 20000);
INSERT INTO summer VALUES (150,'PASCAL', 15000);
INSERT INTO summer VALUES (200, 'C', 10000);
INSERT INTO summer VALUES (250, 'FORTRAN', 20000);


SELECT *
FROM summer;

SELECT price "c ������"
FROM summer
WHERE class ='C';
 /*���� �̻�����*/
DELETE FROM summer
WHERE sid = 200;

SELECT price "c ������"
FROM summer
WHERE class ='C';

/*���� �̻�*/
INSERT INTO summer VALUES (NULL, 'JAVA', 25000);

SELECT * FROM summer;

SELECT COUNT(*) FROM summer;

/*���̺� �и�*/
create table summerprice
( class VARCHAR2(20),
  price NUMBER);

INSERT INTO summerprice VALUES('FORTRAN', 20000);
INSERT INTO summerprice VALUES('PASCAL', 15000);
INSERT INTO summerprice VALUES('C', 10000);

SELECT * FROM summerprice;

CREATE TABLE summerenroll
( sid NUMBER,
  class VARCHAR2(20);
  
INSERT INTO summerenroll VALUES(100, 'FORTRAN');
INSERT INTO summerenroll VALUES(150, 'PASCAL');
INSERT INTO summerenroll VALUES(200, 'C');
INSERT INTO summerenroll VALUES(250, 'FORTRAN');

SELECT * FROM summerenroll;

SELECT price "C ������"
FROM summerprice
WHERE class = 'C';

DELETE FROM summerenroll
WHERE sid=200;
SELECT * FROM summerenroll;
SELECT price "C ������"
FROM summerprice
WHERE class='C';

SET TRANSACTION NAME 'mytran';
INSERT INTO book VALUES(99,'������ ���̽�', '�Ѻ�', 25000);
SELECT bookname "bookname1" FROM book
    WHERE bookid=99;
SAVEPOINT a;

UPDATE book SET bookname='������ ���̽� ����' WHERE bookid=99;
SELECT bookname "bookname2" FROM book
    WHERE bookid=99;
SAVEPOINT b;

UPDATE book SET bookname='������ ���̽� ���� �� �ǽ�' WHERE bookid=99;
SELECT bookname "bookname3" FROM book
    WHERE bookid=99;
ROLLBACK TO b;

SELECT bookname "bookname4" FROM book
    WHERE bookid=99;
ROLLBACK TO a;

SELECT bookname "bookname5" FROM book
    WHERE bookid=99;
COMMIT;

UPDATE book SET bookname ='������ ���̽� ���� �� �ǽ�2' WHERE bookid=99;
SELECT bookname "bookname6" FROM book
    WHERE bookid=99;
ROLLBACK;

SELECT bookname "bookname7" FROM book
    WHERE bookid=99;
DELETE FROM book WHERE bookid=99;
COMMIT;

    