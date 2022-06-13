package memo;

import java.sql.*;


public class DBset {
	
	public DBset() {
		
	}
	
	public Connection getConnection() throws Exception {
		String url = "jdbc:oracle:thin:@localhost:1521:system";
		String id = "C##memo";
		String pwd = "memo1234";
		Connection conn;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		conn = DriverManager.getConnection(url, id, pwd);
		
		return conn;
	}
	
}
