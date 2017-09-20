package com.kosta.rnbcafe.cofig;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariDataSource;

import oracle.jdbc.pool.OracleDataSource;


@Configuration
public class DbConfig {
	
	private String dbUrl="jdbc:oracle:thin:@192.168.0.122:1521:xe";
	private String dbUserName="rnb";
	private String dbPassword="rnb";
	
	@Bean
	@Primary
	public DataSource dataSource() throws Exception {
		System.out.println(">>> dataSource call ==> db_url ::: " + dbUrl);
		OracleDataSource ds = new OracleDataSource();
		ds.setURL(dbUrl);
		ds.setUser(dbUserName);
		ds.setPassword(dbPassword);
		
//		HikariDataSource ds = new HikariDataSource();
//		ds.setDriverClassName("oracle.jdbc.OracleDriver");
//		ds.setJdbcUrl(dbUrl);
//        ds.setUsername(dbUserName);
//        ds.setPassword(dbPassword);
//        ds.setConnectionTestQuery("SELECT 1 FROM DUAL");
//        ds.setMaximumPoolSize(10);
        return ds;
	}
}
