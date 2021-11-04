package reservation.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import uridongne.util.DBConnection;

public class ReservationDAO {

	String path;

	public ReservationDAO(String path) {
		this.path = path;
	}

	// 종목에 따른 경기장지역 조회
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
			while (rs.next()) {
				regionList.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}

		return regionList;
	}

	// 종목&지역&날짜에 따른 경기장 및 예약시간 조회
	public List<AvailStadiumVO> getStadiumByDate(String sports_name, String region, String datepicker) {

		// 선택한 경기장&날짜에 예약된 리스트 가져오기
		String reservedListSql = "select to_char(PLAY_START,'hh24') stime, to_char(PLAY_END,'hh24') etime "
				+ "from stadium_reservation " + "where PLAY_DATE = to_date(?,'yyyy/mm/dd') " + "and stadium_id = ?";
		// 선택한 지역에 있는 경기장 정보 가져오기
		String stadiumListSql = "select stadium_name, SPORTS_NAME, STADIUM_ID, STADIUM_number, "
				+ "stadium_start, stadium_end, payment_method " + "from STADIUM "
				+ "where sports_name = ? and location = ? order by stadium_name";

		List<AvailStadiumVO> stadiumList = new ArrayList<>();

		Connection conn = null;
		PreparedStatement st = null, st2 = null;
		ResultSet rs = null, rs2 = null;

		try {
			conn = DBConnection.dbConnect(path);
			// sql에서 읽어온 경기장 정보들을 stadiumList에 저장
			st = conn.prepareStatement(stadiumListSql);
			st.setString(1, sports_name);
			st.setString(2, region);
			rs = st.executeQuery();
			while (rs.next()) {
				AvailStadiumVO vo = makeAvailStadium(rs);
				stadiumList.add(vo);
			}

			// reservedListSql를 통해 예약시간정도를 stadiumList에 Map형식으로 저장
			st2 = conn.prepareStatement(reservedListSql);
			for (AvailStadiumVO stadium : stadiumList) {
				st2.setString(1, datepicker);
				st2.setString(2, stadium.getStadium_id());
				rs2 = st2.executeQuery();
				ArrayList<Map<String, Integer>> reservedlist = new ArrayList<>();
				while (rs2.next()) {
					Map<String, Integer> timeMap = new HashMap<>();
					// 예약 시작시간과 끝시간을 int형태로 map에 put
					timeMap.put("stime", Integer.parseInt(rs2.getString(1)));
					timeMap.put("etime", Integer.parseInt(rs2.getString(2))-1);
					reservedlist.add(timeMap);
				}
				stadium.setReservedList(reservedlist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(null, st, rs);
			DBConnection.dbClose(conn, st2, rs2);
		}
		System.out.println(stadiumList);

		return stadiumList;
	}

	private AvailStadiumVO makeAvailStadium(ResultSet rs) throws SQLException {

		AvailStadiumVO stadium = new AvailStadiumVO();

		stadium.setPayment_method(rs.getString("payment_method"));
		stadium.setSports_name(rs.getString("sports_name"));
		stadium.setStadium_end(rs.getString("stadium_end"));
		stadium.setStadium_id(rs.getString("stadium_id"));
		stadium.setStadium_name(rs.getString("stadium_name"));
		stadium.setStadium_start(rs.getString("stadium_start"));
		stadium.setStadium_number(rs.getInt("stadium_number"));

		return stadium;
	}

//	public List<AvailStadiumVO> getAvailTime(String sports_name, String region, String datepicker) {
//		// 해당 날짜/지역/종목에 따른 시간리스트
//		List<AvailStadiumVO> timeList = new ArrayList<>();
//		
//		String sql = "select   to_char(PLAY_START,'hh24') stime, to_char(PLAY_END,'hh24') etime "
//				+ "from stadium_reservation "
//				+ "where PLAY_DATE = to_date(?,'yyyy/mm/dd') "
//				+ "and stadium_id = ?";
//				
//		Connection conn = null;
//		PreparedStatement st = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = DBConnection.dbConnect(path);
//			st = conn.prepareStatement(sql);
//			//수정필요
//			st.setString(1, sports_name);
//			st.setString(2, region);
////			st.setString(3, datepicker);
//			rs = st.executeQuery();
//			while(rs.next()) {
//				timeList.add(makeAvailStadium(rs));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.dbClose(conn, st, rs);
//		}
//		
//		return timeList;
//	}

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
