-- SQL 은 대소문자 구별은 안함(쿼리문)
-- 대소문자 구별은 비밀번호만 함
-- 문자열 표현할 때 홑따옴표 사용함

-- scott 계정에 존재하는 모든 테이블 조회
SELECT
    *
FROM
    tab;

-- 조회(Select) : 행 단위로 조회, 열 단위로 조회

-- emp 테이블의 내용을 전체조회
SELECT
    *
FROM
    emp;

-- emp 테이블의 empno, ename, job만 조회
SELECT
    empno,
    ename,
    job
FROM
    emp;

-- emp 테이블의 empno, deptno 조회
SELECT
    empno,
    deptno
FROM
    emp;

-- 중복 제거 후 조회 : distinct
SELECT DISTINCT
    deptno
FROM
    emp;

-- 별칭을 붙여서 조회 : AS(alais)
SELECT
    empno AS 사원번호
FROM
    emp;

SELECT
    ename           AS 사원명,
    job             AS "직 책",
    sal             AS 급여,
    comm            AS 추가수당,
    sal * 12 + comm AS 연봉
FROM
    emp;

-- 정렬 : ORDER BY 컬럼명 기준(오름차순(ASC), 내림차순(DESC))

-- ename, sal 조회할 때 sal 내림차순으로 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

-- 오름차순(생략가능-기본값)
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;

-- emp 테이블의 전체 내용을 조회하고, 단 사원번호 내림차순
SELECT
    *
FROM
    emp
ORDER BY
    empno DESC;

-- 전체 내용 조회(부서번호 오름차순, 급여 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    hiredate,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no,
    job
FROM
    emp
ORDER BY
    deptno DESC,
    ename;
    
-- 특정 조건을 기준으로 원하는 데이터를 조회 : WHERE    

-- 전체 데이터 조회, 단, 부서번호가 30번인 데이터 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;
    
-- 사원번호가 7782번 조회
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- 부서번호가 30번이고, 사원직책이 SALESMAN 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

-- 사원번호가 7499이고, 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

-- 부서번호가 30이거나 사원직책이 CLERK인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';
    

-- 산술연산자를 사용한 WHERE

-- 연봉이 36000 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

-- 월급이 3000 보다 큰 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal > 3000;

-- 월급이 3000 이상인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

-- 이름의 첫 글자가 F 이후인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

-- 급여가 2500이상이고, 직업이 ANALYST인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

-- 직무가 SALESMAN 이거나, CLERK 이거나, MANAGER 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'SALESMAN'
    OR job = 'CLERK'
    OR job = 'MANAGER';

-- 등가비교연산자(같음 =, 같지않음 !=, <>, ^=)
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;

SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;


-- IN
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'ANALYST', 'CLERK', 'MANAGER' );

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'ANALYST', 'CLERK', 'MANAGER' );

-- 부서번호가 10, 20번 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );


-- BETWEEN A AND B

-- 급여가 2000 ~ 3000 사이인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

-- 급여가 2000 ~ 3000 사이가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;


-- LIKE 연산자와 와일드 카드
-- 일부 문자열이 포함된 데이터 조회
-- 와일드카드
-- ① % : 길이와 상관없이 모든 문자 데이터를 의미
-- ② _ : 어떤 값이든 한자리의 문자 데이터를 의미

-- 사원명이 S로 시작하는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

-- 사원명의 두번째 글자가 L인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

-- 사원명에 AM 문자가 포함되어 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

-- 사원명에 AM 문자가 포함되어 있지 않은 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

-- IS NULL
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;
-- NULL 은 0이 아니고 완전히 비어 있는 상태를 의미

-- MGR이 NULL 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

--MGR이 NULL이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

-- 집합 연산자 : 합집합 - UNION, UNION ALL(중복값을 제거하지 않음),
--              교집합 - INTERSECT
--              차집합 - MINUS


-- EMPNO, ENAME, SAL, DEPTNO 조회(부서번호가 10번이거나 20번인)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    sal,
    job,
    deptno,
    sal
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

-- 오라클 함수

-- 내장함수 - 1) 문자함수

--              대소문자 변경
--              UPPER(문자열) : 괄호 안 문자를 모두 대문자로 변환
--              LOWER(문자열) : 괄호 안 문자를 모두 소문자로 변환
--              INITCAP(문자열) : 괄호 안 문자 중 첫글자만 대문자로 변환, 나머지는 소문자

SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

-- ENAME이 SCOTT 인 찾기
SELECT
    *
FROM
    emp
WHERE
    lower(ename) = lower('scott');

SELECT
    *
FROM
    emp
WHERE
    lower(ename) LIKE lower('%scott%');


--              문자 길이 구하기
--              LENGTH(문자열) : 해당 문자열의 길이 돌려줌
--              LENGTHB(문자열) : 해당 문자열의 바이트수 돌려줌

SELECT
    ename,
    length(ename)
FROM
    emp;

-- 한글 한 자당 3BYTE 사용
-- DUAL : 데이터베이스 관리자가 소유한 테이블 / 임시 연산이나 함수의 결과 값 확인 용도
SELECT
    length('한글'),
    lengthb('한글')
FROM
    dual;

-- JOB 이 6글자 이상인 사원들 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;


--              문자열 일부를 추출하기
--              SUBSTR(문자열데이터, 시작위치, 추출길이)
--              SUBSTR(문자열데이터, 시작위치)
SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

-- EMP 테이블의 모든 사원 이름을 세 번째 글자부터 끝까지 출력하기
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;


--              문자열 데이터 안에서 특정 문자를 찾기
--              INSTR(문자열, 찾을 문자열, 시작위치(옵션), 몇번째에 있는걸 찾을 것인지(옵션))
SELECT
    instr('HELLO, ORACLE!', 'L'),
    instr('HELLO, ORACLE!', 'L', 5),
    instr('HELLO, ORACLE!', 'L', 2, 2)
FROM
    dual;

-- 원본 문자열 : 이것이 Oracle이다. 이것도 오라클이다.
-- 찾을 문자열 : 이것

-- 제일 처음에 나오는 이것의 위치를 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것')
FROM
    dual;

-- 시작위치를 3으로 지정한 후 나오는 이것의 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 3)
FROM
    dual;

-- 이것이 두번째로 나오는 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 1, 2)
FROM
    dual;

-- 사원 이름에 문자 S가 있는 사원 구하기
SELECT
    ename
FROM
    emp
WHERE
    instr(ename, 'S') > 0;


--              특정 문자를 다른 문자로 바꾸는 함수
--              REPLACE(문자열 데이터 또는 열이름, 찾는문자, 바꿀문자)

