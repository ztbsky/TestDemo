package cn.mldn.util.dbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	
	private static final String drivate ="oracle.jdbc.driver.OracleDriver";
	private static final String url ="jdbc:oracle:thin:@localhost:1521:mldn";
	private static final String user ="scott";
	private static final String password ="tiger";
	
	private static ThreadLocal<Connection> threadLocal =new ThreadLocal<Connection>();
	
	public static Connection getConnection(){
		Connection conn =threadLocal.get();
		if (conn==null) {
			conn=rebulidConnection();
			threadLocal.set(conn);
		}
		return conn;
	}
	public static Connection rebulidConnection(){
		try {
			Class.forName(drivate);
			return DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void close(){
		Connection conn =threadLocal.get();
		if (conn!=null) {
			try {
				conn.close();
				threadLocal.remove();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
