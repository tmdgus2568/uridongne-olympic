package review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import uridongne.util.DBConnection;

public class ReviewListDAO {// 리뷰 대상자 거르기, 리뷰 목록 보여주기

	String path;

	public ReviewListDAO(String path) {
		this.path = path;
	}

	// 리뷰 목록
	public List<ReviewListVO> selectAllReview() {
		List<ReviewListVO> reviewList = new ArrayList<>();
		String sql = "select user_id, stadium_name, play_date, review_star, review_content, res_number"
				+ " from review join stadium_reservation using (res_number) join member using (user_id)"
				+ " join stadium using (stadium_id)" + " order by play_date desc";
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql); // prepareStatement통해서 보냄
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

	// 리뷰 쓰기 가능한 대상자:리뷰가 null이면서 경기 종료 시간은 지난 예약
	public List<ReviewInfoVO> selectPossibleReview() {
		List<ReviewInfoVO> reviewPoss = new ArrayList<>();
		String sql = "select stadium_name, sports_name, res_date, play_date, stadium_reservation.res_number"
				+ " from review"
				+ " right outer join stadium_reservation on(stadium_reservation.res_number=review.res_number)"
				+ " join stadium on(stadium.stadium_id=stadium_reservation.stadium_id)" 
				+ " where review_num is null"
				+ " and play_date<sysdate";
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql); // prepareStatement통해서 보냄
			rs = st.executeQuery();// rs:결과 받는
			while (rs.next()) {
				reviewPoss.add(makeReviewPoss(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}
		return reviewPoss;
	}

	private ReviewInfoVO makeReviewPoss(ResultSet rs) throws SQLException {
		ReviewInfoVO reviewPoss = new ReviewInfoVO();
		reviewPoss.setStadium_name(rs.getString("stadium_name"));
		reviewPoss.setSports_name(rs.getString("sports_name"));
		reviewPoss.setRes_date(rs.getDate("res_date"));
		reviewPoss.setPlay_date(rs.getDate("play_date"));
		reviewPoss.setRes_number(rs.getInt("res_number"));//지금 추가
		//System.out.println(reviewPoss);
		return reviewPoss;
	}
}
