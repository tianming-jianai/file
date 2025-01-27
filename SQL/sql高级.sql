--Oracle 06复杂查询：


--------------------------------------

--分页查询
SELECT * FROM 
(SELECT t1.*,ROWNUM rn FROM 
(SELECT * FROM emp ORDER BY hiredate) t1
WHERE rownum<10) t2 WHERE rn>3;

--oracle 视图
CREATE VIEW 视图名 AS SELECT [WITH READ ONLY];

 删除视图
 DROP VIEW 视图名;
--注意：
 Oracle 在创建用户的时候如果直接给用户DBA权限，那么在B用户中可以直接查询A用户的表，但是在创建视图时就会报无权限，在这种情况下需要再在被访问的A用户里面去给予要访问该表的B用户授权。 
  --创建视图权限，一般网上找都是说的这句，但是光有这句还是无法创建 
  grant create  view to B; 
  --授予查询权限 
  grant select any table to B; 
  --授予权限 
  grant select any dictionary to B; 
 
视图和表的区别：
  1、表需要占用磁盘空间，而视图不需要；
  2、视图不能添加索引；
  3.使用视图可以简化复杂查询；
  4.使用视图利于提高安全性。
  5.对视图的修改将会影响实际的数据表
create or replace view eview as select empno,ename,job from emp;
删除视图需要被授予：connect权限



DAY-09需要背诵
   PL/SQL 块 
   
   
   测试pl/SQL块报错：
   ORA-0131:debugging requires the debug connect session system privilege
   GRANT debug connect session TO username
   
   -- Created on 2019/7/3 by ACER 
declare 
  
  sname VARCHAR2(20):='jerry';
begin
  sname:=sname||' and tom';
  dbms_output.put_line(sname);
end;