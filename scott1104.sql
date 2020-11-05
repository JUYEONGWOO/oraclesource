-- scott 계정이 가지고 잇는 모든 테이블 보기
select * from tab;
-- emp 테이블의 모든 내용 조회
SELECT * FROM EMP;
-- emp 테이블의 특정 필드만 조회
SELECT ENAME,job,sal from emp;
-- 중복 레코드 제거한 후 조회
select distinct deptno from emp;

-- emp 테이블의 구조
desc emp;

-- alais(별칭) : AS 
select empno as 사원번호 from emp;
-- sal comm  계산 가능하고 그게  sal*12 + comm 라고 나오니깐보기힘듬 그래서  as 써서 연봉으로바꿔줌
select ename, sal, sal*12 + comm as 연봉, comm from emp;
-- 스페이스바는 오류로 인식하기 때문에  "" 로 묵어야함
select ename as 사원이름, job as "직 책" from emp;
-- ORDER BY : 정렬하여 조회     오름차순 
-- 하나의 열로 기준을 주어 오름차순 조회;asc
select ename,sal from emp order by sal;
-- 하나의 열로 기준을 주어 내림차순 조회; 디센딩
select ename,sal from emp order by sal_desc;

-- 전체 데이터를 조회( 사원번호 오름차순)
select * from emp order by empno;

-- 부서번호의 오름차순이고, 부서번호가 동일하다면 급여의 내림차순
select * from emp order by deptno asc, sal desc;
-- 1.조회할 테이블은 emp 테이블이며 모든열을 출력한다
--2. 출력되는 열의 별칭을 다음과 같이 지정한다.
 --1. EMPNO : EMPLOYEE_NO
 --2. ENAME : EMPLOYEE_NAME
 --3. MGR : MANAGER
 --4. SAL : SALARY
 --5. COMM : COMMISSION
 --6. DEPTNO : DEPARTMENT_NO
--3. 부서번호를 기준으로 내림차순으로 정렬하되 부서번호가 같다면 사원 이름을 기준으로 오름차순 정렬한다.

select EMPNO as EMPLOYEE_NO, ENAME, job, as EMPLOYEE_NAME, MGR as MANAGER, hiredate, SAL as SALARY, COMM as COMMISSION, 
        COMM as COMMISSION, DEPTNO as DEPARTMENT_NO 
from emp order by deptno desc, empno asc;

-- WHERE : 조회를 할 때 기준 주기
-- 부서번호가 30번인 사원 조회
select * from emp where deptno = 30;

-- tkdnjsqjsghrk 7782인 사원 조회
select * from emp where empno =7782;

--부서번호가 30이고, 사원직책이 SALSEMAN  정보 조회 
--varchar 타입은 '' 사용 
select * from emp where deptno=30 AND job='SALESMAN';
-- 사원번호가 7499이고, 부서번호가 30인 정보 조회
select * from emp where empno = 7499 AND deptno = 30;

-- 부서번호가 30이거나, 사원직책이 CLERK 정보 조회
select * from emp where deptno = 30 OR job = 'CLERK';
-- 부서번호가 20이거나, 사원직책이 SALESMAN 정보 조회
select * from emp where deptno = 20 OR job = 'SALESMAN';

--연산자를 이용한 조회
-- sal*12 한 금액이 36000인 데이터 조회
select * from emp where sal*12 = 36000;
-- 관계연산자 : >, <, >= , <=
select * from emp where sal> 3000;
select * from emp where sal> =3000;
select * from emp where ename >= 'F' order by ename;

-- 논리연산자 : AND, OR
-- 급여가 2500이상이고 , 직업이 ANALYST인 사원
select * from emp where sal >= 2500 and JOB = 'ANALYST';
-- 직무가 MANAGER, SALESMAN, CLERK 인 사원 정보 조회
select * from emp where job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK';
-- 등가연산자 : 양쪽 항목이 같은지 검사
-- SAL이 3000이 아닌 사원 정보 출력
select * from emp where sal != 3000;
select * from emp where sal <> 3000;
select * from emp where sal ^= 3000;

-- IN 연산자
select * from emp where job in('MANAGER','SALESMAN', 'CLERK');
select * from emp where job != 'MANAGER' and job != 'SALESMAN' and job != 'CLERK';
select * from emp where job not in('MANAGER','SALESMAN', 'CLERK');

-- IN을 사용해서 부서번호가 10,20번인 사원정보 조회
select * from emp where deptno in(10,20);

-- LIKE : 문자열 검색 사용(s로 시작하는 ~~, H로 끝나는..., 가운데에 T가 있으면)
--1)사원이름이 S로 시작하는 모든 사원정보 조회하기
select * from emp where ename LIKE 'S%';
--2) 사원 이름의 두번째 글자가 L인 사원만 조회
select * from emp where ename LIKE '_L%';
--3) 사원 이름의 AM이 포함되어 있는 사원만 조회
select * from emp where ename Like '%AM%';

