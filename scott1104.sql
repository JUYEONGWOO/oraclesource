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
select to_char(sysdate, 'HH24:mi;ss pm') as ���糯¥ from dual;

-- ���ó�¥�� ��/��/�� 16:51:45 ǥ��

select to_char(sysdate,'yyyy/mm/dd hh24:mi;ss ') as ���糯¥�ð� from dual;

select 1300-to_number('1500'), to_number('1300')+1500 from dual;
select to_number('3,000,001' , '9,999,999')-to_number('3,000,001' , '9,999,999') from dual;
SELECT sal,to_char(sal, '$999,999') sal_$,
        to_char(sal, '$999,999') sal_$,
        to_char(sal, 'L999,999') sal_1,
        to_char(sal, '$999,999.00') sal_2,
        to_char(sal, '000,999,999.00') sal_3,
        to_char(sal, '999,999.00') sal_4
from emp;

select to_date('2020-11-05','yyyy/mm/dd') as todate1,
        to_date('20201105', 'yyyy-mm-dd') as todate2 from dual;
        
-- 1981��6��1�� ���Ŀ� �Ի��� ������� ��ȸ
select * from emp where hiredate > to_date('1981-06-01','yyyy-mm-dd');

select to_date('2019-12-20')-to_date('2019-10-20') from dual;

-- ��ó�� �Լ� : NVL, NVL2
SELECT empno, ename, sal, comm, sal+comm, nvl(comm,0), sal+nvl(comm,0)
from emp;

SELECT empno, ename, sal, comm, sal+comm, nvl2(comm,'O','X'), nvl2(comm,sal*12+12+comm,sal*12) as annsal
from emp;

-- DECODE�Լ��� CASE�� 
--job �� manager, salesman, analyst ��쿡 ������ �ٸ� ������ �����ϰ� �ʹٸ� ?
select empno,ename,job,sal,DECODE(job, 
                                  'MANAGER', SAL*1.1,
                                  'SALESMAN',SAL*1.05,
                                  'ANALYST', SAL,
                                  SAL*1.03) as UPSAL
from emp;

select empno,ename,job,sal,case job
                                 when 'MANAGER' then SAL*1.1
                                 when 'SALESMAN' then SAL*1.05
                                 when 'ANALYST' then SAL
                                 else SAL*1.03
                                 end as UPSAL
from emp;

select empno,ename,job,sal,case 
                                when comm is null then '�ش���׾���'
                                when comm = 0 then '�������'
                                when comm > 0 then '���� : ' || comm
                                end as comm_text from emp;
