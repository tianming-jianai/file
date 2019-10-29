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
		
		
		UNIQUE:指定索引列上的值必须是唯一的。称为唯一索引。
		index_name：指定索引名。
		tabl_name：指定要为哪个表创建索引。
		column_name：指定要对哪列创建索引。我们也可以对多列创建索引；这种索引称为组合索引。
		
		
		--单列索引
		CREATE INDEX index_name ON TABLE(columnname);
		
		--复合索引
		但是要求列的组合必需不同，
		CREATE INDEX index_name ON TABLE(columnname,columname);
		
		--索引的使用原则：
			1、在大表上建立索引才有意义；
			2、在 where 子句或是连接条件上经常引用的列上建立索引；
			3、在逻辑型类型字段上或者值就是固定几种的列上也不要建立索引。
		
		索引缺点分析
			索引有一些先天不足：
				1、建立索引，系统要占用大约为表的 1.2 倍的硬盘和内存空间来保存索引。
				2、更新数据的时候，系统必需要有额外的时间来同时对索引进行更新，以维持数据和
			索引的一致性。实践表明，不恰当的索引不但于事无补，反而会降低系统性能。因为大量的索引在进行插入、修改和删除操作时比没有索引花费更多的系统时间。
			比如在如下字段建立索引应是不恰当的：
				1、很少或从不引用的字段；
				2、逻辑型的字段，如男或女(是或否)等。
				综上所述，提高查询效率是以消耗一定的系统资源为代价的，索引不能盲目的建立，
				这是考验一个 DBA 是否优秀的很重要的指标。

		索引分类：了解
		
				