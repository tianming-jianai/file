package com.hkd.test;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hkd.entity.Person;

public class TestMyBatis {
	
	public static void main(String[] args) throws Exception {
		testMyBatis();
	}

	public static void testMyBatis() throws Exception {
		//加载mybatis配置文件
		Reader reader = Resources.getResourceAsReader("conf.xml");
		//SqlSessionFactory
		SqlSessionFactory sqlSessionFactory=new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//第一个参数：namespace+id
		Person person = sqlSession.selectOne("com.hkd.mapper.PersonMapper.selectPerson", 1);
		System.out.println(person);
		sqlSession.close();
	}
}