-- 010-1234-5678 => 010 1234 5678, 01012345678
SELECT
    '010-1234-5678'                    AS 원본,
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')      AS replace2
FROM
    dual;


--              두 문자열 데이터를 합치는 함수
--              CONCAT(문자열1, 문자열2)

-- EMPNO, ENAME 합쳐서 조회
SELECT
    empno,
    ename,
    concat(empno, ename)
FROM
    emp
WHERE
    ename = 'SCOTT';

-- 7788:SCOTT
SELECT
    empno,
    ename,
    concat(empno, concat(':', ename))
FROM
    emp
WHERE
    ename = 'SCOTT';


-- || : 문자열 데이터 연결 연산자
SELECT
    empno || ename,
    empno
    || ':'
    || ename
FROM
    emp
WHERE
    ename = 'SCOTT';


-- 문자열 함수 : 공백제거(기본)
--              TRIM : 양쪽 공백 제거
--              LTRIM : 왼쪽 공백 제거
--              RTRIM : 오른쪽 공백 제거
SELECT
    '      이것이      ',
    TRIM('      이것이      ')
FROM
    dual;


-- TRIM(삭제옵션(선택), 삭제할 문자(선택), from 원본문자열)
SELECT
    '['
    || TRIM('_' FROM '__Oracle__')
    || ']' AS trim,
    '['
    || TRIM(LEADING '_' FROM '__Oracle__')
    || ']' AS trim_leading,
    '['
    || TRIM(TRAILING '_' FROM '__Oracle__')
    || ']' AS trim_trailing,
    '['
    || TRIM(BOTH '_' FROM '__Oracle__')
    || ']' AS trim_both
FROM
    dual;


-- 숫자함수 : ROUND(숫자, 반올림 위치(선택))
--           TRUNC(숫자, 버림 위치(선택))
--           CEIL(숫자) : 입력된 숫자와 가장 가까운 큰 정수
--           FLOOR(숫자) : 입력된 숫자와 가장 가까운 작은 정수
--           MOD(숫자, 나눌숫자) : 나머지 값

SELECT
    round(1234.5678)      AS round,
    round(1234.5678, 0)   AS round0,
    round(1234.5678, 1)   AS round1,
    round(1234.5678, 2)   AS round2,
    round(1234.5678, - 1) AS round_minus1,
    round(1234.5678, - 2) AS round_minus2
FROM
    dual;

SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc0,
    trunc(1234.5678, 1)   AS trunc1,
    trunc(1234.5678, 2)   AS trunc2,
    trunc(1234.5678, - 1) AS trunc_minus1,
    trunc(1234.5678, - 2) AS trunc_minus2
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;
    
    
-- 날짜함수
-- SYSDATE : 오라클 데이터베이스 서버가 설치된 os의 현재 날짜와 시간
-- ADD_MONTHS : 몇 개월 이후 날짜를 구하는 함수

SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;

SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;


-- 입사 20주년이 되는 날짜 조회
SELECT
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;

-- 현재 날짜를 기준으로 입사 40년 미만인 사원 조회
SELECT
    ename,
    hiredate
FROM
    emp
WHERE
    add_months(hiredate, 480) > sysdate;


-- MONTHS_BETWEEN : 두 날짜 간의 개월 수 차이 구하기
SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(sysdate, hiredate)        AS month1,
    months_between(hiredate, sysdate)        AS month2,
    trunc(months_between(sysdate, hiredate)) AS month3
FROM
    emp;
    
-- next_day(날짜, 요일문자)
-- last_day(날짜)
SELECT
    sysdate,
    next_day(sysdate, '월요일'),
    last_day(sysdate)
FROM
    dual;

-- 형변환 함수
-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환
SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD') AS 현재날짜
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'MM') AS 현재월
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'MON') AS 현재월
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH:MI:SS') AS 현재시간
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'AM HH12:MI:SS') AS 현재시간
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH24:MI:SS') AS 현재시간
FROM
    dual;

-- L(Locale) : 지역화폐단위를 붙여서 출력
-- 9, 0 : 숫자의 한 자리를 의미함(9는 빈자리를 채우지 않음, 0 빈자리를 채우는 개념)
SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$,
    to_char(sal, '$000,000') AS sal_$2,
    to_char(sal, 'L999,999') AS sal_l
FROM
    emp;

SELECT
    to_number('1,300', '999,999')
FROM
    dual;

SELECT
    TO_DATE('2021-09-12', 'YYYY-MM-DD') AS todate1,
    TO_DATE('20210912', 'YYYY-MM-DD')   AS todate2
FROM
    dual;

-- 날짜 데이터는 연산이 가능함
-- 1981-06-01 이후 입사자
SELECT
    *
FROM
    emp
WHERE
    hiredate > TO_DATE('1981/06/01', 'YYYY-MM-DD');


-- 널처리 함수
-- NVL(데이터, 널이면 반환할 값)
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm
FROM
    emp;

SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;

-- NVL2(데이터, 널이 아닐경우 반환할 값, 널이면 반환할 값)
SELECT
    empno,
    ename,
    sal,
    comm,
    nvl2(comm, 'O', 'X'),
    nvl2(comm, sal * 12 + comm, sal * 12)
FROM
    emp;


-- DECODE 함수
-- DECODE([검사 대상이 될 열 또는 데이터],
--        [조건1], [데이터가 조건 1과 일치할 때 반환할 결과],
--        [조건2], [데이터가 조건 2와 일치할 때 반환할 결과],
--        .......
--        [위 조건들 중에서 일치한 경우가 없을 때 반환할 결과])

-- job 에 따라 급여의 비율 설정
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS upsal
FROM
    emp;
    
    
-- case : DECODE 문으로 작성할 수 있는 것들은 모두 변환 가능
--        = 의 의미로 사용되지만 다른 조건도 가능하다
SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ANALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS upsal
FROM
    emp;


-- COMM 이 널이면 '해당사항 없음', 0 이면 '수당없음', 0보다 크면 '수당 : 2500' 출력
SELECT
    empno,
    ename,
    comm,
    CASE
        WHEN comm IS NULL THEN
            '해당사항 없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm > 0 THEN
            '수당 : ' || comm
    END AS comm_text
FROM
    emp;

-- 사원들의 월 평균 근무일수는 21.5일이다.
-- 하루 근무 시간을 8시간으로 보았을 때 사원들의 하루 급여(DAY_PAY)와 시급(TIME_PAY)를 계산하여 결과를 출력한다.
-- 단, 하루 급여는 소수점 셋째 자리에서 버리고, 시급은 두 번째 소수점에서 반올림하시오.

