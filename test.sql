-- 권한이 불충분
create table TABLE_DEFAULT(
    login_id varchar2(20) constraint TBLDF_LGNID_PK primary key,
    login_pwd varchar2(20) DEFAULT '1234',
    tel varchar2(20));

-- 테이블스페이스 'USERS'에 대한 권한이 없습니다.
INSERT INTO TABLE_DEFAULT(LOGIN_ID, LOGIN_PWD)
VALUES('TEST_ID','TEST_ID');
