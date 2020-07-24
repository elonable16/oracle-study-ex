/*TABLESPACE ����*/
CREATE TABLESPACE md_tbs DATAFILE 'D:\elon\oracle\md_tbs_data01.dbf' size 10M;
/*���� ����*/
CREATE USER mdguest IDENTIFIED BY mdguest;
CREATE USER mdguest2 IDENTIFIED BY mdguest2 DEFAULT TABLESPACE md_tbs;
/*���� �㰡*/
GRANT CONNECT, RESOURCE TO mdguest;
GRANT CONNECT, RESOURCE TO mdguest2;

/*ALTER user _____ account unlock; ����Ŭ ����ڸ� ��ð� �Ⱦ���, ������ LOCK�� �ɸ���*/

/*���� ����� ���� �ο��ϱ�*/
CREATE ROLE programmer;
GRANT CREATE ANY TABLE, CREATE ANY VIEW TO programmer;
GRANT programmer TO mdguest;
SET ROLE ALL; /*�̹� ����ڰ� �������̶�� ������ ����Ҽ� �ֵ��� ���־�� �Ѵ�*/