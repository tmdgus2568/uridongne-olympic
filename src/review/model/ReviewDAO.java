package review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import uridongne.util.DBConnection;

public class ReviewDAO {

	String path;

	public ReviewDAO(String path) {
		this.path = path;
	}	

	//리뷰 입력
	public int reviewInsert(ReviewVO review) {
		String sql = "insert into review(review_num, res_number, review_date, review_star, review_content)"
				+ " values(review_seq.nextval, ?, sysdate, ?, ?)";
		Connection conn = null;
		PreparedStatement st = null;
		int result = 0;
		try {
			conn = DBConnection.dbConnect(path);
			conn.setAutoCommit(false);
			st = conn.prepareStatement(sql);
			
			st.setInt(1, review.getRes_number());
			st.setString(2, review.getReview_star());
			st.setString(3, review.getReview_content());
			//st.setString(4, review.getReview_photo());

			result = st.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.dbClose(conn, st, null);
		}
		return result;
	}
	
	
	
}
