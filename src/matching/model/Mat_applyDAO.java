package matching.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import uridongne.util.DBConnection2;

public class Mat_applyDAO {
	String path;
	public Mat_applyDAO(String path) {
		this.path = path;
	}
	
	
	public int insertApply(Mat_applyVO apply) {
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "insert into matching_apply VALUES(?, ?, ?)";
		int result = 0;
		
		try {
			conn = DBConnection2.dbConnect(path);
			st = conn.prepareStatement(sql);
			st.setInt(1,apply.getMat_create().getMat_id());
			st.setString(2, apply.getUser_id());
			st.setInt(3, apply.getTogether());
			
			result = st.executeUpdate();
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection2.dbClose(conn, st, null);
		}
		return result;
		
		
	}

}
