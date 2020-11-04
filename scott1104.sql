-- scott ������ ������ �մ� ��� ���̺� ����
select * from tab;
-- emp ���̺��� ��� ���� ��ȸ
SELECT * FROM EMP;
-- emp ���̺��� Ư�� �ʵ常 ��ȸ
SELECT ENAME,job,sal from emp;
-- �ߺ� ���ڵ� ������ �� ��ȸ
select distinct deptno from emp;

-- emp ���̺��� ����
desc emp;

-- alais(��Ī) : AS 
select empno as �����ȣ from emp;
-- sal comm  ��� �����ϰ� �װ�  sal*12 + comm ��� �����ϱ񺸱����� �׷���  as �Ἥ �������ιٲ���
select ename, sal, sal*12 + comm as ����, comm from emp;
-- �����̽��ٴ� ������ �ν��ϱ� ������  "" �� �������
select ename as ����̸�, job as "�� å" from emp;
-- ORDER BY : �����Ͽ� ��ȸ     �������� 
-- �ϳ��� ���� ������ �־� �������� ��ȸ;asc
select ename,sal from emp order by sal;
-- �ϳ��� ���� ������ �־� �������� ��ȸ; �𼾵�
select ename,sal from emp order by sal_desc;

-- ��ü �����͸� ��ȸ( �����ȣ ��������)
select * from emp order by empno;

-- �μ���ȣ�� ���������̰�, �μ���ȣ�� �����ϴٸ� �޿��� ��������
select * from emp order by deptno asc, sal desc;
-- 1.��ȸ�� ���̺��� emp ���̺��̸� ��翭�� ����Ѵ�
--2. ��µǴ� ���� ��Ī�� ������ ���� �����Ѵ�.
 --1. EMPNO : EMPLOYEE_NO
 --2. ENAME : EMPLOYEE_NAME
 --3. MGR : MANAGER
 --4. SAL : SALARY
 --5. COMM : COMMISSION
 --6. DEPTNO : DEPARTMENT_NO
--3. �μ���ȣ�� �������� ������������ �����ϵ� �μ���ȣ�� ���ٸ� ��� �̸��� �������� �������� �����Ѵ�.

select EMPNO as EMPLOYEE_NO, ENAME, job, as EMPLOYEE_NAME, MGR as MANAGER, hiredate, SAL as SALARY, COMM as COMMISSION, 
        COMM as COMMISSION, DEPTNO as DEPARTMENT_NO 
from emp order by deptno desc, empno asc;

-- WHERE : ��ȸ�� �� �� ���� �ֱ�
-- �μ���ȣ�� 30���� ��� ��ȸ
select * from emp where deptno = 30;

-- tkdnjsqjsghrk 7782�� ��� ��ȸ
select * from emp where empno =7782;

--�μ���ȣ�� 30�̰�, �����å�� SALSEMAN  ���� ��ȸ 
varchar Ÿ���� '' ��� 
select * from emp where deptno=30 AND job='salesman';