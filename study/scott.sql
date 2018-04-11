--테이블의 각 행들은 식별 가능해야 한다
--테이블에는 행을 식별한느 컬럼이 있어야 한다 -기본키 primary key
--primary key -> not null(필수 입력), unique(중복 불가)
--기본키는 자동으로 인덱스(찾아보기)를 생성 -> 빠른 조회 가능
--후보키 : 스마트폰 번호, 주민번호, 사원번호
create table sample(
    id varchar2(10) primary key,
    irum varchar2(10)    
);

select empno from emp;

select ename from emp;

--데이터 정렬하기 order by
--지정하지 않으면 오름차순
select empno,sal from emp order  by sal;

--사번 내림 차순으로 출력
select ename,empno from emp where empno>0 order by empno desc;

--사번 오름차순, 급여 내림차순으로 정렬

select * from emp where empno>0 order by empno asc, sal desc;

--부서번호 내림차순, 급여 오름차순
select * from emp order by deptno desc, sal;

--컬럼 순서로 정렬하기 
select *
from emp order by 3 desc, 4 asc;

select empno, ename, deptno, sal from emp order by 3 desc,4 asc;

--조건 지정하기 : where 절
select * from emp where job = 'MANAGER';

--20번 부서에 근무하는 사원의 사번, 이름, job, 부서번호 출력
select empno, ename ,job, deptno from emp where deptno=20;

select empno, ename, job, deptno from emp where ename='KING';

select * from emp where hiredate = '80/12/17';

select * from emp order by empno desc;

select * from emp where job='MANAGER';

select empno, ename, job, deptno from emp where deptno=20 order by sal desc;

select ename, sal, sal*0.03 as tax from emp;

--컬럼 별칭 지정
select sal*1.1 salary from emp;

--비교 : < > >= = 
-- !=/<> : 같지 않다

--null 처리하기
select * from emp where comm is not null;
select * from emp where comm is null;

--가상컬럼 : rownum  - 오라클이 읽어온 행에 붙이는 가상 번호
select rownum, empno, ename, job, deptno from emp where ename='KING';

--하나만 찾고 멈춰랏
select * from emp where ename = 'KING' and rownum=1;


--nvl
select empno, nvl(sal+comm,sal) from emp;

--급여가 1000에서 2000사이(범위)
select * from emp where sal between 1000 and 2000;