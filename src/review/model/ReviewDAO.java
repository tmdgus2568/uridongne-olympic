package review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import uridongne.util.DBConnection;

public class ReviewDAO {
	public void reviewInsert(ReviewVO review) {
	String sql="insert into review values(review_seq.nextval,?,sysdate,?,?,?)";
	Connection conn = DBConnection.dbConnect();
	PreparedStatement st = null;
	int result = 0;
	
	}
	
	public List<ReviewVO> selectAllReview(){
		List<ReviewVO> reviewlist = new ArrayList<ReviewVO>();
		String sql = "select * from review order by 1";
		Connection conn = DBConnection.dbConnect();
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			st = conn.prepareStatement(sql); //Statement통해서 보냄
			rs = st.executeQuery(sql);// rs:결과 받는
			while (rs.next()) {
				reviewlist.add(makeReview(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}
		
		return reviewlist;
	}

	private ReviewVO makeReview(ResultSet rs) throws SQLException {
		ReviewVO review = new ReviewVO();
		review.setReview_num(rs.getInt("review_num"));
		review.setRes_number(rs.getInt("res_number"));
		review.setReview_date(rs.getDate("review_date"));
		review.setReview_star(rs.getInt("review_star"));
		review.setReview_content(rs.getString("review_content"));
		review.setReview_photo(rs.getString("review_photo"));
		return review;
	} 
}
