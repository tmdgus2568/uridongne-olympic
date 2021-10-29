package uridongne.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {

	public static Connection dbConnect(String path) {

		String DB_URL = "jdbc:oracle:thin:@matching_medium?TNS_ADMIN=";
		String DB_USER = "ADMIN";
		String DB_PASSWORD = "Kosta226good";
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Properties p = new Properties();
			DB_URL = DB_URL + path.replaceAll("\\\\", "/") + "/WEB-INF/Wallet_matching";
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void dbClose(Connection conn, PreparedStatement st, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (st != null)
				st.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
