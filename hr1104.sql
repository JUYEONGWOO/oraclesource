-- HR ������ ������ �մ� ��� ���̺� ����
select * from tab;

-- employees ���̺� ��ü ���� ��ȸ

select * from employees;

-- employees ���̺��� first_name, last_name, job_id �� ��ȸ

select FIRST_name, last_name, job_id from employees;

-- �����ȣ�� 176�� ����� LAST_NAME�� �μ���ȣ ��ȸ
select LAST_NAME, DEPARTMENT_ID from employees where EMPLOYEE_ID=176;
-- ������ 12000 �̻� �Ǵ� �������� LAST_NAME �� ���� ��ȸ
select LAST_NAME, SALARY from employees where SALARY > 12000;
-- ������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ���� ��ȸ
select LAST_NAME, SALARY from employees where SALARY > 12000 or SALARY <5000;

-- 20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ������� ��ȸ�Ѵ�

select LAST_NAME, DEPARTMENT_ID from employees where DEPARTMENT_ID in(20,50) order by  LAST_NAME,DEPARTMENT_ID ;
--Ŀ�̼��� ���� ��� ������� LAST_NAME,����,Ŀ�̼� ��ȸ�ϱ�. �� , ������ ���� �� Ŀ�̼� �������� ��� ����ϱ�
select LAST_NAME, salary,commission_pct from employees where commission_pct != 0 order by salary desc, commission_pct desc;
--������ 2500,3500,7000�� �ƴϸ�, ������ SA_REP �̳� ST_CLERK �� ����� ��ȸ

select * from employees where salary not in(2500,3500,7000) and job_id in('SA_REP','ST_CLERK');
-- 2008/02/20~ 2008/05/01 ���̿� ���� ������� LAST_NAME, ��� ��ȣ, ��� ���� ��ȸ ��, ������� ������������ �����Ͽ� ���

select last_name,employee_id,hire_date from employees where hire_date>='2008/02/20' and hire_date<='2008/05/01' order by hire_date desc;
--2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� ���� ���� �����Ͽ� ���
select last_name,hire_date from employees where hire_date>='2004/01/01' and hire_date<='2004/12/31' order by hire_date ;

-- ������ 5000���� 12000�� ���� �ְ�, 20 OR 50�� �μ��� �ٹ��ϴ� ������� ������ ��ȸ�Ͽ� ������������ �����ֱ�(LAST_NAME �� SALARY)
select last_name, salary from employees where salary BETWEEN 5000 and 12000 and department_id in( 50 , 20) order by salary;
-- 2004�⵵�� ���� ��� ������� last_name �� ������� ��ȸ�Ͽ� �Ի��� �������� �������� �����Ͽ� ���
select last_name, hire_date from employees where hire_date between '2004/01/01' and '2004/12/31' order by hire_date;
--������ 5000~12000 ���� �̿��� ����� last_name, salary ��ȸ
select last_name, salary from employees where salary not BETWEEN 5000 and 12000;
--2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� ���� ���� �����Ͽ� ���
select last_name,hire_date from employees where hire_date Like '04%' order by hire_date ;
-- last_name �� u�� ���ԵǴ� ������� ��� �� last_name��ȸ
select last_name, employee_id from employees where last_name like '%u%';
-- last_name �� �� ��° ���ڰ� a�� ������� Last_name ��ȸ
select last_name from employees where last_name like '___a%';
--last_name �� a Ȥ�� e ���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� Last_name�������� ���� ���� ����
select last_name from employees where last_name like '%a%' or last_name LIKE '%e%' order by last_name;

--last_name �� a Ȥ�� e ���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� Last_name�������� ���� ���� ����
select last_name from employees where last_name like '%a%e%' or last_name like '%e%a%' order by last_name;
-- is null ����
-- �Ŵ����� ���� ������� LAST_NAME, JOB_ID ��ȸ
select last_name, job_id from employees where manager_id is null;
-- ST_CLERK�� JOB_ID�� ���� ����� ���� �μ� ID ��ȸ. �μ���ȣ�� NULL�� �� ����
SELECT DISTINCT department_id from employees where job_id != 'ST_CLERK' and department_id is not null;
-- COMMISSION_PCT�� NULL �� �ƴ� ����� �߿��� COMMISSION = SALARY * COMMISSION_PCT �� ���Ͽ� EMPLOYEE_ID, FIRST_NAME, JOB_ID �� ���� ��ȸ
select EMPLOYEE_ID, FIRST_NAME, JOB_ID,SALARY * COMMISSION_PCT as COMMISSION  from employees where COMMISSION_PCT is not null;
-- [�ǽ�] ���ڿ� �Լ�
-- 1. first_name�� Curtis�� ����� first_name, last_name, email, phone_number, job_id�� ��ȸ�Ѵ�. ��, job_id�� ����� �ҹ��ڷ� ��µǵ����Ѵ�.
SELECT first_name, last_name, email, phone_number, LOWER(job_id) FROM employees WHERE first_name = 'Curtis'; 
-- 2. �μ���ȣ�� 70,80,90�� ������� employee_id, first_name, hire_date, job_id�� ��ȸ�Ѵ�. ��, job_id�� it_prog�� ����� ��� ���α׷��ӷ� �����Ͽ� ����Ѵ�.
SELECT employee_id, first_name, hire_date, REPLACE(job_id,'IT_PROG','���α׷���') FROM employees WHERE department_id IN(60,70,80,90);
-- 3. job_id�� ad_pres, pu_clerk�� ������� employee_id, first_name, last_name, department_id,job_id�� ��ȸ�Ͻÿ�, ��, ������� first_name�� Last_name��  �����Ͽ� ����Ѵ�.
SELECT employee_id, CONCAT(first_name,concat(' ',last_name)), department_id,job_id FROM employees WHERE job_id IN('AD_PRES', 'PU_CLERK');

-- john 3: 16  " �ϴ��Բ����� ������ �ʹ��� ����Ͻ� ������ �ܾƵ��� �� �ֽþ�,  �׸� �ϴ� ����� ������ ������� �ʰ� ������ ������ ��� �ϼ̴�. "
