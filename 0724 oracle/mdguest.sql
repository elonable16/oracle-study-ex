/*mdguest2�� ���Ѻο� - with grant option �� ���Ե��� �ʾ� ����*/
GRANT SELECT ON elon.book to mdguest2;
/*���Ѻο� ����*/
GRANT SELECT ON elon.customer TO mdguest2;

CREATE TABLE mdguest2.newtable(myname varchar(40), myphone varchar(20));
insert into mdguest2.newtable(myname, myphone) values('ȫ�浿', '000-000-0100');