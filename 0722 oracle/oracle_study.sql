/*���� ����*/
CREATE VIEW vw_book AS SELECT * FROM book WHERE bookname LIKE '%�౸%';
SELECT * FROM vw_book;
CREATE VIEW vw_orders(orderid, custid, name, bookid, bookname, saleprice, orderdate)
AS SELECT od.orderid, od.custid, cs.name, od.bookid, bk.bookname, od.saleprice, od.orderdate
    FROM orders od, customer cs, book bk
    WHERE od.custid=cs.custid AND od.bookid=bk.bookid;
SELECT * FROM vw_orders;
/*���� ����*/
CREATE OR REPLACE VIEW vw_customer(custid, name, address)
AS SELECT custid, name, address
    FROM customer
    WHERE address LIKE '%����%';
SELECT * FROM vw_customer;
/*���� ����*/
DROP VIEW vw_customer;
/*�ε���*/
/*WHERE���� ���ֻ��Ǵ� �Ӽ�, ���ο� ���ֻ��Ǵ� �Ӽ�, ���õ��� �������� ����*/
CREATE INDEX ix_book ON book(bookname);
CREATE INDEX ix_book2 ON book(publisher,price);
ALTER INDEX ix_book REBUILD;
DROP INDEX ix_book;

/*DATABASE PROGRAMMING*/
/*PL/SQL* - ���ν���*/

EXEC insertbook(13, '����������', '������м���', 25000);
SELECT * FROM book;
/*����� ����� ���ν���*/
EXEC bookinsertorupdate(15,'������ ��ſ�', '������м���',25000);
SELECT * FROM BOOK;
EXEC bookinsertorupdate(15,'������ ��ſ�', '������м���',20000);
SELECT * FROM BOOK;

/*����� ��ȯ�ϴ� ���ν���*/
SET SERVEROUTPUT ON;
DECLARE av NUMBER;
BEGIN
    averageval(av);
    DBMS_OUTPUT.PUT_LINE('å�� ���:'||av);
END;

/*Ŀ���� ����ϴ� ���ν���*/
EXEC interest;

/*Ʈ����-�ڵ����*/
CREATE TABLE Book_log
(bookid_1 NUMBER, bookname_1 VARCHAR2(40), publisher_1 VARCHAR2(40), price_1 NUMBER);
INSERT INTO book VALUES(14,'������ ����1', '�̻�̵��', 25000);
SELECT * FROM book WHERE bookid='14';
SELECT * FROM book_log WHERE bookid_1='14';

/*����� ���� �Լ�*/
SELECT custid, orderid, saleprice, fnc_interest(saleprice) interest
FROM orders;