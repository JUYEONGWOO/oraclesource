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

