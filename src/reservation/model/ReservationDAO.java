package reservation.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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
		String sql = "select location from stadium where sports_name = ? and location is not null";
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			st.setString(1, sports);
			rs = st.executeQuery();
			while(rs.next()) {
				regionList.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}
		
		return regionList;
	}

	// 날짜/종목/지역 기준 경기장 조회 (수정필요)
	public List<AvailStadiumVO> getStadiumByDate(String sports_name, String region, String datepicker) {
		// 해당 날짜/지역/종목에 따른 구장리스트 + 상세정보
		List<AvailStadiumVO> stadiumList = new ArrayList<>();
		String sql = "select s.stadium_name, s.SPORTS_NAME, s.STADIUM_ID, s.STADIUM_number, r.user_id, "
				+ "s.stadium_start, s.stadium_end, s.payment_method, r.STADIUM_PRICE "
				+ "from STADIUM s left outer JOIN stadium_reservation r ON (s.STADIUM_ID = r.STADIUM_ID) "
				+ "where s.sports_name = ? and s.location = ? order by stadium_name";
				
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			//수정필요
			st.setString(1, sports_name);
			st.setString(2, region);
//			st.setString(3, datepicker);
			rs = st.executeQuery();
			while(rs.next()) {
				stadiumList.add(makeAvailStadium(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}
		
		return stadiumList;
	}


	public List<AvailStadiumVO> getAvailTime(String sports_name, String region, String datepicker) {
		// 해당 날짜/지역/종목에 따른 시간리스트
		List<AvailStadiumVO> timeList = new ArrayList<>();
		
		String sql = "select s.stadium_name, s.SPORTS_NAME, s.STADIUM_ID, s.STADIUM_number, r.user_id, "
				+ "s.stadium_start, s.stadium_end, s.payment_method, r.STADIUM_PRICE "
				+ "from STADIUM s left outer JOIN stadium_reservation r ON (s.STADIUM_ID = r.STADIUM_ID) "
				+ "where s.sports_name = ? and s.location = ? order by stadium_name";
				
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			//수정필요
			st.setString(1, sports_name);
			st.setString(2, region);
//			st.setString(3, datepicker);
			rs = st.executeQuery();
			while(rs.next()) {
				timeList.add(makeAvailStadium(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}
		
		return timeList;
	}
	
	private AvailStadiumVO makeAvailStadium(ResultSet rs) throws SQLException {
		
		AvailStadiumVO stadium = new AvailStadiumVO();
		
		stadium.setPayment_method(rs.getString("payment_method"));
		stadium.setSports_name(rs.getString("sports_name"));
		stadium.setStadium_end(rs.getString("stadium_end"));
		stadium.setStadium_id(rs.getString("stadium_id"));
		stadium.setStadium_name(rs.getString("stadium_name"));
		stadium.setStadium_price(rs.getInt("stadium_price"));
		stadium.setStadium_start(rs.getString("stadium_start"));
		stadium.setUser_id(rs.getString("user_id"));
		stadium.setStadium_number(rs.getInt("stadium_number"));
		
		return stadium;
	}
	
//	to_number(substr(stadium_start, 0, 2))
	

//	private ReservationVO makeCreate(ResultSet rs) throws SQLException {
//		
//		ReservationVO region = new ReservationVO();
//		
//		r
//		region.setMatching(rs.getInt("matching"));
//		region.setPlay_date(rs.getDate("play_date"));
//		region.setPlay_end(rs.getString("play_end"));
//		regionList.setPlay_start(rs.getString("play_start"));
//		regionList.setRes_date(rs.getDate("res_date"));
//		regionList.setRes_number(rs.getInt("res_number"));
//		regionList.setRes_status(rs.getString("res_status"));
//		regionList.setStadium_id(rs.getString("stadium_id"));
//		regionList.setStadium_price(rs.getInt("stadium_price"));
//		regionList.setUser_id(rs.getString("user_id"));
//		
//		return regionList;
//	}
//	// 예약정보 DB에 저장
//	public int reservationInsert(ReservationVO) {
//		
//	}
}
