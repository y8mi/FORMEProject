package org.zerock.persitence;

import static org.junit.Assert.fail;

import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;
@Log4j
public class JDBCTest {
	
	@Test
	public void testConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 로딩
			DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott", "tiger");
			log.info("jdbc 연결성공");
		} catch (Exception e) {
			fail(e.getMessage());
			
		} 
	}
}