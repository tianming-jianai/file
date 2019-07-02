-----查询基础 -----

--UPDATED
奖学金增加10%
UPDATE student SET fellowship=fellowship*1.1;

--DELETE 
删除所有记录：DELETE  FROM 表名;
删除表的结构和数据:DROP TABLE 表名;
删除所有记录，不写日志，删除快：TRUNCATE TABLE 表名;

--设置保存点
SAVEPOINT 保存点名称;
回滚：ROLLBACK TO 保存点名称;
设置保存点及回滚操作是配合 delete 语句使用，用来找回使用 delete 删除的数据。而通过
truncate 删除的表数据是无法通过此方法找回的。

--特别注意：oracle 对 sql 语句不区分大小写，但对查询内容区分大小写。

SELECT ename "姓名",sal*13+NVL(comm,0)*13 "年收入" FROM emp;

--特别注意：oracle 在使用别名时，可以用双引号或不使用或使用 as 来表明别名。但不能使用单引号。s

SELECT ename ||'年收入'||(sal*13+NVL(comm,0))||'雇员的年收入' FROM emp;

--某一时间点后入职的员工
select ename,hiredate from emp where to_char(hiredate,'yyyy-mm-dd')>'1970-1-1';
字符对比还是有一定出入的。不推荐使用。















