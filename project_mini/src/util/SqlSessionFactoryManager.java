package util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryManager {
	private SqlSessionFactory factory;
	/************* 싱글톤객체 *******************************/
	private static SqlSessionFactoryManager instance;

	public static SqlSessionFactoryManager getInstance() throws IOException {
		if (instance == null)
			instance = new SqlSessionFactoryManager();
		return instance;
	}

	private SqlSessionFactoryManager() throws IOException {
		InputStream in = Resources.getResourceAsStream("dao/config/mybatis-config.xml");
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		factory = builder.build(in);// 전역설정파일의 inputStream으로 넣어서
									// SqlSessionFactory생성

		// factory = new
		// SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("hr/dao/config/mybatis-config.xml"));
	}

	/************* 싱글톤객체 *******************************/

	public SqlSessionFactory getSqlSessionFactory() {
		return factory;
	}
}
