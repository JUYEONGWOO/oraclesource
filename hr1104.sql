-- HR 계정이 가지고 잇는 모든 테이블 보기
select * from tab;

-- employees 테이블 전체 내용 조회

select * from employees;

-- employees 테이블의 first_name, last_name, job_id 만 조회

select FIRST_name, last_name, job_id from employees;

-- 사원번호가 176인 사람의 LAST_NAME와 부서번호 조회
select LAST_NAME, DEPARTMENT_ID from employees where EMPLOYEE_ID=176;
-- 연봉이 12000 이상 되는 직원들의 LAST_NAME 및 연봉 조회
select LAST_NAME, SALARY from employees where SALARY > 12000;
-- 연봉이 5000에서 12000의 범위 이외의 사람들의 LAST_NAME 및 연봉 조회
select LAST_NAME, SALARY from employees where SALARY > 12000 or SALARY <5000;

