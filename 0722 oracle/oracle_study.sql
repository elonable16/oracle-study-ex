/*뷰의 생성*/
CREATE VIEW vw_book AS SELECT * FROM book WHERE bookname LIKE '%축구%';
SELECT * FROM vw_book;
CREATE VIEW vw_orders(orderid, custid, name, bookid, bookname, saleprice, orderdate)
AS SELECT od.orderid, od.custid, cs.name, od.bookid, bk.bookname, od.saleprice, od.orderdate
    FROM orders od, customer cs, book bk
    WHERE od.custid=cs.custid AND od.bookid=bk.bookid;
SELECT * FROM vw_orders;
/*뷰의 수정*/
CREATE OR REPLACE VIEW vw_customer(custid, name, address)
AS SELECT custid, name, address
    FROM customer
    WHERE address LIKE '%영국%';
SELECT * FROM vw_customer;
/*뷰의 삭제*/
DROP VIEW vw_customer;
/*인덱스*/
/*WHERE절에 자주사용되는 속성, 조인에 자주사용되는 속성, 선택도가 낮을수록 유리*/
CREATE INDEX ix_book ON book(bookname);
CREATE INDEX ix_book2 ON book(publisher,price);
ALTER INDEX ix_book REBUILD;
DROP INDEX ix_book;

/*DATABASE PROGRAMMING*/
/*PL/SQL* - 프로시저*/

EXEC insertbook(13, '스포츠과학', '마당과학서적', 25000);
SELECT * FROM book;
/*제어문을 사용한 프로시저*/
EXEC bookinsertorupdate(15,'스포츠 즐거움', '마당과학서적',25000);
SELECT * FROM BOOK;
EXEC bookinsertorupdate(15,'스포츠 즐거움', '마당과학서적',20000);
SELECT * FROM BOOK;

/*결과를 반환하는 프로시저*/
SET SERVEROUTPUT ON;
DECLARE av NUMBER;
BEGIN
    averageval(av);
    DBMS_OUTPUT.PUT_LINE('책값 평균:'||av);
END;

/*커서를 사용하는 프로시저*/
EXEC interest;

/*트리거-자동백업*/
CREATE TABLE Book_log
(bookid_1 NUMBER, bookname_1 VARCHAR2(40), publisher_1 VARCHAR2(40), price_1 NUMBER);
INSERT INTO book VALUES(14,'스포츠 과학1', '이상미디어', 25000);
SELECT * FROM book WHERE bookid='14';
SELECT * FROM book_log WHERE bookid_1='14';

/*사용자 정의 함수*/
SELECT custid, orderid, saleprice, fnc_interest(saleprice) interest
FROM orders;