-- 하루급여 = 월급 / 21.5
-- 시급 = 하루급여 / 8

select empno, ename, sal, trunc(sal / 21.5, 2) as day_pay, round(sal / 21.5 / 8, 1) as time_pay from emp;

-- 사원들은 입사일(HIREDATE)을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다.
-- 사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 아래와 같이 출력하시오.
-- 단, 추가수당(COMM)이 없는 사원의 추가 수당은 N/A로 출력하시오.

select comm, nvl(comm, 0) from emp;
select comm, nvl(comm, '0') from emp;

select comm, nvl(comm, 'N/A') from emp;
-- nvl(a, b) => 두 개의 타입을 같은 타입으로 설정
select comm, nvl(to_char(comm), 'N/A') from emp;

select empno, ename, hiredate, next_day(add_months(hiredate, 3), '월요일') as R_JOB, nvl(to_char(comm), 'N/A') as comm from emp;


-- 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오.
-- 직속상관의 사원 번호가 존재하지 않을 경우 : 0000
-- 직속상관의 사원 번호 앞 두자리가 75일 경우 : 5555
-- 직속상관의 사원 번호 앞 두자리가 76일 경우 : 6666
-- 직속상관의 사원 번호 앞 두자리가 77일 경우 : 7777
-- 직속상관의 사원 번호 앞 두자리가 78일 경우 : 8888
-- 그 외 직속 상관 사원 번호의 경우 : 본래 직속 상관의 사원번호 그대로 출력

select empno, ename, mgr, 
decode(substr(to_char(mgr), 1, 2),
null, '0000',
'75', '5555',
'76' , '6666',
'77', '7777',
'78', '8888',
to_char(mgr))
as chg_mgr
from emp;


select empno, ename, mgr, 
case when mgr is null then '0000'
when substr(to_char(mgr), 1, 2) = '75' then '5555' -- when mgr like '75%' then '5555'
when substr(to_char(mgr), 1, 2) = '76' then '6666'
when substr(to_char(mgr), 1, 2) = '77' then '7777'
when substr(to_char(mgr), 1, 2) = '78' then '8888'
else to_char(mgr)
end as chg_mgr
from emp;


-- 다중행 함수 : SUM(), COUNT(), MAX(), MIN(), AVG()

select sum(sal) from emp;

-- select sum(sal), ename from emp; -- 단일 그룹의 그룹 함수가 아닙니다

-- EMP 테이블의 데이터 개수 조회
select count(*) from emp;

select count(empno) from emp;

select count(sal) from emp;

select count(distinct sal) from emp;

-- 부서번호가 10번인 사원의 최대 급여
select max(sal) from emp where deptno = 10;

-- 부서번호가 10번인 사원의 최소 급여
select min(sal) from emp where deptno = 10;

-- 부서번호가 20번인 사원 중에서 제일 오래된 입사일 조회
select min(hiredate) from emp where deptno = 20;

-- 부서번호가 30번인 사월들의 평균 급여 조회
select round(avg(sal), 0) from emp where deptno = 30;

select round(avg(distinct sal), 0) from emp where deptno = 30;


-- GROUP BY 그룹화할 열 지정(여러개 지정 가능)

-- 부서별 급여의 합 조회
select sum(sal), deptno from emp group by deptno order by deptno;

-- 부서별 급여의 평균 조회
select avg(sal), deptno from emp group by deptno order by deptno;

-- 부서별, 직무별 급여 평균 조회
select deptno, job, avg(sal) from emp group by deptno, job order by deptno, job;

-- GROUP BY ~ HAVING 조건식

-- 부서별, 직무별 급여 평균 조회(단, 급여의 평균이 2000 이상)

--select deptno, job, avg(sal) 
--from emp 
--where avg(sal) >= 2000 -- 그룹 함수는 허가되지 않습니다
--group by deptno, job 
--order by deptno, job;

select deptno, job, avg(sal) 
from emp 
group by deptno, job having avg(sal) >= 2000
order by deptno, job;

select deptno, job, avg(sal) 
from emp 
where sal <= 3000 -- ① 출력 대상이 되는 행 제한
group by deptno, job having avg(sal) >= 2000 -- ② 그룹화한 행 제한
order by deptno, job;

-- 부서번호(DEPTNO), 평균급여(AVG_SAL), 최고급여(MAX_SAL), 최저급여(MIN_SAL), 사원수(CNT)를 출력한다.
-- 단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서번호별로 출력하는 SQL 문을 작성하시오.
-- as 생략 가능
select deptno, trunc(avg(sal)) avg_sal, max(sal) max_sal, min(sal) min_sal, count(deptno)
from emp
group by deptno
order by deptno DESC;

-- 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하는 SQL문을 작성하시오.
select job, count(*)
from emp
group by job having count(job) >= 3;

-- 사원들의 입사연도(HIRE_YEAR)를 기준으로 부서별로 몇 명이 입사했는지 출력하는 SQL문 작성하시오.
select to_char(hiredate, 'YYYY') as hire_year, deptno, count(*) as cnt 
from emp
group by to_char(hiredate, 'YYYY'), deptno
order by cnt, deptno;


-- 데이터 삽입, 삭제, 수정 : 결과는 실행된 행의 갯수로 넘어옴

-- 실습용 테이블 생성
create table dept_temp as select * from dept;

select * from dept_temp;

-- insert : 데이터 삽입
-- insert into 테이블명(필드명...) values(값1, 값2...)
-- insert into 테이블명 values(값1, 값2...)

insert into dept_temp(deptno, dname, loc) values(50, 'DATABASE', 'SEOUL');

insert into dept_temp values(60, 'NETWORK', 'BUSAN');

insert into dept_temp values('NETWORK', 'BUSAN', 70); -- RA-01722: 수치가 부적합합니다
insert into dept_temp(dname, loc, deptno) values('NETWORK', 'BUSAN', 70);

-- 이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
-- insert into dept_temp(deptno, dname, loc) values(500, 'DATABASE', 'SEOUL');

-- NULL 삽입하는 방법(테이블 생성시 널이 가능하도록 열이 설정되어 있는 경우만 사용 가능)
insert into dept_temp(deptno, dname) values(90, 'DATABASE');
insert into dept_temp(deptno, dname, loc) values(91, 'WEB', NULL);
insert into dept_temp(deptno, dname, loc) values(92, 'MOBILE', '');


COMMIT;


-- 실습용 테이블 생성
-- 테이블 구조는 복사하되, 데이터는 복사하고 싶지 않을 때
create table emp_temp as select * from emp where 1<>1;

select * from emp_temp;

