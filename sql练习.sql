
--创建用户
 CREATE USER 用户名 IDENTIFIED BY 密码;
--给用户修改密码
ALTER USER 用户名 IDENTIFIED BY 密码;
--修改自己的密码
PASSWORD 用户名;


CREATE TABLE studenet(
   ID NUMBER,
   NAME VARCHAR2(64),
   sex CHAR(2),
   birthday DATE,
   score NUMBER(3,1),
   RESUME CLOB
);
--重命名
RENAME studenet TO student;
--添加字段
ALTER TABLE student ADD(class_id NUMBER);
--修改列  类型
ALTER TABLE student MODIFY(NAME VARCHAR2(30));
--删除多列
ALTER TABLE student DROP (ID,NAME);

ALTER TABLE student ADD(ID NUMBER,NAME VARCHAR2(30));
--修改列名
ALTER TABLE student RENAME COLUMN RESUME TO intro;
--查看表结构
DESC student;

Create TABLE CLASS(ID NUMBER PRIMARY KEY,NAME VARCHAR2(30));
CREATE TABLE stus(ID NUMBER PRIMARY KEY,NAME VARCHAR2(36) NOT NULL,classid NUMBER REFERENCES CLASS(ID));

CREATE TABLE user4(ID NUMBER PRIMARY KEY,
sal NUMBER CHECK(sal>=1000 AND sal<=2000),
sex CHAR(2)  DEFAULT '男' CHECK(sex IN('男','女')));
DROP TABLE user4;

CREATE TABLE user4(ID NUMBER PRIMARY KEY,
sal NUMBER CHECK(sal>=1000 AND sal<=2000),
sex CHAR(2) DEFAULT '男' CHECK(sex IN('男','女')));

INSERT INTO user4 VALUES(1,1000,'男');

-----------------------------------
eg.商店售货系统- -掌握创建约束
--商品表
CREATE TABLE goods(
 goodsId NUMBER PRIMARY KEY,
 goodsName VARCHAR2(64) NOT NULL,
 price NUMBER CHECK(price>0),
 CATEGORY VARCHAR2(64),
 provider VARCHAR2(64)
);
--客户表
CREATE TABLE customer(
 customerId NUMBER PRIMARY KEY,
 NAME VARCHAR2(30) NOT NULL,
 address VARCHAR2(64),
 email VARCHAR2(64) UNIQUE,
 sex CHAR(2) DEFAULT '男' CHECK(sex IN('男','女')),
 cardId VARCHAR2(18) UNIQUE
);
--购买表
CREATE TABLE purchase(
 customerId NUMBER REFERENCES customer(customerId),
 goodsId NUMBER REFERENCES goods(goodsId),
 nums NUMBER CHECK(nums>=1 AND nums<=30),
 PRIMARY KEY(customerId,goodsId)
);

--修改约束：
   1）增加 not null 约束使用 modify（因为字段（列）默认都是可以为空）
   2）增加其它四种约束使用 add。
   

--删除约束
ALTER TABLE purchase DROP PRIMARY KEY;
--添加主键约束
ALTER TABLE purchase ADD CONSTRAINT pk_purchase PRIMARY KEY(customerId,goodsId);
--添加非空约束
ALTER TABLE goods
