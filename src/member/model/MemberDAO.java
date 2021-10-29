package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
			st.setInt(4, mem.getUser_birth());
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

}
