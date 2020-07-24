/*mdguest2에 권한부여 - with grant option 이 포함되지 않아 실패*/
GRANT SELECT ON elon.book to mdguest2;
/*권한부여 성공*/
GRANT SELECT ON elon.customer TO mdguest2;

CREATE TABLE mdguest2.newtable(myname varchar(40), myphone varchar(20));
insert into mdguest2.newtable(myname, myphone) values('홍길동', '000-000-0100');