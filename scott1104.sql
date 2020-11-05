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
--varchar Ÿ���� '' ��� 
select * from emp where deptno=30 AND job='SALESMAN';
-- �����ȣ�� 7499�̰�, �μ���ȣ�� 30�� ���� ��ȸ
select * from emp where empno = 7499 AND deptno = 30;

-- �μ���ȣ�� 30�̰ų�, �����å�� CLERK ���� ��ȸ
select * from emp where deptno = 30 OR job = 'CLERK';
-- �μ���ȣ�� 20�̰ų�, �����å�� SALESMAN ���� ��ȸ
select * from emp where deptno = 20 OR job = 'SALESMAN';

--�����ڸ� �̿��� ��ȸ
-- sal*12 �� �ݾ��� 36000�� ������ ��ȸ
select * from emp where sal*12 = 36000;
-- ���迬���� : >, <, >= , <=
select * from emp where sal> 3000;
select * from emp where sal> =3000;
select * from emp where ename >= 'F' order by ename;

-- �������� : AND, OR
-- �޿��� 2500�̻��̰� , ������ ANALYST�� ���
select * from emp where sal >= 2500 and JOB = 'ANALYST';
-- ������ MANAGER, SALESMAN, CLERK �� ��� ���� ��ȸ
select * from emp where job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK';
-- ������� : ���� �׸��� ������ �˻�
-- SAL�� 3000�� �ƴ� ��� ���� ���
select * from emp where sal != 3000;
select * from emp where sal <> 3000;
select * from emp where sal ^= 3000;

-- IN ������
select * from emp where job in('MANAGER','SALESMAN', 'CLERK');
select * from emp where job != 'MANAGER' and job != 'SALESMAN' and job != 'CLERK';
select * from emp where job not in('MANAGER','SALESMAN', 'CLERK');

-- IN�� ����ؼ� �μ���ȣ�� 10,20���� ������� ��ȸ
select * from emp where deptno in(10,20);

-- LIKE : ���ڿ� �˻� ���(s�� �����ϴ� ~~, H�� ������..., ����� T�� ������)
--1)����̸��� S�� �����ϴ� ��� ������� ��ȸ�ϱ�
select * from emp where ename LIKE 'S%';
--2) ��� �̸��� �ι�° ���ڰ� L�� ����� ��ȸ
select * from emp where ename LIKE '_L%';
--3) ��� �̸��� AM�� ���ԵǾ� �ִ� ����� ��ȸ
select * from emp where ename Like '%AM%';

--4) ��� �̸��� AM�� ���ԵǾ� ���� ���� ����� ��ȸ
select * from emp where ename not Like '%AM%';

-- is null
-- select * from emp where com = null; (x)
select * from emp where comm is null;

--MGR(�Ŵ���id)�� NULL�� ������� ��ȸ
select * from emp where mgr is null;
--MGR(�Ŵ���id)�� NULL�� �ƴ� ������� ��ȸ
select * from emp where mgr is not null;

-- ���տ����� : ������(UNION), ������(INTERSECT), ������
-- DEPTNO�� 10 �� ���̺�� DEPTNO�� 20�� ����� ���ؼ� ���ؼ� �����ֱ�
SELECT empno, ename , sal, deptno FROM emp WHERE deptno = 10
union
SELECT empno, ename , sal, deptno FROM emp WHERE deptno = 20;
-- �ߺ��Ȱ͵� �����ַ��� UNION ALL �����(�⺻ UNION�� �⺻������  �ߺ����� �ֱ⶧����)
SELECT empno, ename , sal, deptno FROM emp WHERE deptno = 10
UNION ALL   
SELECT empno, ename , sal, deptno FROM emp WHERE deptno = 20;

-- �μ���ȣ�� 10�� �ƴ� ������� ���� ��ȸ
SELECT empno, ename , sal, deptno FROM emp
MINUS
SELECT empno, ename , sal, deptno FROM emp WHERE deptno = 10;
-- �μ���ȣ�� 10�� ������� ��ȸ
SELECT empno, ename , sal, deptno FROM emp
INTERSECT
SELECT empno, ename , sal, deptno FROM emp WHERE deptno = 10;

-- 20, 30�� �μ��� �ٹ��ϰ� �մ� ��� �� SAL �� 2000 �ʰ��� ����� ���� �ΰ��� ����� SELECT���� ����Ͽ� �����ȣ, �̸� ,�޿�, �μ���ȣ�� ����ϴ� sql�� �ۼ�
--���տ����� ������� �ʴ� ���
SELECT empno, ename, sal , deptno FROM emp WHERE deptno in(20,30) and sal >2000; 
--���տ����ڸ� ����ϴ� ���

SELECT empno, ename, sal , deptno FROM emp WHERE sal > 2000
MINUS
SELECT empno, ename, sal , deptno FROM emp WHERE deptno = 10;

