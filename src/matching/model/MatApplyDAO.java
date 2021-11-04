package matching.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import uridongne.util.DBConnection;

public class MatApplyDAO {
	String path;
	public MatApplyDAO(String path) {
		this.path = path;
	}
	
	// apply에 넣었으면 create의 nowjoin_people값을 더해준다 
	public int insertApply(MatApplyVO apply) {
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "insert into matching_apply VALUES(?, ?, ?)";
		String next_sql = "update matching_create set nowjoin_people=nowjoin_people+? where mat_id=?";
		String check_sql = "select * from matching_create where mat_id=?";
		int result = 0;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.dbConnect(path);
			conn.setAutoCommit(false);
			st = conn.prepareStatement(sql);
			st.setInt(1,apply.getMat_id());
			st.setString(2, apply.getUser_id());
			st.setInt(3, apply.getTogether());
			
			result = st.executeUpdate();
			if(result != 0) {
				st = conn.prepareStatement(next_sql);
				st.setInt(1, apply.getTogether());
				st.setInt(2, apply.getMat_id());
				
				result = st.executeUpdate();
				

				// 다 성공했다면 총 인원수를 넘었는지 확인 -> 넘었으면 rollback 
				if(result != 0) {
					st = conn.prepareStatement(check_sql);
					st.setInt(1, apply.getMat_id());
					rs = st.executeQuery();
					if(rs.next()) {
//						System.out.println(rs.getInt("nowjoin_people"));
//						System.out.println(rs.getInt("mat_people"));
						if(rs.getInt("nowjoin_people") <= rs.getInt("mat_people")) {
							conn.commit();
							return result;
						}
						
					}
					
				}
				result = 0;
				conn.rollback();

			}
			
			return result;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.dbClose(conn, st, null);
		}
		
		try {
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
		
	}

}