desc emp_temp;

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(1111, '홍길동', 'manager', null, '2021-09-27', 4000, null, 10);

insert into emp_temp
values(2222, '성춘향', 'analyst', null, '2021/09/27', 5000, null, 10);

insert into emp_temp
values(3333, '박보검', 'analyst', null, sysdate, 5000, null, 10);

select * from emp;

commit;

-- UPDATE : 수정
-- UPDATE 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값...
-- UPDATE 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값... where 수정할 조건

select * from dept_temp;

update dept_temp set loc = 'SEOUL' where deptno = 90;

update dept_temp set loc = 'BUSAN' where deptno = 91;

commit;

select * from emp_temp;


-- sal 이 4000이하인 사원만 추가 수당을 50으로 변경
update emp_temp set comm = 50 where sal <= 4000;

commit;

update emp_temp
set sal = 1500
where empno = 1111;


update emp_temp set comm = 100;

rollback;

-- DELETE : 삭제
-- DELETE 테이블 이름 where 삭제할 데이터 조건
-- DELETE FROM 테이블 이름 where 삭제할 데이터 조건

create table emp_temp2 as select * from emp;
select * from emp_temp2;

-- JOB이 MANAGER인 사원 삭제
delete emp_temp2 where job = 'MANAGER';

-- 전체 사원 삭제
delete emp_temp2;

rollback;


-- 조인
select count(*) from emp;
select count(*) from dept;

-- 카테시안 조인 : 나올 수 있는 모든 조합(14행 * 4행 = 56행)
select * from emp, dept;

-- 내부조인(inner 조인)
-- 등가조인 : 일치하는 데이터 추출
-- 비등가 조인 : 특정 범위에 있는 데이터 추출

select *
from emp, dept
where emp.deptno = dept.deptno;

-- 00918. 00000 -  "column ambiguously defined" 열의 정의가 애매합니다
select empno, ename, emp.deptno, dname
from emp, dept
where emp.deptno = dept.deptno;

select empno, ename, emp.deptno, dname
from emp, dept
where emp.deptno = dept.deptno
order by dname;

-- 테이블 별칭 설정
select empno, ename, e.deptno, dname
from emp e, dept d
where e.deptno = d.deptno
order by dname;

-- sal 3000 이상인 사원들의 사번, 이름, 부서번호, 부서명, 급여
select empno, ename, d.deptno, dname, sal
from emp e, dept d
where e.deptno = d.deptno and sal >= 3000;

-- 급여가 2500 이하이고, 사원번호가 9999 이하인 사원의 사번, 이름, 급여, 부서명, 부서위치
select empno, ename, sal, dname, loc
from emp e, dept d
where e.deptno = d.deptno and sal <= 2500 and empno <= 9999;


-- emp 테이블의 급여가 salgrade 특정 범위에 속하면 grade 값 조회
select * from salgrade;
select * from emp;

select * 
from emp e, salgrade s
where e.sal BETWEEN s.losal and s.hisal;


-- 자체 조인(셀프 조인) : 본인 테이블과 조인
select * from emp;

select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;


-- 외부조인(outer join)
-- 왼쪽외부조인(left outer join)
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);

-- 오른쪽외부조인(right outer join)
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr(+) = e2.empno;

-- 양쪽외부조인(+ 기호는 제공안함)
-- outer-join된 테이블은 1개만 지정할 수 있습니다
--select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
--from emp e1, emp e2
--where e1.mgr(+) = e2.empno(+);


-- 모든 데이터 베이스에서 사용가능한 표준 조인 구문

-- join ~ on ~
select empno, ename, emp.deptno, dname
from emp join dept on emp.deptno = dept.deptno
order by dname;

select empno, ename, d.deptno, dname, sal
from emp e join dept d on e.deptno = d.deptno 
where sal >= 3000;

select empno, ename, sal, dname, loc
from emp e join dept d on e.deptno = d.deptno
where sal <= 2500 and empno <= 9999;

select *
from emp e join salgrade s on e.sal between s.losal and s.hisal;

-- outer 표준 구문
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1 left outer join emp e2 on e1.mgr = e2.empno;

select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1 right outer join emp e2 on e1.mgr = e2.empno;

select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1 full outer join emp e2 on e1.mgr = e2.empno;

-- 급여가 2000초과인 사원들의 부서 정보, 사원 정보를 아래와 같이 출력하는 SQL 문을 작성하시오.
select d.deptno, dname, empno, ename, sal
from emp e, dept d
where e.deptno = d.deptno and sal > 2000
order by d.deptno;

select d.deptno, dname, empno, ename, sal
from emp e join dept d on e.deptno = d.deptno
where sal > 2000
order by d.deptno;

-- 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력하는 SQL문을 작성하시오.
select d.deptno, dname, floor(avg(sal)) avg_Sal, max(sal) max_sal, min(sal) min_sal, count(*) cnt
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno, dname;

select d.deptno, dname, floor(avg(sal)) as avg_Sal, max(sal) max_sal, min(sal) min_sal, count(*) cnt
from emp e join dept d on e.deptno = d.deptno
group by d.deptno, dname;

-- 모든 부서정보와 사원 정보를 아래와 같이 부서번호, 사원이름 순으로 정렬하여 출력하는 SQL문을 작성하시오.
select d.deptno, dname, empno, ename, job, sal
from emp e, dept d
where e.deptno(+) = d.deptno
order by d.deptno;

select d.deptno, dname, empno, ename, job, sal
from emp e right outer join dept d on e.deptno = d.deptno
order by d.deptno, e.empno;


-- 세 개 테이블 조인
select *
from emp e1, emp e2, emp e3
where e1.empno = e2.empno and e2.empno = e3.empno;

select *
from emp e1 join emp e2 on e1.empno = e2.empno 
            join emp e3 on e2.empno = e3.empno;
            
-- 모든 부서정보와 사원 정보, 급여등급 정보, 각 사원의 직속 상관의 정보 부서번호,
-- 사원번호 순으로 정렬하여 출력하는 SQL문을 작성하시오.

-- emp e1 테이블과 dept 테이블 조인 => dept 테이블 기준(dept 테이블 내용 모두 출력)
select * from emp e1, dept d1 where e1.deptno(+) = d1.deptno;

-- 첫번째 연결 결과랑 salgrade 조인
select * from emp e1, dept d1, salgrade s1 where e1.deptno(+) = d1.deptno and e1.sal between s1.losal(+) and s1.hisal(+);

