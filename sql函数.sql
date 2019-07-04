--Day13-函数、序列 

函数一般用于计算和返回一个值，可以经常需要进行的计算写成函数。函数的调用是表
达式的一部分，而调用过程是一条 PL/SQL 语句。

	函数的结构
		声明部分：包括类型、变量、游标
		执行部分：完成功能而编写的 SQL 语句或则是 PL/SQL 代码块
		异常处理部分：

		函数与过程在创建的形式是有些相似，也是编译后放在内存中供用户使用，
		--只不过调用时函数时要用表达式，
		而不像过程只需要用过程名。另外，
		--函数必须有一个返回值，
		而过程则没有。 

		--统计major='Major'的个数
		CREATE OR REPLACE FUNCTION getcount(Major IN VARCHAR2)
		RETURN NUMBER IS
		f_count NUMBER;
		BEGIN
		  --使用into语句将结果赋值给变量
		  SELECT COUNT(*) INTO f_count FROM students WHERE major='Major';
		  --使用return语句返回
		  RETURN f_count;  
		END;


--使用函数：方式1
		DECLARE
		--声明变量接收函数的返回值
		 v_count NUMBER;
		BEGIN
		  v_count:=getcount('music');
		  dbms_output.put_line(v_count); 
		END;
	--方式2：
		variable c_count number;
		execute :c_count :=getcount('') --不用分号
	--方式3；
		var c_count2 number 
		call getcount('cc') into :c_count2;
	--方式4：
		SELECT getcount('a') FROM dual;
	--范式5：
		execute dbms_output.put_line(getcount('ALTER TABLE')); 
		
	--删除函数
		drop function 函数名;
		
		
		
--索引		
		创建索引就是对某些特定列中的数据排序，生成独立的索引表。
		
		在某列上创建索引后，如果该列出现在查询条件中，Oracle 会自动的引用该索引，先从索引表中查询出符合条件记录的 ROWID，由于 ROWID 是记录的物理地址，因此可以根据 ROWID 快速的定位到具体的记录，表中的数据非常多时，引用索引带来的查询效率非常可观。
		
		如果表中的某些字段经常被查询并作为查询的条件出现时，就应该考虑为该列创建索引。
		
		 当从很多行的表中查询少数行时，也要考虑创建索引。有一条基本的
		准则是：当任何单个查询要检索的行少于或者等于整个表行数的 10%
		时，索引就非常有用。
		
		--**Oracle 数据库会为表的主键和包含唯一约束的列自动创建索引。索引可以提高查询的效率，但是在数据增删改时需要更新索引，因此索引对增删改时会有负面影响。
		
		
		
		
		
		
		
		
		
		
				