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
		String reservedListSql = "select substr(play_start,1,2) stime, substr(play_end,1,2) etime "
				+ "from stadium_reservation " + "where play_date = to_date(?,'yyyy/mm/dd') " + "and stadium_id = ?";
		// 선택한 지역에 있는 경기장 정보 가져오기
		String stadiumListSql = "select stadium_name, sports_name, stadium_id, stadium_number, "
				+ "stadium_start, stadium_end, payment_method " + "from stadium "
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
	
	//가져온 예약정보 DB에 insert하기
	public int insertReserveInfo(ReservationVO reservation) {
		
		int result = 0; // insert 건수
		
		String sql = "insert into stadium_reservation "
				+ "values(stadium_reservation_seq.nextval, ?, ?, localtimestamp, "
				+ "?, ?, ?, ?, ?, ?)";

		Connection conn = null;
		PreparedStatement st = null;

		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			
			st.setString(1, reservation.getStadium_id());
			st.setString(2, reservation.getUser_id());
			st.setDate(3, reservation.getPlay_date());
			st.setString(4, reservation.getPlay_start());
			st.setString(5, reservation.getPlay_end());
			st.setInt(6, reservation.getStadium_price());
			st.setString(7, reservation.getRes_status());
			st.setInt(8, reservation.getMatching());
			
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, null);
		}
		
		return result;
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

}
