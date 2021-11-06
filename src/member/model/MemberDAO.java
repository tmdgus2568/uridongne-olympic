package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import matching.model.MatCreateJoinVO;
import matching.model.MatCreateVO;
import review.model.ReviewInfoVO;
import review.model.ReviewListVO;
import uridongne.util.DBConnection;

public class MemberDAO {

	String path;

	public MemberDAO(String path) {
		this.path = path;
	}

	public int memberInsert(MemberVO mem) {
		int result = 0; // insert 건수
		String sql = "insert into member values (?,?,?,?,?,?,?,?,?,LOCALTIMESTAMP,?)";
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBConnection.dbConnect(path);
			st = con.prepareStatement(sql);

			st.setString(1, mem.getUser_id());
			st.setString(2, mem.getUser_pw());
			st.setString(3, mem.getUser_name());
			st.setDate(4, mem.getUser_birth());
			st.setString(5, mem.getUser_email());
			st.setInt(6, mem.getUser_phone());
			st.setString(7, mem.getUser_city());
			st.setString(8, mem.getUser_state());
			st.setString(9, mem.getUser_interest());
			st.setString(10, mem.getLogin_platform());

			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(con, st, null);
		}

		return result;
	}

	public MemberVO kakaoLoginCheck(String user_id) {
		MemberVO member = null; // member가 있는지
		// 지역변수는 초기화 하지 않으면 사용할 수 없다.
		String sql = "select * from member where user_id=?"; // casting 안해도 되나봄

		PreparedStatement st = null; // ?를 활용하면 PreparedStatement!
		Connection con = null;
		ResultSet rs = null;

		try {
			con = DBConnection.dbConnect(path);
			st = con.prepareStatement(sql); // sql문을 준비한다.
			st.setString(1, user_id);
			rs = st.executeQuery(); // 실행만 한다. (sql 넣지 않음)

			while (rs.next()) {
				member = makeMem(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(con, st, null);
		}

		return member;
	}

	public MemberVO generalLoginCheck(String user_id, String user_pw) {
		MemberVO member = null; // member가 있는지
		// 지역변수는 초기화 하지 않으면 사용할 수 없다.
		String sql = "select * from member where user_id = ? and user_pw = ?"; // casting 안해도 되나봄

		PreparedStatement st = null; // ?를 활용하면 PreparedStatement!
		Connection con = null;
		ResultSet rs = null;

		try {
			con = DBConnection.dbConnect(path);
			st = con.prepareStatement(sql); // sql문을 준비한다.
			st.setString(1, user_id);
			st.setString(2, user_pw);
			rs = st.executeQuery(); // 실행만 한다. (sql 넣지 않음)

			while (rs.next()) {
				member = makeMem(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(con, st, null);
		}

		return member;
	}

	public int updateMember(MemberVO mem) {
		int result = 0; // update 건수

		String sql = "update member" + " set user_name = ?" + ", user_birth = ?" + ", user_email = ?"
				+ ", user_phone = ?" + ", user_state = ?" + ", user_interest = ?" + " where user_id = ?";

		PreparedStatement st = null; // ?를 활용하면 PreparedStatement!
		Connection con = null;

		try {
			con = DBConnection.dbConnect(path);
			st = con.prepareStatement(sql); // sql문을 준비한다.

			st.setString(1, mem.getUser_name());
			st.setDate(2, mem.getUser_birth());
			st.setString(3, mem.getUser_email());
			st.setInt(4, mem.getUser_phone());
			st.setString(5, mem.getUser_state());
			st.setString(6, mem.getUser_interest());
			st.setString(7, mem.getUser_id());

			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(con, st, null);
		}
		return result;
	}

	private MemberVO makeMem(ResultSet rs) throws SQLException {
		MemberVO emp = new MemberVO();

		emp.setUser_id(rs.getString("user_id"));
		emp.setUser_pw(rs.getString("user_pw"));
		emp.setUser_name(rs.getString("user_name"));
		emp.setUser_birth(rs.getDate("user_birth"));
		emp.setUser_email(rs.getString("user_email"));
		emp.setUser_phone(rs.getInt("user_phone"));
		emp.setUser_city(rs.getString("user_city"));
		emp.setUser_state(rs.getString("user_state"));
		emp.setUser_interest(rs.getString("user_interest"));
		emp.setSignupdate(rs.getDate("signupdate"));
		emp.setLogin_platform(rs.getString("login_platform"));
		return emp;
	}

	public List<MatCreateJoinVO> matchingCreateInfo(String user_id) {
		List<MatCreateJoinVO> matList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		String sql = "select c.*, d.*, s.user_id, s.play_date from matching_create c join stadium_reservation s on (c.res_number = s.res_number)"
				+ " join stadium d on (s.stadium_id = d.stadium_id) where s.user_id = ?";

		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			st.setString(1, user_id);
			rs = st.executeQuery();
			while (rs.next()) {
				matList.add(makeCreateInfo(rs));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}

		return matList;
	}

	public MatCreateJoinVO makeCreateInfo(ResultSet rs) throws SQLException {

		MatCreateJoinVO matCreate = new MatCreateJoinVO();
		matCreate.setMat_id(rs.getInt("mat_id"));
		matCreate.setMat_content(rs.getString("mat_content"));
		matCreate.setMat_people(rs.getInt("mat_people"));
		matCreate.setNowjoin_people(rs.getInt("nowjoin_people"));
		matCreate.setMat_status(rs.getString("mat_status"));
		matCreate.setSports_name(rs.getString("sports_name"));
		matCreate.setLocation(rs.getString("location"));
		matCreate.setMat_title(rs.getString("mat_title"));
		matCreate.setPlay_date(rs.getDate("play_date"));
		matCreate.setRes_number(rs.getInt("res_number"));

		return matCreate;
	}

	public List<ReviewListVO> reviewInfo(String user_id) {
		List<ReviewListVO> reviewList = new ArrayList<>();
		String sql = "select stadium_name, play_date, review_star, review_content, res_number"
				+ " from review join stadium_reservation using (res_number) join member using (user_id)"
				+ " join stadium using (stadium_id) where user_id = ? order by play_date desc";
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql); // prepareStatement통해서 보냄
			st.setString(1, user_id);
			rs = st.executeQuery();
			while (rs.next()) {
				reviewList.add(makeReview(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}

		return reviewList;
	}

	private ReviewListVO makeReview(ResultSet rs) throws SQLException {
		ReviewListVO review = new ReviewListVO();
		review.setStadium_name(rs.getString("stadium_name"));
		review.setPlay_date(rs.getDate("play_date"));
		review.setReview_star(rs.getString("review_star"));
		review.setReview_content(rs.getString("review_content"));
		review.setRes_number(rs.getInt("res_number"));
		return review;
	}

	public List<ResInfoVO> resInfo(String user_id) {
		List<ResInfoVO> resList = new ArrayList<>();
		String sql = "select * from stadium_reservation r join stadium s " + "on (r.stadium_id = s.stadium_id) "
				+ "where user_id = ? and matching = 0";
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql); // prepareStatement통해서 보냄
			st.setString(1, user_id);
			rs = st.executeQuery();
			while (rs.next()) {
				resList.add(makeRes(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}

		return resList;
	}

	private ResInfoVO makeRes(ResultSet rs) throws SQLException {
		ResInfoVO res = new ResInfoVO();
		
		res.setRes_number(rs.getInt("res_number"));
		res.setStadium_id(rs.getString("stadium_id"));
		res.setRes_date(rs.getDate("res_date"));
		res.setPlay_date(rs.getDate("play_date"));
		res.setPlay_start(rs.getString("play_start"));
		res.setPlay_end(rs.getString("play_end"));
		res.setStadium_price(rs.getInt("stadium_price"));
		res.setRes_status(rs.getString("res_status"));
		res.setMatching(rs.getInt("matching"));

		res.setStadium_name(rs.getString("stadium_name"));
		res.setSports_name(rs.getString("sports_name"));
		res.setAddress_x(rs.getString("address_x"));
		res.setAddress_y(rs.getString("address_y"));
		res.setStadium_phone(rs.getString("stadium_phone"));
		
		return res;
	}

	public List<MatCreateJoinVO> matchingApplyInfo(String user_id) {
		List<MatCreateJoinVO> appList = new ArrayList<>();
		String sql = "select *"
				+ " from matching_apply a"
				+ " join matching_create c on (a.mat_id = c.mat_id)"
				+ " join stadium_reservation s on (c.res_number = s.res_number)"
				+ " join stadium d on (s.stadium_id = d.stadium_id)"
				+ " where a.user_id =?";
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql); // prepareStatement통해서 보냄
			st.setString(1, user_id);
			rs = st.executeQuery();
			while (rs.next()) {
				appList.add(makeApp(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}

		return appList;
	}
	
	private MatCreateJoinVO makeApp(ResultSet rs) throws SQLException {
		
		MatCreateJoinVO matApply = new MatCreateJoinVO();
		matApply.setMat_id(rs.getInt("mat_id"));
		matApply.setMat_content(rs.getString("mat_content"));
		matApply.setMat_people(rs.getInt("mat_people"));
		matApply.setNowjoin_people(rs.getInt("nowjoin_people"));
		matApply.setMat_status(rs.getString("mat_status"));
		matApply.setSports_name(rs.getString("sports_name"));
		matApply.setLocation(rs.getString("location"));
		matApply.setMat_title(rs.getString("mat_title"));
		matApply.setPlay_date(rs.getDate("play_date"));
		matApply.setRes_number(rs.getInt("res_number"));
		matApply.setStadium_price(rs.getInt("together"));	//stadium에 담아버리기
		
		return matApply;
	}

	public int cancelMatching(int mat_id) {
		int result = 0; // update 건수

		String sql = "update matching_create set mat_status = '취소' where mat_id = ?";

		PreparedStatement st = null; // ?를 활용하면 PreparedStatement!
		Connection con = null;

		try {
			con = DBConnection.dbConnect(path);
			st = con.prepareStatement(sql); // sql문을 준비한다.

			st.setInt(1, mat_id);
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(con, st, null);
		}
		return result;
	}

}
