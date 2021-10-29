package matching.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import uridongne.util.DBConnection;

public class Mat_createDAO {
	String path;
	
	
	public Mat_createDAO(String path) {
		this.path = path;
	}

	// 매칭 생성 방을 모두 조회한다 
	public List<Mat_createVO> selectAll(){
		
		List<Mat_createVO> createList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from matching_create";
		
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			while(rs.next()) {
				createList.add(makeCreate(rs));
			}

			
		} catch ( SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.dbClose(conn, st, rs);
		}
		
		return createList;
		
	}
	
	// id로 방 조회 -> 추후에 sql join으로 바꿈 
	public Mat_createVO selectById(int id) {
		Mat_createVO create = new Mat_createVO();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from matching_create where mat_id=?";
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			st.setInt(1,id);
			rs = st.executeQuery();
			if(rs.next()) {
				create = makeCreate(rs);
			}
		
		} catch ( SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.dbClose(conn, st, rs);
		}
		return create;
	}
	
	public Mat_createVO makeCreate(ResultSet rs) throws SQLException {
		
		Mat_createVO mat_create = new Mat_createVO();
		mat_create.setMat_id(rs.getInt("mat_id"));
		mat_create.setMat_content(rs.getString("mat_content"));
		mat_create.setMat_people(rs.getInt("mat_people"));
		mat_create.setMat_status(rs.getString("mat_status"));
		mat_create.setMat_title(rs.getString("mat_title"));
		mat_create.setNowjoin_people(rs.getInt("nowjoin_people"));
		mat_create.setRes_number(rs.getInt("res_number"));
		
		return mat_create;
	}

}
