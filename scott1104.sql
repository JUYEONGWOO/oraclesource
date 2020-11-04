-- scott 계정이 가지고 잇는 모든 테이블 보기
select * from tab;
-- emp 테이블의 모든 내용 조회
SELECT * FROM EMP;
-- emp 테이블의 특정 필드만 조회
SELECT ENAME,job,sal from emp;
-- 중복 레코드 제거한 후 조회
select distinct deptno from emp;

-- emp 테이블의 구조
--desc emp;