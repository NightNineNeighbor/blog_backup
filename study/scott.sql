--���̺��� �� ����� �ĺ� �����ؾ� �Ѵ�
--���̺��� ���� �ĺ��Ѵ� �÷��� �־�� �Ѵ� -�⺻Ű primary key
--primary key -> not null(�ʼ� �Է�), unique(�ߺ� �Ұ�)
--�⺻Ű�� �ڵ����� �ε���(ã�ƺ���)�� ���� -> ���� ��ȸ ����
--�ĺ�Ű : ����Ʈ�� ��ȣ, �ֹι�ȣ, �����ȣ
create table sample(
    id varchar2(10) primary key,
    irum varchar2(10)    
);

select empno from emp;

select ename from emp;

--������ �����ϱ� order by
--�������� ������ ��������
select empno,sal from emp order  by sal;

--��� ���� �������� ���
select ename,empno from emp where empno>0 order by empno desc;

--��� ��������, �޿� ������������ ����

select * from emp where empno>0 order by empno asc, sal desc;

--�μ���ȣ ��������, �޿� ��������
select * from emp order by deptno desc, sal;

--�÷� ������ �����ϱ� 
select *
from emp order by 3 desc, 4 asc;

select empno, ename, deptno, sal from emp order by 3 desc,4 asc;

--���� �����ϱ� : where ��
select * from emp where job = 'MANAGER';

--20�� �μ��� �ٹ��ϴ� ����� ���, �̸�, job, �μ���ȣ ���
select empno, ename ,job, deptno from emp where deptno=20;

select empno, ename, job, deptno from emp where ename='KING';

select * from emp where hiredate = '80/12/17';

select * from emp order by empno desc;

select * from emp where job='MANAGER';

select empno, ename, job, deptno from emp where deptno=20 order by sal desc;

select ename, sal, sal*0.03 as tax from emp;

--�÷� ��Ī ����
select sal*1.1 salary from emp;

--�� : < > >= = 
-- !=/<> : ���� �ʴ�

--null ó���ϱ�
select * from emp where comm is not null;
select * from emp where comm is null;

--�����÷� : rownum  - ����Ŭ�� �о�� �࿡ ���̴� ���� ��ȣ
select rownum, empno, ename, job, deptno from emp where ename='KING';

--�ϳ��� ã�� �����
select * from emp where ename = 'KING' and rownum=1;


--nvl
select empno, nvl(sal+comm,sal) from emp;

--�޿��� 1000���� 2000����(����)
select * from emp where sal between 1000 and 2000;