package stadium.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import uridongne.util.DBConnection;

public class StadiumListDAO {
	static final String SQL_SELECT_ALL = "select stadium_id, stadium_name, sports_name from stadium";
	public List<StadiumListVO> selectAll() {
		List<StadiumListVO> stadiumList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = conn.prepareStatement(SQL_SELECT_ALL);
			rs = st.executeQuery();
			while (rs.next()) {
				stadiumList.add( makeEmp1(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}
		return stadiumList;
	}
	private StadiumListVO makeEmp1(ResultSet rs) throws SQLException {
		StadiumListVO stadium=new StadiumListVO();
		stadium.setStadium_id(rs.getString("stadium_id"));
		stadium.setStadium_name(rs.getString("stadium_name"));
		stadium.setSports_name(rs.getString("sports_name"));
		return stadium;
	}
}