--4) 사원 이름의 AM이 포함되어 있지 않은 사원만 조회
select * from emp where ename not Like '%AM%';

-- is null
-- select * from emp where com = null; (x)
select * from emp where comm is null;

--MGR(매니저id)이 NULL인 사원정보 조회
select * from emp where mgr is null;
--MGR(매니저id)이 NULL이 아닌 사원정보 조회
select * from emp where mgr is not null;

-- 집합연산자 : 합집합(UNION), 교집합(INTERSECT), 차집합
-- DEPTNO가 10 인 테이블과 DEPTNO가 20인 결과를 구해서 합해서 보여주기
SELECT empno, ename , sal, deptno FROM emp WHERE deptno = 10
union
SELECT empno, ename , sal, deptno FROM emp WHERE deptno = 20;
-- 중복된것도 보여주려면 UNION ALL 써야함(기본 UNION은 기본적으로  중복없에 주기때문에)
SELECT empno, ename , sal, deptno FROM emp WHERE deptno = 10
UNION ALL   
SELECT empno, ename , sal, deptno FROM emp WHERE deptno = 20;

-- 부서번호가 10이 아닌 사원들의 정보 조회
SELECT empno, ename , sal, deptno FROM emp
MINUS
SELECT empno, ename , sal, deptno FROM emp WHERE deptno = 10;
-- 부서번호가 10인 사원정보 조회
SELECT empno, ename , sal, deptno FROM emp
INTERSECT
SELECT empno, ename , sal, deptno FROM emp WHERE deptno = 10;

-- 20, 30번 부서에 근무하고 잇는 사원 중 SAL 이 2000 초과인 사원을 다음 두가지 방식의 SELECT문을 사용하여 사원번호, 이름 ,급여, 부서번호를 출력하는 sql문 작성
--집합연산자 사용하지 않는 방식
SELECT empno, ename, sal , deptno FROM emp WHERE deptno in(20,30) and sal >2000; 
--집합연산자를 사용하는 방식

SELECT empno, ename, sal , deptno FROM emp WHERE sal > 2000
MINUS
SELECT empno, ename, sal , deptno FROM emp WHERE deptno = 10;

SELECT empno, ename, sal , deptno FROM emp WHERE deptno in(20,30)
INTERSECT
SELECT empno, ename, sal , deptno FROM emp Where  sal >2000; 

-- oracle function
-- 1) 문자함수 : UPPER, LOWER, INITCAP, LENGTH, LENGTHB
-- ENAME 을 UPPER, LOWER, INITCAP으로 변환하여 조회
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename) 
FROM emp;
-- DUAL 테이블 이용(SYS가 소유하고 있는 테이블로 임시연산이나 함수의 결과값을 확인하는 용도)
SELECT LENGTH('한글'), LENGTHB('한글') FROM dual;
--직책 이름이 6글자 이상인 사원들의 정보 추출
SELECT * FROM emp Where LENGTH(job) >= 6;

-- 문자열 함수 : substr
SELECT job, substr(job,1,2), substr(Job,3,2), substr(Job,5) FROM emp;
SELECT job, SUBSTR(job,-LENGTH(job)), SUBSTR(job, -LENGTH(job),2), SUBSTR(job,-3)
FROM emp;

-- 문자열 함수 : INSTR(특정문자 위치 찾기)
SELECT INSTR('HELLO, ORACLE!' , 'L') AS INSTR_1,
        INSTR('HELLO, ORACLE!' , 'L',5) AS INSTR_2, --5번째 이후부터 찾아봐
        INSTR('HELLO, ORACLE!' , 'L',2,2) AS INSTR_3 --2번쨰 이후부터 찾되, 2번째 L
from dual;

-- 문자열함수 : REPLACE(찾아서 바꾸기) 원본데이터를 바꾸는 것은 아님 화면출력을 바구는것임
SELECT REPLACE('이것이 oracle이다 ', '이것이', 'this is')
FROM dual;
SELECT '010-1234-5678' AS replace_before,
REPLACE('010-1234-5678','-',' ') AS replace_1,
REPLACE('010-1234-5678','-') AS replace_2
FROM dual;

--문자열 함수 : concat(연결)
-- empno, ename을 연결하여 조회
SELECT CONCAT(empno,ename), CONCAT(empno,CONCAT(':',ename))
FROM emp
WHERE ename ='SCOTT';

--||: 연결의 의미로 사용됨
SELECT empno||ename, empno||':'||ename
FROM emp
WHERE ename ='SCOTT';

-- 문자열 함수 : TRIM(공백제거),LTRIM(왼쪽 공백 제거), RTRIM(오른쪽 공백 제거)

select '     이것이      ',TRIM('     이것이      ')
FROM dual;

-- 문자열 함수 : REVERSE
SELECT REVERSE('Oracle') FROM dual;

--2. 숫자함수 : ROUND(반올림), TRUNC(버림), CEIL(입력된 숫자와 가까운 큰 정수), FLOOR(입력된 숫자와 가까운 작은 정수), MOD (나머지)

