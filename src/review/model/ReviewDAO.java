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
			st = conn.prepareStatement(sql);
			
			st.setInt(1, review.getRes_number());
			st.setString(2, review.getReview_star());
			st.setString(3, review.getReview_content());
			//st.setString(4, review.getReview_photo());

			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.dbClose(conn, st, null);
		}
		return result;
	}
	
	//대여했던 경기장 정보
	public List<ReviewInfoVO> selectInfoReview(){
		List<ReviewInfoVO> reviewInfo = new ArrayList<>();
		String sql = "select stadium_name, sports_name, res_date, play_date"
				+ " from review"
				+ " join stadium_reservation on(stadium_reservation.res_number=review.res_number)"
				+ " join stadium on(stadium.stadium_id=stadium_reservation.stadium_id)";
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql); // prepareStatement통해서 보냄
			rs = st.executeQuery();// rs:결과 받는
			while (rs.next()) {
				reviewInfo.add(makeReviewInfo(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}
		return reviewInfo;
		
	}

	private ReviewInfoVO makeReviewInfo(ResultSet rs) throws SQLException {
		ReviewInfoVO reviewInfo = new ReviewInfoVO();
		reviewInfo.setStadium_name(rs.getString("stadium_name"));
		reviewInfo.setSports_name(rs.getString("sports_name"));
		reviewInfo.setRes_date(rs.getDate("res_date"));
		reviewInfo.setPlay_date(rs.getDate("play_date"));
		
		return reviewInfo;
	}
	
}
