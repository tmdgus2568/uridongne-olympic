package uridongne.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBConnection2 {

	String DB_URL="jdbc:oracle:thin:@matching_medium?TNS_ADMIN=/Users/hsh/Desktop/kosta/uridongne_sub/Wallet_matching";
	String DB_USER = "ADMIN";
	String DB_PASSWORD = "Kosta226good";
	
	// 자원 반납 
    public static void dbClose(Connection conn, Statement st, ResultSet rs) {
        try {
            if(rs!=null) rs.close();
            if(st!=null) st.close();
            if(conn!=null) conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    
    // db 연결 
	public Connection dbConnect() throws ClassNotFoundException, SQLException {
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

		return conn;
	}
}
