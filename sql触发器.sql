触发器的分类：
		1. DML 触发器（insert 、delete 、update 触发器）
		2. DDL 触发器（create table、create view 、drop table……）
		3. 系统触发器（与系统相关的触发器，比如用户登录、退出、启动数据库、关闭数据库）
	
	
	--DML触发器
		--在某张表（u1）添加一条数据的时候，提示“ 添加了一条数据”。
		CREATE OR REPLACE TRIGGER t1
		AFTER INSERT ON u1
		BEGIN
		  dbms_output.put_line('你在u1表中插入了一条数据'); 
		END;
		
		--在某张表(emp)修改多条数据的时候，提示多次“修改了数据”。
		--这个触发器只提示了一次
		CREATE OR REPLACE TRIGGER t2
		AFTER UPDATE ON u1
		BEGIN
		  dbms_output.put_line('修改了一条数据'); 
		END;

		update u1 set NAME=NAME||'cbd';
		----执行更新操作
		CREATE OR REPLACE TRIGGER t3
		AFTER UPDATE ON u1
		FOR EACH ROW --代表行级触发器
		BEGIN
		  dbms_output.put_line('修改了一条数据'); 
		END;

		update u1 set NAME=NAME||'cbd';
	
	
	--案例：为了禁止工作人员在休息日改变员工的信息，开发人员可以建立 before 语句触发器，从而实现数据的安全。

		CREATE OR REPLACE TRIGGER t4
		   BEFORE DELETE ON u1
		BEGIN
		  IF to_char(SYSDATE,'day') IN('星期四','星期日') THEN
			dbms_output.put_line('休息日不能删除表信息');
			raise_application_error(-20001,'对不起，休息日不能删除员工');
		  END IF;
		END;

	--为了禁止工作人员在休息日改变员工的信息，开发人员可以建立 before 语句触发器，从而实现数据的安全。在给出提示时，明确提示用户是进行的 insert、update 还是 delete 操作。
		CREATE OR REPLACE TRIGGER  t4
		   BEFORE DELETE OR UPDATE OR INSERT ON scott.u1
		BEGIN
		  CASE
			WHEN inserting THEN
			 dbms_output.put_line('请不要进行插入操作');
			 raise_application_error(-20002,'不能进行插入操作');
			WHEN updating THEN
			 dbms_output.put_line('请不要进行更新操作');
			 raise_application_error(-20003,'不能进行修改操作');
			WHEN deleting THEN
			 dbms_output.put_line('请不要进行删除操作');
			 raise_application_error(-20004,'不能进行删除操作');
		  END CASE;
		END;
		
	--在修改 emp 表雇员的薪水时，显示雇员工资修改前和修改后的值。如何确保在修改员工工资不能低于原有工资。
	
		CREATE OR REPLACE TRIGGER t5
		 BEFORE UPDATE ON scott.u2
		 FOR EACH ROW
		BEGIN
		  IF :new.sal < :old.sal THEN
			dbms_output.put_line('更新后的工资小于更新后的值！不能这样做');
			raise_application_error(-20006,'更新后的工资值小于更新前的值，不能这样做！');
		  ELSE
			dbms_output.put_line('更新前工资为：'||:old.sal||'更新后的工资为：'||:new.sal);
		  END IF;
		END;

		update u2 set sal=2000  where id=10;
		
		
		
-------
		--创建一张存储登录或者退出系统信息的表。
		Create table log_table( username varchar2(20),
		logon_time date,
		logoff_time date, address varchar2(20));
		--创建登录触发器：
		Create or replace trigger mytrigger1
		After logon on database
		Begin
		Insert into log_table(username, logon_time , address)
		values(ora_login_user, sysdate, ora_client_ip_address);
		End;
		--创建退出触发器：
		Create or replace trigger
		Before logoff on database
		Begin
		Insert into log_table(username, logoff_time, address)
		values(ora_login_user, sysdate , ora_client_ip_address);
		End;
--DDL 触发器：
		--DDL 简单说就是我们平常使用的 create、alter 和 drop 这些数据定义语句。
		
		触发器管理
		--1. 禁止触发器
		指让触发器临时失效。
		Alter trigger 触发器名 disable;
		--2. 激活触发器
		Alter trigger 触发器名 enable;
		--3. 删除触发器
		Drop trigger 触发器名;

		
		
		CREATE TABLE my_ddl_record(
		   eventt VARCHAR2(64),
		   username VARCHAR2(64),
		   ddl_time DATE
		);


		CREATE OR REPLACE TRIGGER mytrigger2
		AFTER ddl ON scott.u2
		BEGIN 
		  INSERT INTO my_ddl_record VALUES (ora_sysevent,ora_login_user,
		  SYSDATE);
		END;