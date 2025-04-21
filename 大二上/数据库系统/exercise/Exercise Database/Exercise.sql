USE CLASS1;

SELECT * FROM BONUS;
SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

SELECT COUNT(*) FROM EMP;

/*
3.	������Ա���Ĺ����ϸ�10%.Ȼ���ѯԱ��������нˮ����������emp.salΪ���ʣ�emp.commΪ������*/
UPDATE EMP SET SAL = SAL * 1.1;
SELECT ENAME AS 'NAME', SAL AS 'SALARY', COMM AS 'COMMISSION' FROM EMP;

UPDATE EMP SET SAL = SAL / 1.1;

/*
4.	�鿴EMP���в��ź�Ϊ10��Ա����������ְλ���μӹ���ʱ�䣬���ʡ�*/
SELECT ENAME AS 'NAME', JOB AS 'JOB', HIREDATE AS 'DATE', SAL AS 'SALARY' FROM EMP WHERE EMP.DEPTNO = 10;

/*
5.	���������е�ְλ��Ҫ��ȥ���ظ��*/
SELECT DISTINCT JOB AS 'JOB' FROM EMP;

/*
6.	����ÿ��Ա������н����ȡ����ΪSalary of Year��emp.salΪԱ������н����Ҫ�����Ա����������н��*/
SELECT ENAME AS 'NAME', SAL*12 AS 'Salary of Year' FROM EMP;

/*
7.	��ѯÿ��Ա��ÿ�����õ����ܽ�emp.salΪ���ʣ�emp.commΪ������������ʾ��isnull��ex1,ex2����ʾ���ex1Ϊ���򷵻�ex2��*/
SELECT ENAME AS 'NAME', SAL+ISNULL(COMM, 0) AS 'Salary' FROM EMP;

/*
8.	��ʾְλ�����ܣ�manager����Ա�������������ʡ�*/
SELECT ENAME AS 'NAME', SAL AS 'SALARY' FROM EMP WHERE JOB = 'MANAGER';

/*
9.	��ʾ��3���ַ�Ϊ��дO������Ա�������������ʡ�*/
SELECT ENAME AS 'NAME', SAL AS 'SALARY' FROM EMP WHERE ENAME LIKE '__O%';

/*
10.	��ʾְλΪ����Ա��SALESMAN�������ܣ�MANAGER����Ա�������������ʣ�ְλ��*/
SELECT ENAME AS 'NAME', SAL AS 'SALARY', JOB AS 'JOB' FROM EMP WHERE JOB = 'SALESMAN' OR JOB = 'MANAGER';

/*
11.	��ʾ����û�в�����Ա����������*/
SELECT ENAME AS 'NAME' FROM EMP WHERE COMM IS NULL OR COMM = 0;

/*
12.	��ʾ�в�����Ա�������������ʣ�������*/
SELECT ENAME AS 'NAME', SAL AS 'SALARY', COMM AS 'COMMISSION' FROM EMP WHERE COMM IS NOT NULL AND COMM != 0;

/*
13.	������ʾ����Ա�������������ʣ������ʽ���ʽ��*/
SELECT ENAME AS 'NAME', SAL AS 'SALARY' FROM EMP ORDER BY EMP.SAL DESC;

/*
14.	��ʾԱ������߹��ʺ���͹��ʡ�*/
SELECT MAX(EMP.SAL) AS 'MAX SALARY', MIN(EMP.SAL) AS 'MIN SALARY' FROM EMP;

/*
15.	��ʾ����Ա����ƽ�����ʺ��ܼƹ��ʡ�*/
SELECT AVG(EMP.SAL) AS 'AVERAGE SALARY', SUM(EMP.SAL) AS 'SUMMERY SALARY' FROM EMP;

/*
16.	��ʾ������Ա���еķ��ű��������ж��ٱ�����Ա���в�����
��������ע���������⣺1.select����н��г�����α���С��������ݡ�2.count������δ���null�����ݡ���*/
SELECT (COUNT(EMP.COMM)+0.0)/COUNT(*) FROM EMP;

/*(PROBLEM)
17.	��ʾÿ��ְҵ��ƽ�����ʡ�*/
SELECT JOB, AVG(EMP.SAL) AS 'AVERAGE SALARY' FROM EMP GROUP BY JOB;

