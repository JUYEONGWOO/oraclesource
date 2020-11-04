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

select LAST_NAME, DEPARTMENT_ID from employees where DEPARTMENT_ID in(20,50) order by LAST_NAME;
--커미션을 버는 모든 사원들의 LAST_NAME,연봉,커미션 조회하기. 단 , 연봉의 역순 및 커미션 역순으로 결과 출력하기
select LAST_NAME, salary,commission_pct from employees where commission_pct != 0 order by salary desc, commission_pct desc;
--연봉이 2500,3500,7000이 아니며, 직업이 SA_REP 이나 ST_CLERK 인 사람들 조회

select * from employees where salary not in(2500,3500,7000) and job_id in('SA_REP','ST_CLERK');
-- 2008/02/20~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME, 사원 번호, 고용 일자 조회 단, 고용일자 내림차순으로 정렬하여 출력

select last_name,employee_id,hire_date from employees where hire_date>='2008/02/20' and hire_date<='2008/05/01' order by hire_date desc;
--2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로 오름 차순 정렬하여 출력
select last_name,hire_date from employees where hire_date>='2004/01/01' and hire_date<='2004/12/31' order by hire_date ;

-- john 3: 16  " 하느님께서는 세상을 너무나 사랑하신 나머지 외아들을 내 주시어,  그를 믿는 사람은 누구나 멸망하지 않고 영원한 생명을 얻게 하셨다. "