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

select LAST_NAME, DEPARTMENT_ID from employees where DEPARTMENT_ID in(20,50) order by LAST_NAME;
--Ŀ�̼��� ���� ��� ������� LAST_NAME,����,Ŀ�̼� ��ȸ�ϱ�. �� , ������ ���� �� Ŀ�̼� �������� ��� ����ϱ�
select LAST_NAME, salary,commission_pct from employees where commission_pct != 0 order by salary desc, commission_pct desc;
--������ 2500,3500,7000�� �ƴϸ�, ������ SA_REP �̳� ST_CLERK �� ����� ��ȸ

select * from employees where salary not in(2500,3500,7000) and job_id in('SA_REP','ST_CLERK');
-- 2008/02/20~ 2008/05/01 ���̿� ���� ������� LAST_NAME, ��� ��ȣ, ��� ���� ��ȸ ��, ������� ������������ �����Ͽ� ���

select last_name,employee_id,hire_date from employees where hire_date>='2008/02/20' and hire_date<='2008/05/01' order by hire_date desc;
--2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� ���� ���� �����Ͽ� ���
select last_name,hire_date from employees where hire_date>='2004/01/01' and hire_date<='2004/12/31' order by hire_date ;

-- john 3: 16  " �ϴ��Բ����� ������ �ʹ��� ����Ͻ� ������ �ܾƵ��� �� �ֽþ�,  �׸� �ϴ� ����� ������ ������� �ʰ� ������ ������ ��� �ϼ̴�. "