/*
18.	��ʾÿ������ÿ�ָ�λ��ƽ�����ʺ���߹��ʡ�*/
SELECT DEPTNO,JOB, AVG(EMP.SAL) AS 'AVERAGE SALARY', MAX(EMP.SAL) AS 'MAX SALARY' FROM EMP GROUP BY DEPTNO, JOB;

/*
19.	��ʾƽ�����ʵ���2500�Ĳ��źţ�ƽ�����ʼ���߹��ʡ�*/
SELECT DEPTNO, AVG(EMP.SAL) AS 'AVERAGE SALARY', MAX(EMP.SAL) AS 'MAX SALARY' FROM EMP
GROUP BY DEPTNO
HAVING AVG(EMP.SAL) <= 2500
ORDER BY AVG(EMP.SAL) ASC;

/*
20.	��һ�������ƽ��������������
AT 19. */

/*
21.	��ʾ���ʸ���2500���λΪMANAGER������Ա�������������ʣ�ְλ���Ͳ��źš�*/
SELECT ENAME, SAL, JOB, DEPTNO
FROM EMP
WHERE SAL > 2500 OR JOB = 'MANAGER';

/*
22.	������ʾ����Ա�������������źţ����ʣ��Բ��ź����򣬹��ʽ��򣬹�������������ʾ����*/
SELECT ENAME, DEPTNO, SAL 
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC, HIREDATE ASC;

/*
23.	������Ȼ����ԭ����ʾ�������Լ���Ӧ��Ա����������Sql server��֧��NATURAL JOIN�﷨����*/


/*
24.	��ѯSCOTT���ϼ��쵼��������*/

/*
25.	��ʾ���ŵĲ������ƣ�Ա������ʹ����û��Ա��Ҳ��ʾ�������ơ�*/
USE CLASS1;
SELECT DEPT.DNAME, EMP.ENAME
FROM DEPT
LEFT OUTER JOIN EMP
ON DEPT.DEPTNO = EMP.DEPTNO;

/*
26.	��ʾ����Ա�������ơ������Լ����ʼ���*/
SELECT EMP.ENAME, EMP.SAL, SALGRADE.GRADE
FROM EMP
JOIN SALGRADE
ON EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL;

/*
27.	��ʾACCOUNTING��������Ա�������ƣ����ʡ�*/
SELECT EMP.ENAME, EMP.SAL
FROM EMP
JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO AND DEPT.DNAME = 'ACCOUNTING';

/*
28.	��ʾְλ����10�Ų������ṩְλ��Χ��Ա����������ְλ�����ʣ����źš�*/
SELECT EMP.ENAME, EMP.JOB, EMP.SAL, EMP.DEPTNO
FROM EMP
WHERE EMP.JOB IN(SELECT EMP.JOB FROM EMP WHERE EMP.DEPTNO = 10);

/*
29.	��ʾ������Ա�����и���30�Ų�������һ��Ա�����ʵ�Ա�������������ʺͲ��źš�*/
SELECT EMP.ENAME, EMP.SAL, EMP.DEPTNO
FROM EMP
WHERE EMP.SAL > ALL(SELECT EMP.SAL FROM EMP WHERE EMP.DEPTNO = 30);

/*
30.	��ʾ���ʸ���2500��ְλΪMANAGER��Ա�������������ʺ�ְλ������UNION�﷨ʵ�֣���*/
SELECT EMP.ENAME, EMP.SAL, EMP.JOB
FROM EMP
WHERE EMP.SAL > 2500
UNION
SELECT EMP.ENAME, EMP.SAL, EMP.JOB
FROM EMP
WHERE EMP.JOB = 'MANAGER';

/*
31.	��ʾ���ʸ���2500��ְλΪMANAGER��Ա�������������ʺ�ְλ������INTERSECT�﷨ʵ�֣���*/
SELECT EMP.ENAME, EMP.SAL, EMP.JOB
FROM EMP
WHERE EMP.SAL > 2500
INTERSECT
SELECT EMP.ENAME, EMP.SAL, EMP.JOB
FROM EMP
WHERE EMP.JOB = 'MANAGER';

/*
32.	��ʾ���ʸ���2500��ְλ����MANAGER��Ա�������������ʺ�ְλ������EXCEPT�﷨ʵ�֣���*/
SELECT EMP.ENAME, EMP.SAL, EMP.JOB
FROM EMP
WHERE EMP.SAL > 2500
EXCEPT
SELECT EMP.ENAME, EMP.SAL, EMP.JOB
FROM EMP
WHERE EMP.JOB = 'MANAGER';