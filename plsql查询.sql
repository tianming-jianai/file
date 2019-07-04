
--***属性数据类型***--
		--赋值
		declare 
		  
		  sname VARCHAR2(20):='jerry';
		begin
		  sname:=sname||' and tom';
		  dbms_out.put_line(sname);
		  
		end;


		--%rowtype记录类型
		DECLARE
		   myemp emp%ROWTYPE;
		BEGIN
		  SELECT * INTO myemp  FROM emp WHERE empno=7934;
		  dbms_output.put_line(myemp.ename);
		END;


		--%type
		DECLARE
		 sal emp.sal%TYPE;
		 mysal NUMBER(4):=3000;
		 totalsal mysal%TYPE;
		BEGIN 
		  SELECT sal INTO sal FROM emp WHERE empno=7934;
		  totalsal:=sal+mysal;
		  dbms_output.put_line(totalsal);
		END;

--PL/SQL 条件控制和循环控制 
	--if then 
		DECLARE
		  newSal  emp.sal%TYPE;
		  
		BEGIN
		  SELECT sal INTO newSal FROM emp
		  WHERE ename = 'JAMES';
		  IF newSal>900 THEN
			dbms_output.put_line(''||'奖金增加800');
		  END IF;
		  COMMIT;
		END;
		注意：该 COMMIT 同时也能把 PL/SQL 块外没有提交的数据一并提交，使用时需要注意。
	-- if then else
		DECLARE
		  newSal emp.sal%TYPE;  
		BEGIN
		  SELECT sal INTO newSal FROM emp WHERE ename='JAMES';
		  IF newSal > 900 THEN
			dbms_output.put_line('设置奖金800');
		  ELSE
			dbms_output.put_line('设置奖金400');
		  END IF;
		END;
	-- if then else if
		DECLARE 
		 newSal emp.sal%TYPE;
		BEGIN
		 SELECT sal INTO newSal FROM emp WHERE ename='JAMES';
		  IF newSal>1500 THEN
			dbms_output.put_line('添加奖金1000');
		  ELSIF newSal>1000 THEN
		   dbms_output.put_line('添加奖金800');
		  ELSE
		   dbms_output.put_line('添加奖金400');
		  END IF;
		END;
		
	-- CASE
		DECLARE 
		  v_grade CHAR(1):=upper('&p_grade');
		BEGIN
		  CASE v_grade
			
			WHEN 'A' THEN
				dbms_output.put_line('A');
			WHEN 'B' THEN
				dbms_output.put_line('B');
			WHEN 'C' THEN
				dbms_output.put_line('C');
			ELSE
			  dbms_output.put_line('no such grade');
		  END CASE;
		END;
		
		
	PL/SQL 提供了丰富的循环结构来重复执行一些列语句。Oracle 提供的循环类型有：
		1. 无条件循环 LOOP-END LOOP 语句
		2. WHILE 循环语句
		3. FOR 循环语句
		
		-- LOOP
			DECLARE
			   counter NUMBER(3):=0;
			   sumResult NUMBER:=0;
			BEGIN
			  LOOP
				counter:=counter+1;
				sumResult:=sumResult+counter;
				IF counter>=100 THEN
				  EXIT;
				END IF;
			  END LOOP;
			  dbms_output.put_line('result is:'||to_char(sumResult));
			END;
		-- WHILE
			DECLARE
			   counter NUMBER(3):=0;
			   sumResult NUMBER:=0;
			BEGIN
			  WHILE counter<100 LOOP
				counter:=counter+1;
				sumResult:=sumResult+counter;
			  END LOOP;
			  dbms_output.put_line('result is:'||to_char(sumResult));
			END;
		-- FOR
			DECLARE
			   counter NUMBER(3):=0;
			   sumResult NUMBER:=0;
			BEGIN
			   FOR counter IN 1..100 LOOP
				 sumResult:=sumResult+counter;
			   END LOOP;
			  dbms_output.put_line('result is:'||to_char(sumResult));
			END;
