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

-- 20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 알파벳순으로 조회한다

select LAST_NAME, DEPARTMENT_ID from employees where DEPARTMENT_ID in(20,50) order by  LAST_NAME,DEPARTMENT_ID ;
--커미션을 버는 모든 사원들의 LAST_NAME,연봉,커미션 조회하기. 단 , 연봉의 역순 및 커미션 역순으로 결과 출력하기
select LAST_NAME, salary,commission_pct from employees where commission_pct != 0 order by salary desc, commission_pct desc;
--연봉이 2500,3500,7000이 아니며, 직업이 SA_REP 이나 ST_CLERK 인 사람들 조회

select * from employees where salary not in(2500,3500,7000) and job_id in('SA_REP','ST_CLERK');
-- 2008/02/20~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME, 사원 번호, 고용 일자 조회 단, 고용일자 내림차순으로 정렬하여 출력

select last_name,employee_id,hire_date from employees where hire_date>='2008/02/20' and hire_date<='2008/05/01' order by hire_date desc;
--2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로 오름 차순 정렬하여 출력
select last_name,hire_date from employees where hire_date>='2004/01/01' and hire_date<='2004/12/31' order by hire_date ;

-- 연봉이 5000에서 12000의 범위 있고, 20 OR 50번 부서에 근무하는 사람들의 연봉을 조회하여 오름차순으로 보여주기(LAST_NAME 및 SALARY)
select last_name, salary from employees where salary BETWEEN 5000 and 12000 and department_id in( 50 , 20) order by salary;
-- 2004년도에 고용된 모든 사람들의 last_name 및 고용일을 조회하여 입사일 기준으로 오름차순 정렬하여 출력
select last_name, hire_date from employees where hire_date between '2004/01/01' and '2004/12/31' order by hire_date;
--연봉이 5000~12000 범위 이외의 사람들 last_name, salary 조회
select last_name, salary from employees where salary not BETWEEN 5000 and 12000;
--2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로 오름 차순 정렬하여 출력
select last_name,hire_date from employees where hire_date Like '04%' order by hire_date ;
-- last_name 에 u가 포함되는 사원들의 사번 및 last_name조회
select last_name, employee_id from employees where last_name like '%u%';
-- last_name 에 네 번째 글자가 a인 사람들의 Last_name 조회
select last_name from employees where last_name like '___a%';
--last_name 에 a 혹은 e 글자가 있는 사원들의 last_name을 조회하여 Last_name기준으로 오름 차순 정렬
select last_name from employees where last_name like '%a%' or last_name LIKE '%e%' order by last_name;

--last_name 에 a 혹은 e 글자가 있는 사원들의 last_name을 조회하여 Last_name기준으로 오름 차순 정렬
select last_name from employees where last_name like '%a%e%' or last_name like '%e%a%' order by last_name;
-- is null 연습
-- 매니저가 없는 사람들의 LAST_NAME, JOB_ID 조회
select last_name, job_id from employees where manager_id is null;
-- ST_CLERK인 JOB_ID를 가진 사원이 없는 부서 ID 조회. 부서번호가 NULL인 값 제외
SELECT DISTINCT department_id from employees where job_id != 'ST_CLERK' and department_id is not null;
-- COMMISSION_PCT가 NULL 이 아닌 사원들 중에서 COMMISSION = SALARY * COMMISSION_PCT 를 구하여 EMPLOYEE_ID, FIRST_NAME, JOB_ID 와 같이 조회
select EMPLOYEE_ID, FIRST_NAME, JOB_ID,SALARY * COMMISSION_PCT as COMMISSION  from employees where COMMISSION_PCT is not null;
-- [실습] 문자열 함수
-- 1. first_name이 Curtis인 사람의 first_name, last_name, email, phone_number, job_id를 조회한다. 단, job_id의 결과는 소문자로 출력되도록한다.
SELECT first_name, last_name, email, phone_number, LOWER(job_id) FROM employees WHERE first_name = 'Curtis'; 
-- 2. 부서번호가 70,80,90인 사람들의 employee_id, first_name, hire_date, job_id를 조회한다. 단, job_id가 it_prog인 사원의 경우 프로그래머로 변경하여 출력한다.
SELECT employee_id, first_name, hire_date, REPLACE(job_id,'IT_PROG','프로그래머') FROM employees WHERE department_id IN(60,70,80,90);
-- 3. job_id가 ad_pres, pu_clerk인 사원들의 employee_id, first_name, last_name, department_id,job_id를 조회하시오, 단, 사원명은 first_name과 Last_name을  연결하여 출력한다.
SELECT employee_id, CONCAT(first_name,concat(' ',last_name)), department_id,job_id FROM employees WHERE job_id IN('AD_PRES', 'PU_CLERK');

-- john 3: 16  " 하느님께서는 세상을 너무나 사랑하신 나머지 외아들을 내 주시어,  그를 믿는 사람은 누구나 멸망하지 않고 영원한 생명을 얻게 하셨다. "