-- 두번째 결과의 mgr이랑 emp e2 테이블의 empno 랑 조인
select d.deptno, dname, e1.empno, e1.ename, e1.mgr, e1.sal, losal, hisal, grade, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, dept d, salgrade s, emp e2
where e1.deptno(+) = d.deptno 
  and e1.sal between s.losal(+) and s.hisal(+)
  and e1.mgr = e2.empno(+)
order by d.deptno, e1.ename;

select d.deptno, dname, e1.empno, e1.ename, e1.mgr, e1.sal, losal, hisal, grade, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 right outer join dept d on e1.deptno = d.deptno
            left outer join salgrade s on e1.sal between s.losal and s.hisal
            left outer join emp e2 on e1.mgr = e2.empno
order by d.deptno, e1.ename;


-- 서브쿼리 : sql 문을 실행하는데 팔요한 데이터를 추가로 조회하기 위해 sql 문
--           내부에서 사용하는 select 문을 말함
--           연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓여서 괄호로 묶어서 사용
--           서브쿼리의 SELECT 절에 명시한 열은 메인쿼리의 비교 대상과 같은 자료형과
--           같은 개수로 지정

-- JONES 사원의 급여보다 높은 급여를 받는 사원 조회

-- JONES 사원의 급여 조회
select sal from emp where ename = 'JONES'; -- 2975
-- 2975보다 큰 사원 조회
select * from emp where sal > 2975;

-- 단일행 서브쿼리
-- 서브쿼리의 결과가 단 하나의 행으로 나온 상황
-- >, >=, =, <, <=, <>, ^=, !=


select * from emp where sal > (select sal from emp where ename = 'JONES');


-- ALLEN 사원의 추가 수당보다 많은 추가수당을 받는 사원 조회
select * from emp where comm > (select comm from emp where ename = 'ALLEN');

-- WARD 사원의 입사일보다 빨리 입사한 사원 목록 조회
select * from emp where hiredate < (select hiredate from emp where ename = 'WARD');


-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 
-- 사원정보(사원번호, 사원명, 직업, 급여)와 소속부서정보(부서번호, 부서명, 부서위치)를 조회
select empno, ename, job, sal, d.deptno, dname, loc
from emp e join dept d on e.deptno = d.deptno
where e.deptno = 20 and sal > (select avg(sal) from emp);


-- 다중행 서브쿼리
-- 서브쿼리 실행결과가 여러 개로 나오는 걸 의미
-- in : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하면 true
-- any(some) : 메인쿼리의 조건실을 만족하는 서브쿼리의 결과가 하나 이상이면 true
-- all : 메인쿼리의 조건실을 서브쿼리의 결과 모두가 만족하면 true
-- exists : 서브쿼리의 결과가 존재하면(행 1개이상 존재하면) true

-- 부서별 최고급여와 같은 사원 조회

-- 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
-- select * from emp where sal > (select max(sal) from emp group by deptno);


select * from emp where sal in (select max(sal) from emp group by deptno);


-- ANY(SOME)
select * from emp where sal = any (select max(sal) from emp group by deptno);


-- 30번 부서 사원들의 최고급여보다 적은 사원 조회
select * from emp where sal < any (select max(sal) from emp where deptno = 30);

select * from emp where sal < any (select sal from emp where deptno = 30);

-- 30번 부서 사원들의 최저급여보다 많은 사원
select * from emp where sal > any (select sal from emp where deptno = 30);


-- all
-- 30번 부서 사원들의 급여보다 적은 사원 조회
select * from emp where sal < all (select sal from emp where deptno = 30);

select * from emp where sal > all (select sal from emp where deptno = 30);

-- EXISTS
select * from emp where exists (select dname from dept where deptno = 10);

select * from emp where exists (select dname from dept where deptno = 50);

-- 문제] 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보, 부서정보 출력하기
-- ename, empno, job, sal, deptno, dname 출력
select ename, empno, job, sal, e.deptno, dname
from emp e join dept d on e.deptno = d.deptno
where job in (select job from emp where ename = 'ALLEN');


-- 문제] 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보, 부서정보, 급여등급
-- 출력하기(급여가 많은 순으로 정렬하되 급여가 같은 경우에는 사원번호를 오름차순으로 정렬)
select ename, empno, job, sal, e.deptno, dname, s.grade
from emp e 
join dept d on e.deptno = d.deptno
join salgrade s on e.sal between s.losal and s.hisal
where sal > (select avg(sal) from emp)
order by sal desc, empno;


-- 비교할 열이 여러 개인 다중열 서브쿼리
select *
from emp
where (deptno, sal)
in (select deptno, max(sal) from emp group by deptno);


-- FROM 서브쿼리 (인라인 뷰)
select empno, ename, d.deptno, dname, loc
from (select * from emp where deptno=10) e10, (select * from dept) d
where e10.deptno = d.deptno;

select empno, ename, d.deptno, dname, loc
from (select * from emp where deptno=10) e10
join (select * from dept) d on e10.deptno = d.deptno;


-- INSERT 사용하는 서브쿼리
-- VALUES 절은 사용하지 않음
-- 데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야 함
-- 데이터가 추가되는 테이블의 자료형과 서브쿼리의 자료형이 일치해야 함

-- EMP 테이블에서 SALGRADE 테이블을 참조하여 급여등급이 1인 사원만을
-- EMP_TEMP에 추가하기

select *
from emp e, salgrade s
where e.sal between s.losal and s.hisal and s.grade = 1;


insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp e, salgrade s
where e.sal between s.losal and s.hisal and s.grade = 1;


-- UPDATE 서브쿼리
select * from dept_temp;

-- 40번 부서의 부서 이름과 지역 수정(DEPT 테이블의 DEPTNO = 30인 지역명, 부서명 추출)
select dname, loc
from dept
where deptno = 30;

update dept_temp
set (dname, loc) = (select dname, loc from dept where deptno = 30)
where deptno = 40;

update dept_temp
set loc = 'SEOUL'
where deptno = (select deptno from dept_temp where dname = 'ACCOUNTING');


-- DELETE 서브쿼리

select * from emp_temp;

-- 급여등급이 3등급이고 30번 부서인 사원들만 삭제

delete emp_temp
where empno in (select empno from emp_temp e, salgrade s 
where e.sal between s.losal and s.hisal
and s.grade = 3 and deptno = 30);


--[실습1] 실습을 위하여 기존 테이블을 이용하여 테이블을 생성한다.
--① EMP 테이블의 내용을 이용하여 EXAM_EMP 생성
--② DEPT 테이블의 내용을 이용하여 EXAM_DEPT 생성
--③ SALGRADE 테이블의 내용을 이용하여 EXAM_SALGRADE 생성
create table exam_emp as select * from emp;
create table exam_dept as select * from dept;
create table exam_salgrade as select * from salgrade;

