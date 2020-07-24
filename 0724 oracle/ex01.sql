/*TABLESPACE 생성*/
CREATE TABLESPACE md_tbs DATAFILE 'D:\elon\oracle\md_tbs_data01.dbf' size 10M;
/*계정 생성*/
CREATE USER mdguest IDENTIFIED BY mdguest;
CREATE USER mdguest2 IDENTIFIED BY mdguest2 DEFAULT TABLESPACE md_tbs;
/*권한 허가*/
GRANT CONNECT, RESOURCE TO mdguest;
GRANT CONNECT, RESOURCE TO mdguest2;

/*ALTER user _____ account unlock; 오라클 사용자를 장시간 안쓰면, 계정이 LOCK이 걸린다*/

/*역할 만들고 권한 부여하기*/
CREATE ROLE programmer;
GRANT CREATE ANY TABLE, CREATE ANY VIEW TO programmer;
GRANT programmer TO mdguest;
SET ROLE ALL; /*이미 사용자가 접속중이라면 권한을 사용할수 있도록 해주어야 한다*/