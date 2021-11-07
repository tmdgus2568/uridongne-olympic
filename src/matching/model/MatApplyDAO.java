package matching.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import uridongne.util.DBConnection;

public class MatApplyDAO {
	String path;
	public MatApplyDAO(String path) {
		this.path = path;
	}
	
	// apply에 넣었으면 create의 nowjoin_people값을 더해준다 
	// result 
	//	:1 -> 성공
	//	:101 -> 무결성제약 위반
	//	:102 -> 참여인원 초과 
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
				

				// 다 성공했다면 
				// 1. 총 인원수를 넘었는지 확인 -> 넘었으면 rollback 
				// 2. 본인이 본인방에 신청넣으면 rollback 
				if(result != 0) {
					st = conn.prepareStatement(check_sql);
					st.setInt(1, apply.getMat_id());
					rs = st.executeQuery();
					if(rs.next()) {

						if(rs.getInt("nowjoin_people") <= rs.getInt("mat_people")) {
							
							conn.commit();
							return result;
						}
						result = 102;
						
					}
					
					
				}
				else result = 0;
				conn.rollback();

			}
			
			return result;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			switch(e.getErrorCode()) {
				case 1: // 무결성 제약조건 
					result=101;
					break;
			}
			
		}
		finally {
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
	
	
	// 매칭 개설자가 매칭 참여하는 것을 막음
	// matching_create 테이블안에 현재 유저와 현재 이 매칭의 아이디가 모두 포함되어있는 데이터가 있다면
	// 참여하지 못하게 
	// result:
	// 	0 -> 실패 
	//  1 -> 성공 
	public int isSelectByUserAndRes(String user_id, int mat_id) {
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "select * from matching_create m inner join "
				+ "stadium_reservation r on m.res_number = r.res_number "
				+ "where user_id=? and mat_id=?";
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			st.setString(1,user_id);
			st.setInt(2, mat_id);
			
			rs = st.executeQuery();
			
			// rs에 있다면 매칭 개설자이므로 막아놔야한다 
			if(rs.next()) {
				return 0;
				
			}
			
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnection.dbClose(conn, st, rs);
		}
		return 1;
	}

}