--[실습2] 다음의 정보를 EXAM_EMP 테이블에 입력하시오.
select * from exam_emp;
insert into exam_emp values (7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, null, 50);
insert into exam_emp values (7202, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, null, 50);
insert into exam_emp values (7203, 'TEST_USER3', 'ANLYST', 7201, '2016-04-11', 3400, null, 60);
insert into exam_emp values (7204, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31', 2700, 300, 60);
insert into exam_emp values (7205, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, null, 70);
insert into exam_emp values (7206, 'TEST_USER6', 'CLERK', 7201, '2016-09-09', 2600, null, 70);
insert into exam_emp values (7207, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 2300, null, 80);
insert into exam_emp values (7208, 'TEST_USER8', 'STUDENT', 7201, '2018-03-09', 1200, null, 80);


--[실습3] EXAM_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균 급여보다
--많은 급여를 받고 있는 사원들을 70번 부서로 옮기는 SQL 문 작성하기
update exam_emp
set deptno = '70'
where sal > (select avg(sal) from exam_emp where deptno = 50);


--[실습4] EXAM_EMP에 속한 사원 중 60번 부서의 사원 중에서 입사일이 가장 빠른 사원보다
--늦게 입사한 사원의 급여를 10% 인상하고 80번 부서로 옮기는 SQL 문 작성하기
update exam_emp
set sal = sal * 1.1, deptno = '80'
where hiredate > (select min(hiredate) from exam_emp where deptno = 60);


--[실습5] EXAM_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문을 작성하기
delete exam_emp
where empno in (select empno from exam_emp e 
join exam_salgrade s on e.sal between s.losal and s.hisal
where s.grade = 5);

commit;

-- 트랜잭션
-- 하나의 단위로 데이터를 처리

create table dept_tcl as select * from dept;

select * from dept_tcl;

-- 트랜잭션과 관련있는 명령어 실행
insert into dept_tcl values(50, 'DATABASE', 'SEOUL');

update dept_tcl set loc = 'BUSAN' where deptno = 40;

delete from dept_tcl where dname = 'RESEARCH';

----------------------

-- 수행된 명령 취소
rollback;

-- 수행된 명령 최종 반영
commit;

select * from dept_tcl;

-- 세션 : 어떤 활동을 위한 시간이나 기간
--        데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 수행한 후
--        접속을 종료하기까지 전체 기간

delete from dept_tcl where deptno = 50;

select * from dept_tcl;

commit;

update dept_tcl
set loc = 'SEOUL'
where deptno = 30;

commit;


-- DDL(데이터 정의어)
-- 객체를 생성, 변경, 삭제
-- 실행하면 반영됨

-- create(생성), alter(변경), drop(삭제)

-- create table 테이블이름(
--    필드명1 자료형,
--    필드명2 자료형,
-- )

-- 테이블 이름 규칙
-- 문자로 시작
-- 같은 사용자 안에서 동일한 테이블 명 사용불가
-- sql 키워드는 테이블 이름으로 사용할 수 없음

-- 필드명 생성 규칙
-- 문자로 시작
-- 열 이름은 중복되면 안됨
-- sql 키워드 사용불가

-- 자료형 : 숫자 NUMBER, 가변문자 varchar2, 날짜 date ...

create table EMP_DDL(
    EMPNO NUMBER(4), -- 숫자로 4자리 허용
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2), -- 숫자로 7자리 허용(소수점 2자리 허용)
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);

desc emp_ddl;

drop table emp_ddl;

create table dept_ddl as select * from dept;
create table dept_ddl_30 as select * from dept where deptno=30;

-- 다른 테이블의 구조만 복사하여 새 테이블 생성
create table dept_ddl2 as select * from dept where 1<>1;
select * from dept_ddl2;

-- ALTER
-- 이미 생성된 객체를 변경

CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;

-- 새로운 컬럼(열) 추가 : ADD
desc emp_alter;

alter table emp_alter add hp varchar2(20);
select * from emp_alter;

-- rename : 열 이름을 변경
alter table emp_alter rename column hp to tel;


-- MODIFY : 열의 자료형을 변경
alter table emp_alter modify empno number(5);

-- DROP : 열 삭제
alter table emp_alter drop column tel;


-- 테이블 이름 변경
rename emp_alter to emp_rename;

desc emp_rename;

-- 테이블 데이터를 삭제 truncate
select * from emp_rename;
truncate table emp_rename;

create table member(
    id char(8),
    name varchar2(10),
    addr varchar2(50),
    nation varchar(4),
    email varchar2(50),
    age NUMBER(7,2)
);

alter table member add bigo varchar2(20);

desc member;

alter table member modify bigo varchar2(30);

alter table member rename column bigo to remark;


-- 뷰(view) : 가상테이블
-- 목적 : 편리성(Select 문의 복잡도를 완화)
--        보안성(테이블의 특정 열을 노출하고 싶지 않을 경우)

--- CREATE [OR REPLACE] VIEW 뷰이름 (열이름1,열이름2...)
--- AS (저장할 SELECT문)

-- 뷰 생성
create view vm_emp20 as (select empno,ename,job,deptno from emp where deptno=20);

select * from vm_emp20;

-- EMP 테이블의 전체 내용을 이용해 VIEW 생성
CREATE VIEW VM_EMPALL as select * from emp;

-- VM_EMPALL 에 있는 특정 사원 정보를 수정
select * from VM_EMPALL;

update VM_EMPALL set job = 'SALESMAN' where empno = 7369;

insert into VM_EMPALL values(6666,'KIM','MANAGER',null,'20/10/05',2650,null,20);


-- 뷰 생성(원본 데이터 수정 불가)
CREATE VIEW VM_EMP30read 
as select empno,ename,job 
from emp where deptno=30 
with read only;

select * from emp;


-- 뷰 삭제
drop view vm_empall;


-- 시퀀스(수업에서 자주 사용)
-- 오라클 데이터베이스에서 특정 규칙에 맞는 연속 숫자 생성
create sequence seq_dept_sequence
increment by 10 -- 옵션(기본값은 1)
start with 10 -- 옵션(기본값은 1)
maxvalue 90 -- 옵션(기본값은 10의 27승)
minvalue 0 -- 옵션(기본값은 1)
nocycle cache 2; -- 옵션(CYCLE OR NOCYCLE, CACHE 는 미리 발급해 놓을 수)

-- dept 테이블에서 부서번호를 10으로 시작해서 90까지 넣고 싶을 때

create table dept_sequence as select * from dept where 1<>1;

