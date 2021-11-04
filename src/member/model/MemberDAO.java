package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import uridongne.util.DBConnection;

public class MemberDAO {

	String path;

	public MemberDAO(String path) {
		this.path = path;
	}

	public int memberInsert(MemberVO mem) {
		int result = 0; // insert 건수
		String sql = "insert into member values (?,?,?,?,?,?,?,?,?,sysdate,?)";
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
		
		String sql = "update member" + " set user_name = ?" + ", user_birth = ?"
				+ ", user_email = ?" + ", user_phone = ?" + ", user_state = ?" + ", user_interest = ?"
				+ " where user_id = ?";

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


}
