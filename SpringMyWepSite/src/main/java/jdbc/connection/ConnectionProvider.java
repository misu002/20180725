package jdbc.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
	public class ConnectionProvider {
		//호출한 쪽에서 예외처리 할것
		public static Connection getConnection() throws SQLException {
				return DriverManager.getConnection("jdbc:apache:commons:dbcp:pool1");
		}
	}