---顺序结构
		DECLARE
		   sumsal emp.sal%TYPE;
		   
		BEGIN
		   SELECT SUM(sal) INTO sumsal FROM emp;
		   IF sumsal>20000 THEN
			 GOTO first_label;
		   ELSE
			 GOTO second_label;
		   END IF;
		   
			<<First_label>>
			   dbms_output.put_line('above 20000'||to_char(sumsal));
			<<second_label>>
				NULL;
		END;
		NULL 语句什么都不做，只是将控制权转到下一行语句。
		
--游标
		属性名称 说 明
		%found 用于检验游标是否成功，通常在 FETCH 语句前使用，
		当游标按照条件查询出一条记录时，返回 true
		%isopen 判断游标是否处于打开状态，视图打开一个已经打开或者
		已经关闭的游标，将会出现错误
		%notfound 与%found 的作用相反，当按照条件
		无法查询到记录时，返回 true
		%rowcount 循环执行游标读取数据时，返回检索出的记录数据的行数

		DECLARE 
		   ename VARCHAR2(20);
		   sal emp.sal%TYPE;
		   --声明一个游标
		   CURSOR c_emp IS SELECT ename,sal FROM emp WHERE empno=7369;  
		BEGIN
		  --打开游标
		  OPEN c_emp;
		  --判断游标是否返回记录
		  IF c_emp%NOTFOUND THEN
			  dbms_output.put_line('没哟找到想要的记录');
		  ELSE
			  --从游标中读取记录
			  FETCH c_emp INTO ename,sal;
			  dbms_output.put_line(ename||'薪水为'||sal);
		  END IF;
		  --关闭游标
		  CLOSE c_emp;
		END;
		
			使用 FETCH 语句只能读取一行记录，那么如何读取多行记录呢？
			读取多行记录时，可以采用循环的方式

		--读取多条记录
		declare 
		  v_ename VARCHAR2(20);
		  v_sal emp.sal%TYPE;
		  CURSOR c_emps IS SELECT ename,sal FROM emp WHERE sal<=3000;		 
		begin
		  FOR c_emp IN c_emps LOOP
			v_ename:=c_emp.ename;
			v_sal:=c_emp.sal;
			dbms_output.put_line('员工姓名：'||v_ename||'薪水为：'||v_sal); 
		  END LOOP;
		end;
		说明：
		1.使用 for 循环时，自动打开游标，而无需使用 OPEN 语句
		2.PL/SQL 会自动对变量进行隐式声明
		3.当循环结束后，游标会总动关闭
		
		--练习
			declare 
			  v_ename VARCHAR2(20);
			  v_empno NUMBER;
			  deptname VARCHAR2(20);
			  CURSOR c_emps IS SELECT E.ename,e.empno,e2.dname FROM emp e,dept e2 WHERE e.ename='SMITH'and e2.deptno=E.Deptno;
			begin
			  --打开游标
			  OPEN c_emps;
			  --
			  IF c_emps%NOTFOUND THEN
				dbms_output.put_line('没有找到相关记录'); 
			  ELSE
				--从游标中读取数据
				FETCH c_emps INTO v_ename,v_empno,deptname;
				dbms_output.put_line(v_ename||'---'||v_empno||'--'||deptname);  
			  END IF;
			  --关闭游标
			  CLOSE c_emps;
			end;
		
		-- 练习
			Declare
			   v_ename Varchar2(20);
			   v_deptno NUMBER(4);
			   v_dname Varchar2(20);
			   
			   CURSOR c_emps IS SELECT ename,dept.deptno,dname
			   FROM emp,dept
			   WHERE emp.deptno=dept.deptno
			   AND emp.deptno=(
				 SELECT deptno FROM emp WHERE ename='SMITH'
			   );
				BEGIN
			   FOR c_emp IN c_emps LOOP
				 v_ename:=c_emp.ename;
				 v_deptno:=c_emp.deptno;
				 v_dname:=c_emp.dname;
				 dbms_output.put_line(v_ename||'--'||v_deptno||'--'||v_dname);
			   END LOOP;
			 END;

