package reservation.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import uridongne.util.DBConnection;

public class ReservationDAO {

	String path;
	
	public ReservationDAO(String path) {
		this.path = path;
	}
	
	// 종목 기준 경기장 지역 조회
	public Set<String> selectBySports(String sports) {
		Set<String> regionList = new HashSet<String>();
		String sql = "select stadium_address from stadium where sports_name = ? and stadium_address is not null";
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			st.setString(1, sports);
			rs = st.executeQuery();
			while(rs.next()) {
				regionList.add(rs.getString(1).split(" ")[1]);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}
		
		return regionList;
	}

	// 날짜/종목/지역 기준 경기장 조회 (수정필요)
	public Object getStadiumByDate(String sports_name, String datepicker, String region) {
		// 해당 날짜/지역/종목에 따른 구장리스트 + 예약가능한 시간대 + 유무료  > return 타입 정할 수 있음
		//수정필요
		Set<String> regionList = new HashSet<String>();
		String sql = "select stadium_address from stadium where sports_name = ? and stadium_address is not null";
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			//수정필요
			st.setString(1, sports_name);
			st.setString(2, datepicker);
			st.setString(3, region);
			rs = st.executeQuery();
			while(rs.next()) {
				regionList.add(rs.getString(1).split(" ")[1]);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}
		
		return regionList;
	}
	

	private ReservationVO makeCreate(ResultSet rs) throws SQLException {
		
		ReservationVO regionList = new ReservationVO();
		
		regionList.setMatching(rs.getInt("matching"));
		regionList.setPlay_date(rs.getDate("play_date"));
		regionList.setPlay_end(rs.getString("play_end"));
		regionList.setPlay_start(rs.getString("play_start"));
		regionList.setRes_date(rs.getDate("res_date"));
		regionList.setRes_number(rs.getInt("res_number"));
		regionList.setRes_status(rs.getString("res_status"));
		regionList.setStadium_id(rs.getString("stadium_id"));
		regionList.setStadium_price(rs.getInt("stadium_price"));
		regionList.setUser_id(rs.getString("user_id"));
		
		return regionList;
	}
//	// 예약정보 DB에 저장
//	public int reservationInsert(ReservationVO) {
//		
//	}
}