SELECT  ROUND(1234.5678) AS ROUND,
        ROUND(1234.5678,0) AS ROUND_1,
        ROUND(1234.5678,1) AS ROUND_2,
        ROUND(1234.5678,-1) AS ROUND_minus,
        ROUND(1234.5678,-2) AS ROUND_minus2
FROM dual;
SELECT  TRUNC(1234.5678) AS TRUNC,
        TRUNC(1234.5678,0) AS TRUNC,
        TRUNC(1234.5678,1) AS TRUNC,
        TRUNC(1234.5678,-1) AS TRUNC_minus,
        TRUNC(1234.5678,-2) AS TRUNC_minus2
FROM dual;

SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM dual;

SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM dual;
-- 3.날짜함수: SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;

-- 날짜데이터는 연산이 가능함 : 날짜데이터 +1 ,-1 ,날짜데이터 - 날짜데이터
-- 날짜데이터 + 날짜데이터는 안됨
SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW FROM dual;
-- 날짜함수: ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL;
-- 입사10주년이 되는 사원들 조회
select empno, ename, hiredate, add_months(hiredate,120) from emp;
-- 입사 38년 미만인 사원 조회
select * from emp where  add_months(hiredate,456)> sysdate; 

-- 날짜함수 : MONTHS_BETWEEN(두 날짜 사이의 차이)
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE)< 456;

SELECT empno, ename, hiredate, sysdate, months_between(hiredate, sysdate) AS months1, 
months_between(sysdate,hiredate) AS months2, TRUNC(months_between(sysdate,hiredate))
FROM emp;

-- 날짜함수 : NEXT_DAY, LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일'), LAST_DAY(SYSDATE)
FROM DUAL;

-- 4. 형변환 함수 : TO_CHAR(날짜,숫자데이터를 문자로 변환), TO_NUMBER(문자데이터를 숫자로 변환),
-- TO_DATE(문자 데이터를 날짜로 변환)

select to_char(sysdate, 'yyyy/mm/dd') as 현재날짜 from dual;
select to_char(sysdate, 'mm') as 현재날짜 from dual;
select to_char(sysdate, 'mon') as 현재날짜 from dual;
select to_char(sysdate, 'dd') as 현재날짜 from dual;
select to_char(sysdate, 'day') as 현재날짜 from dual;
select to_char(sysdate, 'HH:mi;ss') as 현재날짜 from dual;
select to_char(sysdate, 'HH12:mi;ss') as 현재날짜 from dual;
select to_char(sysdate, 'HH24:mi;ss') as 현재날짜 from dual;
select to_char(sysdate, 'HH24:mi;ss pm') as 현재날짜 from dual;

-- 오늘날짜를 년/월/일 16:51:45 표현

select to_char(sysdate,'yyyy/mm/dd hh24:mi;ss ') as 현재날짜시간 from dual;

select 1300-to_number('1500'), to_number('1300')+1500 from dual;
select to_number('3,000,001' , '9,999,999')-to_number('3,000,001' , '9,999,999') from dual;
SELECT sal,to_char(sal, '$999,999') sal_$,
        to_char(sal, '$999,999') sal_$,
        to_char(sal, 'L999,999') sal_1,
        to_char(sal, '$999,999.00') sal_2,
        to_char(sal, '000,999,999.00') sal_3,
        to_char(sal, '999,999.00') sal_4
from emp;

select to_date('2020-11-05','yyyy/mm/dd') as todate1,
        to_date('20201105', 'yyyy-mm-dd') as todate2 from dual;
        
-- 1981년6월1일 이후에 입사한 사원정보 조회
select * from emp where hiredate > to_date('1981-06-01','yyyy-mm-dd');

select to_date('2019-12-20')-to_date('2019-10-20') from dual;

-- 널처리 함수 : NVL, NVL2
SELECT empno, ename, sal, comm, sal+comm, nvl(comm,0), sal+nvl(comm,0)
from emp;

SELECT empno, ename, sal, comm, sal+comm, nvl2(comm,'O','X'), nvl2(comm,sal*12+12+comm,sal*12) as annsal
from emp;

-- DECODE함수와 CASE문 
--job 가 manager, salesman, analyst 경우에 각각의 다른 비율을 적용하고 싶다면 ?
select empno,ename,job,sal,DECODE(job, 
                                  'MANAGER', SAL*1.1,
                                  'SALESMAN',SAL*1.05,
                                  'ANALYST', SAL,
                                  SAL*1.03) as UPSAL
from emp;

select empno,ename,job,sal,case job
                                 when 'MANAGER' then SAL*1.1
                                 when 'SALESMAN' then SAL*1.05
                                 when 'ANALYST' then SAL
                                 else SAL*1.03
                                 end as UPSAL
from emp;

select empno,ename,job,sal,case 
                                when comm is null then '해당사항없음'
                                when comm = 0 then '수당없음'
                                when comm > 0 then '수당 : ' || comm
                                end as comm_text from emp;