insert into dept_sequence(deptno,dname,loc)
values(seq_dept_sequence.nextval, 'DATABASE','SEOUL');

-- 시퀀스 수정
alter sequence seq_dept_sequence
increment by 3
maxvalue 99
cycle;


select * from dept_sequence;

-- 시퀀스 삭제
drop sequence seq_dept_sequence;


-- 인덱스 : 빠른 검색
-- 데이터 검색 Talbe Full Scan, Index Scan

-- 인덱스 생성
create index idx_emp_sal
on emp(sal); -- sql 튜닝

-- 제약조건을 사용한 테이블 생성
create table userTBL(
userid char(8) not null primary key,
username varchar(10) not null);



-- 인덱스 삭제
drop index idx_emp_sal;


-- 실습문제

-- 문1) ① EMP테이블과 같은 구조의 데이터를 저장하는 EMPIDX 테이블을 생성하시오.
--      ② 생성한 EMPIDX 테이블의 EMPNO 열에 IDX_EMPIDX_EMPNO 인덱스를 생성하시오.
create table empidx as select * from emp;
create index inx_empidx_empno on empidx(empno);

-- 문2) 실습1에서 생성한 EMPIDX 테이블의 데이터 중 급여가 1500 초과인 사원들만
-- 출력하는 EMPIDX_OVER15K 뷰를 생성하시오.
-- (사원번호, 사원이름, 직책,부서번호,급여,추가수당 열을 가지고 있다)
create view empidx_over15k as select empno, ename, job, deptno, sal, comm from empidx where sal > 1500;

-- 문3) ① DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 테이블을 작성하시오.
--      ② 생성한 DEPTSEQ 테이블의 DEPTNO 열에 사용할 시퀀스를
--         아래에 제시된 특성에 맞춰 생성해 보시오.
--부서 번호의 시작값 : 1
--부서 번호의 증가 : 1
--부서 번호의 최댓값 : 99
--부서 번호의 최소값 : 1
--부서 번호 최댓값에서 생성 중단
--캐시 없음

create table deptseq as select * from dept where 1<>1;

create sequence seq_deptseq
increment by 1
start with 1
maxvalue 99
minvalue 1
nocycle nocache;

--      ③ 마지막으로 생성한 DEPTSEQ를 사용하여 아래쪽과 같이 세 개 부서를 차례대로 추가한다.
insert into deptseq values (seq_deptseq.nextval, 'DATABASE', 'SEOUL');
insert into deptseq values (seq_deptseq.nextval, 'WEB', 'BUSAN');
insert into deptseq values (seq_deptseq.nextval, 'MOBILE', 'ILSAN');

select * from deptseq;


-- 제약조건
-- 데이터 무결성 유지

-- 1) not null : null 의 저장을 허용하지 않음
create table table_notnull(
    login_id varchar2(20) not null,
    login_pwd varchar2(20) not null,
    tel varchar2(20));    

insert into table_notnull values('test_01', null, '010-1234-5678');

-- tel 열은 null 허용
insert into table_notnull(login_id, login_pwd) values('test_01', 'test_01');

update table_notnull
set login_pwd = null
where login_id ='TEST_01';


-- 제약조건 이름 지정
create table table_notnull2(
    login_id varchar2(20) constraint TBLNN2_LGNID_NN not null,
    login_pwd varchar2(20) constraint TBLNN2_LGNPWD_NN not null,
    tel varchar2(20));    

-- 제약조건 확인
-- 현재 데이터베이스에 접속한 사용자가 소유한 객체 정보 : USER_ 로 시작

select owner, constraint_name, constraint_type,table_name
from user_constraints
where table_name='TABLE_NOTNULL2';

-- 이미 생성한 테이블에 제약 조건 지정

-- TABLE_NOTNULL 에 TEL 컬럼에 NOT NULL 추가
-- 오류 보고 -
-- (C##SCOTT.) 사용으로 설정 불가 - 널 값이 발견되었습니다.
select * from table_notnull;
ALTER TABLE TABLE_NOTNULL modify(TEL NOT NULL);


-- update를 통해 기존의 null 컬럼을 제거
update table_notnull
set tel = '010-1234-5365'
where login_id = 'test_01';

select * from table_notnull2;
ALTER TABLE TABLE_NOTNULL2 modify(TEL constraint TBLNN_TEL_NN not null);

-- 제약 조건 이름 변경
ALTER TABLE TABLE_NOTNULL2 rename constraint TBLNN_TEL_NN to TBLNN2_TEL_NN;

-- 제약 조건 삭제
alter table TABLE_NOTNULL2 drop constraint TBLNN2_TEL_NN;

-- 2) UNIQUE : 중복되지 않는 값
create table table_unique(
    login_id varchar2(20) unique,
    login_pwd varchar2(20) not null,
    tel varchar2(20));

select owner, constraint_name, constraint_type,table_name
from user_constraints
where table_name='TABLE_UNIQUE';

insert into table_unique
values('TEST_ID_01','PWD081','010-1234-5678');

-- 무결성 제약 조건(C##SCOTT.SYS_C007387)에 위배
insert into table_unique
values('TEST_ID_01','PWD082','010-1234-5679');

-- unique 제약조건에 null 삽입 가능
insert into table_unique
values(null,'PWD082','010-1234-5679');


create table table_unique2(
    login_id varchar2(20) constraint TBLUNQ2_LGNID_UNQ unique,
    login_pwd varchar2(20) constraint TBLUNQ2_LGNPWD_UNQ not null,
    tel varchar2(20));

select owner, constraint_name, constraint_type, table_name
from user_constraints
where table_name like 'TABLE_UNIQUE%';

alter table table_unique modify(tel unique);


-- 3) PRIMARY KEY : NOT NULL + UNIQUE
--                : 테이블 당 하나만 존재
--                : INDEX 자동 생성
--                : 각 행을 식별하는 용도

create table TABLE_PK(
    login_id varchar2(20) primary key,
    login_pwd varchar2(20) not null,
    tel varchar2(20));
    
insert into TABLE_PK
values('TEST_01','PWD01','010-1234-7896');
-- 무결성 제약 조건(C##SCOTT.SYS_C007392)에 위배됩니다
insert into TABLE_PK
values('TEST_01','PWD02','010-1234-7896');

-- 테이블에는 하나의 기본 키만 가질 수 있습니다.
create table TABLE_PK2(
    login_id varchar2(20) primary key,
    login_pwd varchar2(20) primary key,
    tel varchar2(20));

create table TABLE_PK2(
    login_id varchar2(20) constraint TBLPK2_LGNID_PK primary key,
    login_pwd varchar2(20) constraint TBLPK2_LGNPWD_NN not null,
    tel varchar2(20));

-- 제약 조건을 지정하는 다른 방식
create table table_con(
    col1 varchar2(20),
    col2 varchar2(20),
    col3 varchar2(20),
    primary key(col1),
    constraint TBLCON_UNQ UNIQUE (COL2));

-- 4) FOREIGN KEY : 외래키
--                : 서로 다른 테이블 간 관계 정의
--                : 특정 테이블에서 PK 제약조건을 지정한 열을 다른 테이블의 특정 열에서 참조

