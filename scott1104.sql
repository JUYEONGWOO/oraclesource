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
varchar 타입은 '' 사용 
select * from emp where deptno=30 AND job='salesman';