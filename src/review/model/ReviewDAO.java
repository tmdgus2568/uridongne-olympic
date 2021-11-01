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
	
	//리뷰 대상자:리뷰는 쓰지 않은 예약
	//public List<Sta>
	
	
	// 리뷰 저장
	public int reviewInsert(ReviewVO review) {
		String sql = "insert into review(review_num, res_number, review_date, review_star, review_content, review_photo)"
				+ " values(review_seq.nextval, ?, sysdate, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement st = null;
		int result = 0;
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			
			st.setInt(1, review.getRes_number());
			st.setString(2, review.getReview_star());
			st.setString(3, review.getReview_content());
			st.setString(4, review.getReview_photo());

			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.dbClose(conn, st, null);
		}
		return result;

	}

	// 리뷰 목록에 나타내기
	public List<ReviewListVO> selectAllReview() {
		List<ReviewListVO> reviewList = new ArrayList<>();
		String sql = "select user_id, stadium_name, play_date, review_star, review_content, res_number"
				+ " from review join stadium_reservation using (res_number) join member using (user_id)"
				+ " join stadium using (stadium_id)"
				+ " order by play_date desc";
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql); // Statement통해서 보냄
			rs = st.executeQuery();// rs:결과 받는
			while (rs.next()) {
				reviewList.add(makeReview(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}

		return reviewList;
	}

	private ReviewListVO makeReview(ResultSet rs) throws SQLException {
		ReviewListVO review = new ReviewListVO();
		review.setUser_id(rs.getString("user_id"));
		review.setStadium_name(rs.getString("stadium_name"));
		review.setPlay_date(rs.getDate("play_date"));
		review.setReview_content(rs.getString("review_content"));
		review.setReview_star(rs.getString("review_star"));
		review.setRes_number(rs.getInt("res_number"));
		// review.setReview_photo(rs.getString("review_photo"));
		return review;
	}
}