create table DEPT_FK(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13));

create table EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO));

-- 무결성 제약조건(C##SCOTT.EMPFK_DEPTNO_FK)이 위배
-- 부모 키가 없습니다
insert into EMP_FK VALUES(9999, 'TEST_NAME', 'TEST_JOB', null, '21-10-05', 3000, null, 10); 

-- 외래 키 수행순서
-- 부모 테이블에 해당하는 데이터 삽입
-- 자식 테이블 데이터 삽입

insert into DEPT_FK VALUES(10,'DATABASE','SEOUL');
insert into EMP_FK VALUES(9999, 'TEST_NAME', 'TEST_JOB', null, '21-10-05', 3000, null, 10); 


-- 외래 키 참조 행 데이터 삭제
-- 자식 테이블에 해당하는 데이터 삭제
-- 부모 테이블에 해당하는 테이터 삭제

-- 자식 레코드가 발견되었습니다
delete from dept_fk where deptno = 10;

delete from emp_fk where deptno = 10;
delete from dept_fk where deptno = 10;

-- 데이터 삭제 시 삭제할 데이터를 참조하는 처리를 어떻게 할 것인지 결정
-- on delete cascade : 열 데이터 삭제시 이 데이터를 참조하고 있는 데이터도 함께 삭제

create table DEPT_FK2(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK2_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13));

create table EMP_FK2(
    EMPNO NUMBER(4) CONSTRAINT EMPFK2_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK2_DEPTNO_FK REFERENCES DEPT_FK2(DEPTNO) on delete cascade);


insert into DEPT_FK2 VALUES(10,'DATABASE','SEOUL');
insert into EMP_FK2 VALUES(9999, 'TEST_NAME', 'TEST_JOB', null, '21-10-05', 3000, null, 10); 


delete from dept_fk2 where deptno = 10;

select * from dept_fk2;
select * from emp_fk2;

-- ON DELETE SET NULL : 열 데이터를 삭제할 때 이 데이터를 참조하는 데이터를 NULL 수정

create table EMP_FK3(
    EMPNO NUMBER(4) CONSTRAINT EMPFK3_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK3_DEPTNO_FK REFERENCES DEPT_FK2(DEPTNO) on delete SET NULL);

INSERT INTO DEPT_FK2 VALUES(10,'DATABASE','SEOUL');
INSERT INTO EMP_FK3
VALUES(9999, 'TEST_NAME', 'TEST_JOB', null, '21-10-05', 3000, null, 10);

select * from dept_fk2;
select * from emp_fk3;

delete from dept_fk2 where deptno = 10;

-- 5) CHECK : 열에 저장할 수 있는 값의 범위 또는 패턴 정의
--          : 시간 0~23

create table TABLE_CHECK(
    login_id varchar2(20) constraint TBLCK_LGNID_PK primary key,
    login_pwd varchar2(20) constraint TBLCK_LGNPWD_NN CHECK (LENGTH(LOGIN_PWD)>3),
    tel varchar2(20));

INSERT INTO TABLE_CHECK VALUES('TEST_ID','123','010-1234-5678');

INSERT INTO TABLE_CHECK VALUES('TEST_ID','1234','010-1234-5678');


-- 기본값을 지정 DEFAULT
-- 특정 열에 저장할 값이 지정되지 않았을 경우에 입력되는 기본값
create table TABLE_DEFAULT(
    login_id varchar2(20) constraint TBLDF_LGNID_PK primary key,
    login_pwd varchar2(20) DEFAULT '1234',
    tel varchar2(20));

INSERT INTO TABLE_DEFAULT(LOGIN_ID, LOGIN_PWD)
VALUES('TEST_ID','TEST_ID');

INSERT INTO TABLE_DEFAULT(LOGIN_ID, TEL)
VALUES('TEST_ID2','010-5689-1234');

INSERT INTO TABLE_DEFAULT(LOGIN_ID, LOGIN_PWD, TEL)
VALUES('TEST_ID3', NULL, '010-5689-1234');

SELECT * FROM TABLE_DEFAULT;


-- 실습

-- 문1) DEPT_CONST 테이블 생성
-- DEPTNO 정수형 숫자 길이 2, 제약조건 PRIMARY KEY 제약조건명 DEPTCONST_DEPTNO_PK
-- DNAME 가변형 문자 길이 14, 제약조건 UNIQUE 제약조건명 DEPTCONST_DNAME_UNQ
-- LOC 가변형 문자 길이 13, 제약조건 NOT NULL 제약조건명 DEPTCONST_LOC_NN
CREATE TABLE DEPT_CONST(
DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE,
LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL
);


-- 문2) EMP_CONST 테이블 생성
-- EMPNO 정수형 숫자, 길이 2, 제약조건 PRIMARY KEY, 제약조건명 EMPCONST_EMPNO_PK
-- ENAME 가변형 문자, 길이 10, 제약조건 NOT NULL, 제약조건명 EMPCONST_ENAME_NN
-- JOB 가변형 문자, 길이 9,
-- TEL 가변형 문자, 길이 20, 제약조건 UNIQUE, 제약조건명 EMPCONST_TEL_UNQ
-- HIREDATE 날짜,
-- SAL 정수형 숫자, 길이 7, 소수점 둘째자리까지 허용, 제약조건 CHECK(급여는 1000~9999만 입력가능)
--  제약조건명 EMPCONST_SAL_CHK
-- COMM 정수형 숫자, 길이 7, 소수점 둘째자리까지 허용
-- DEPTNO 정수형 숫자, 길이 2, 제약조건 FOREIGN KEY, 제약조건명 EMPCONST_DEPTNO_FK

CREATE TABLE EMP_CONST(
EMPNO NUMBER(2) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL,
JOB VARCHAR2(9),
TEL VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNQ UNIQUE,
HIREDATE DATE,
SAL NUMBER(7,2) CONSTRAINT EMPCONST_SAL_CHK CHECK (SAL BETWEEN 1000 AND 9999),
COMM NUMBER(7,2),
DEPTNO NUMBER(2) CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST(DEPTNO)
);