SELECT empno, ename, sal , deptno FROM emp WHERE deptno in(20,30)
INTERSECT
SELECT empno, ename, sal , deptno FROM emp Where  sal >2000; 

-- oracle function
-- 1) �����Լ� : UPPER, LOWER, INITCAP, LENGTH, LENGTHB
-- ENAME �� UPPER, LOWER, INITCAP���� ��ȯ�Ͽ� ��ȸ
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename) 
FROM emp;
-- DUAL ���̺� �̿�(SYS�� �����ϰ� �ִ� ���̺�� �ӽÿ����̳� �Լ��� ������� Ȯ���ϴ� �뵵)
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM dual;
--��å �̸��� 6���� �̻��� ������� ���� ����
SELECT * FROM emp Where LENGTH(job) >= 6;

-- ���ڿ� �Լ� : substr
SELECT job, substr(job,1,2), substr(Job,3,2), substr(Job,5) FROM emp;
SELECT job, SUBSTR(job,-LENGTH(job)), SUBSTR(job, -LENGTH(job),2), SUBSTR(job,-3)
FROM emp;

-- ���ڿ� �Լ� : INSTR(Ư������ ��ġ ã��)
SELECT INSTR('HELLO, ORACLE!' , 'L') AS INSTR_1,
        INSTR('HELLO, ORACLE!' , 'L',5) AS INSTR_2, --5��° ���ĺ��� ã�ƺ�
        INSTR('HELLO, ORACLE!' , 'L',2,2) AS INSTR_3 --2���� ���ĺ��� ã��, 2��° L
from dual;

-- ���ڿ��Լ� : REPLACE(ã�Ƽ� �ٲٱ�) ���������͸� �ٲٴ� ���� �ƴ� ȭ������� �ٱ��°���
SELECT REPLACE('�̰��� oracle�̴� ', '�̰���', 'this is')
FROM dual;
SELECT '010-1234-5678' AS replace_before,
REPLACE('010-1234-5678','-',' ') AS replace_1,
REPLACE('010-1234-5678','-') AS replace_2
FROM dual;

--���ڿ� �Լ� : concat(����)
-- empno, ename�� �����Ͽ� ��ȸ
SELECT CONCAT(empno,ename), CONCAT(empno,CONCAT(':',ename))
FROM emp
WHERE ename ='SCOTT';

--||: ������ �ǹ̷� ����
SELECT empno||ename, empno||':'||ename
FROM emp
WHERE ename ='SCOTT';

-- ���ڿ� �Լ� : TRIM(��������),LTRIM(���� ���� ����), RTRIM(������ ���� ����)

select '     �̰���      ',TRIM('     �̰���      ')
FROM dual;

-- ���ڿ� �Լ� : REVERSE
SELECT REVERSE('Oracle') FROM dual;

--2. �����Լ� : ROUND(�ݿø�), TRUNC(����), CEIL(�Էµ� ���ڿ� ����� ū ����), FLOOR(�Էµ� ���ڿ� ����� ���� ����), MOD (������)

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
-- 3.��¥�Լ�: SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;

-- ��¥�����ʹ� ������ ������ : ��¥������ +1 ,-1 ,��¥������ - ��¥������
-- ��¥������ + ��¥�����ʹ� �ȵ�
SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW FROM dual;
-- ��¥�Լ�: ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL;
-- �Ի�10�ֳ��� �Ǵ� ����� ��ȸ
select empno, ename, hiredate, add_months(hiredate,120) from emp;
-- �Ի� 38�� �̸��� ��� ��ȸ
select * from emp where  add_months(hiredate,456)> sysdate; 

-- ��¥�Լ� : MONTHS_BETWEEN(�� ��¥ ������ ����)
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE)< 456;

SELECT empno, ename, hiredate, sysdate, months_between(hiredate, sysdate) AS months1, 
months_between(sysdate,hiredate) AS months2, TRUNC(months_between(sysdate,hiredate))
FROM emp;

-- ��¥�Լ� : NEXT_DAY, LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE, '������'), LAST_DAY(SYSDATE)
FROM DUAL;

-- 4. ����ȯ �Լ� : TO_CHAR(��¥,���ڵ����͸� ���ڷ� ��ȯ), TO_NUMBER(���ڵ����͸� ���ڷ� ��ȯ),
-- TO_DATE(���� �����͸� ��¥�� ��ȯ)

select to_char(sysdate, 'yyyy/mm/dd') as ���糯¥ from dual;
select to_char(sysdate, 'mm') as ���糯¥ from dual;
select to_char(sysdate, 'mon') as ���糯¥ from dual;
select to_char(sysdate, 'dd') as ���糯¥ from dual;
select to_char(sysdate, 'day') as ���糯¥ from dual;
select to_char(sysdate, 'HH:mi;ss') as ���糯¥ from dual;
select to_char(sysdate, 'HH12:mi;ss') as ���糯¥ from dual;
select to_char(sysdate, 'HH24:mi;ss') as ���糯¥ from dual;