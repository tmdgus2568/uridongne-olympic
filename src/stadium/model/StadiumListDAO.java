package stadium.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import uridongne.util.DBConnection;

public class StadiumListDAO {
	String path;
	static final String SQL_SELECT_ALL = "select distinct stadium_name, payment_method, stadium_number, sports_name from stadium order by 1";
	static final String SQL_SELECT_sports = "select stadium_name, payment_method, stadium_number, STADIUM_ADDRESS "
			+ " from stadium where sports_name = ? and stadium_address like ? "
			+ " order by 1";
	
	
	public StadiumListDAO(String path) {
		this.path=path;
	}
	//전체 경기장정보 리스트(필터전)
	public List<StadiumListVO> selectAll() {
		List<StadiumListVO> stadiumList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			conn=DBConnection.dbConnect(path);
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
		stadium.setStadium_name(rs.getString("stadium_name"));
		stadium.setPayment_method(rs.getString("payment_method"));
		stadium.setStadium_number(rs.getInt("stadium_number"));
		stadium.setSports_name(rs.getString("sports_name"));
		return stadium;
	}
	
	//전체 경기장정보: 종목 및 지역 필터 리스트 
	public List<StadiumListVO> selectSports(String sports_name, String stadium_address) {
		List<StadiumListVO> stadiumsprt = new ArrayList<>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			conn=DBConnection.dbConnect(path);
			st = conn.prepareStatement(SQL_SELECT_sports);
			st.setString(1, sports_name);
			st.setString(2, "%"+stadium_address+"%");
			rs = st.executeQuery();
			while (rs.next()) {
				stadiumsprt.add( makeEmp2(rs));
				System.out.println(rs.getString("stadium_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}
		return stadiumsprt;
	}
	private StadiumListVO makeEmp2(ResultSet rs) throws SQLException {
		StadiumListVO stadium=new StadiumListVO();
		stadium.setStadium_name(rs.getString("stadium_name"));
		stadium.setPayment_method(rs.getString("payment_method"));
		stadium.setStadium_number(rs.getInt("stadium_number"));
		stadium.setStadium_address(rs.getString("stadium_address"));
		return stadium;
	}
}
