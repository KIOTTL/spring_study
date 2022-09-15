package com.sist.spring5;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

// XML 대신 사용
// spring5 => 순수 자바로만 생성

@Configuration
@ComponentScan(basePackages = {"com.sist.spring5"})
public class MovieConfig {
	@Bean("ds")	// <bean id="ds">
	public DataSource dataSource() {
		BasicDataSource ds=new BasicDataSource();
		ds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		ds.setUrl("jdbc:oracle:thin:@183.98.140.90:1521:XE");
		ds.setUsername("hr");
		ds.setPassword("happy");
		
		return ds;
	}
	
	@Bean("ssf")
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean ssf=new SqlSessionFactoryBean();
		ssf.setDataSource(dataSource());
		ssf.setConfigLocation(new ClassPathResource("Config.xml"));	// classpath;
		
		return ssf.getObject();
	}
	
}
