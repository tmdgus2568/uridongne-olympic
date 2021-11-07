package matching.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import reservation.model.ReservationVO;
import uridongne.util.DBConnection;

public class MatCreateDAO {
	String path;
	
	
	public MatCreateDAO(String path) {
		this.path = path;
	}

	// 매칭 생성 방을 모두 조회한다 
	public List<MatCreateJoinVO> selectAll(){
		
		List<MatCreateJoinVO> createJoinList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
//		String sql = "select * from matching_create";
		
		// 페이징 해야됨 
		String sql = "select * from matching_create m "
				+ "inner join stadium_reservation c on m.res_number=c.res_number "
				+ "inner join stadium s on c.stadium_id=s.stadium_id where mat_status=?" ;
		
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			st.setString(1, "진행중");
			rs = st.executeQuery();
			while(rs.next()) {
				createJoinList.add(makeMatCreateJoin(rs));
			}

			
		} catch ( SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.dbClose(conn, st, rs);
		}
		
		return createJoinList;
		
	}
	
	// id로 방 조회 -> 추후에 sql join으로 바꿈 
	public MatCreateJoinVO selectById(int id) {
		MatCreateJoinVO createJoin = new MatCreateJoinVO();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from matching_create m "
				+ "inner join stadium_reservation c on m.res_number=c.res_number "
				+ "inner join stadium s on c.stadium_id=s.stadium_id where mat_id=?" ;
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			st.setInt(1,id);
			rs = st.executeQuery();
			if(rs.next()) {
				createJoin = makeMatCreateJoin(rs);
			}
		
		} catch ( SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.dbClose(conn, st, rs);
		}
		return createJoin;
	}
	
	
	// sports_name들의 집함...select에서 종목 고르게 하려고 
	// --> stadium dao로 이동해야할지도?
	public List<String> selectAllGroupBySportsName(){
		List<String> sportsNameList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select sports_name from stadium group by sports_name";
		conn = DBConnection.dbConnect(path);
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()) {
				sportsNameList.add(rs.getString("sports_name"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.dbClose(conn, st, rs);
		}
		return sportsNameList;
	}
	
	// 필터 
	public List<MatCreateJoinVO> selectByFilter(String sports, String option, String filter) {
		List<MatCreateJoinVO> createJoinList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from matching_create m "
				+ "inner join stadium_reservation c on m.res_number=c.res_number "
				+ "inner join stadium s on c.stadium_id=s.stadium_id where ";
		if(!sports.equals("none")) {
			sql += "sports_name='"+sports+"' ";
			
			if(option.equals("title")) sql += "and mat_title like '%"+filter+"%'";
			else if(option.equals("content")) sql += "and mat_content like '%"+filter+"%'";
		}
		else {
			if(option.equals("title")) sql += "mat_title like '%"+filter+"%'";
			else if(option.equals("content")) sql += "mat_content like '%"+filter+"%'";
		}
		
//		System.out.println(sql);
		
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			while(rs.next()) {
				createJoinList.add(makeMatCreateJoin(rs));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.dbClose(conn, st, rs);
		}
		return createJoinList;
	}
	
	// 매칭 방을 만든다 
	public int insertCreateAndRes(MatCreateVO create, ReservationVO reservation) {
		Connection conn = null;
		CallableStatement st = null;
		
		int result = 0;
		
 /*	    I_STADIUM_ID in date,
	    I_USER_ID in varchar2,
	    I_PLAY_DATE in date,
	    I_PLAY_START in varchar2,
	    I_PLAY_END in varchar2,
	    I_STADIUM_PRICE in number,
	    I_MAT_PEOPLE in number,
	    I_MAT_TITLE in varchar2,
	    I_MAT_CONTENT in varchar2  */
		
		
		try {
			conn = DBConnection.dbConnect(path);
			st = conn.prepareCall("{call matching_create_proc(?,?,?,?,?,?,?,?,?)}");
			
			System.out.println(reservation.getStadium_id());
			System.out.println(reservation.getUser_id());
			System.out.println(reservation.getStadium_price());
			System.out.println(create.getMat_people());
			System.out.println(create.getMat_title());
			System.out.println(create.getMat_content());
			
			
			st.setString(1, reservation.getStadium_id());
			st.setString(2, reservation.getUser_id());
			st.setDate(3, reservation.getPlay_date());
			st.setString(4, reservation.getPlay_start());
			st.setString(5, reservation.getPlay_end());
			st.setInt(6, reservation.getStadium_price());
			st.setInt(7, create.getMat_people());
			st.setString(8, create.getMat_title());
			st.setString(9, create.getMat_content());
		
		
			
			result = st.executeUpdate();
			
			return result;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.dbClose(conn, st, null);
		}
		
		try {
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
		
	}
	
	
	public MatCreateVO makeCreate(ResultSet rs) throws SQLException {
		
		MatCreateVO matCreate = new MatCreateVO();
		matCreate.setMat_id(rs.getInt("mat_id"));
		matCreate.setMat_content(rs.getString("mat_content"));
		matCreate.setMat_people(rs.getInt("mat_people"));
		matCreate.setMat_status(rs.getString("mat_status"));
		matCreate.setMat_title(rs.getString("mat_title"));
		matCreate.setNowjoin_people(rs.getInt("nowjoin_people"));
		matCreate.setRes_number(rs.getInt("res_number"));
		
		return matCreate;
	}
	
	public MatCreateJoinVO makeMatCreateJoin(ResultSet rs) throws SQLException {
		MatCreateJoinVO mcrs = new MatCreateJoinVO();
		
		mcrs.setMat_id(rs.getInt("mat_id"));
		mcrs.setMat_content(rs.getString("mat_content"));
		mcrs.setMat_people(rs.getInt("mat_people"));
		mcrs.setMat_status(rs.getString("mat_status"));
		mcrs.setMat_title(rs.getString("mat_title"));
		mcrs.setNowjoin_people(rs.getInt("nowjoin_people"));
		mcrs.setRes_number(rs.getInt("res_number"));
		
		mcrs.setStadium_id(rs.getString("stadium_id"));
		mcrs.setUser_id(rs.getString("user_id"));
		mcrs.setRes_date(rs.getDate("res_date"));
		mcrs.setPlay_date(rs.getDate("play_date"));
		mcrs.setPlay_start(rs.getString("play_start"));
		mcrs.setPlay_end(rs.getString("play_end"));
		mcrs.setStadium_price(rs.getInt("stadium_price"));
		mcrs.setRes_status(rs.getString("res_status"));
		mcrs.setMatching(rs.getInt("matching"));
		
		mcrs.setStadium_name(rs.getString("stadium_name"));
		mcrs.setSports_name(rs.getString("sports_name"));
		mcrs.setPayment_method(rs.getString("payment_method"));
		mcrs.setStadium_address(rs.getString("stadium_address"));
		mcrs.setStadium_phone(rs.getString("stadium_phone"));
		mcrs.setStadium_start(rs.getString("stadium_start"));
		mcrs.setStadium_end(rs.getString("stadium_end"));
		mcrs.setStadium_photo(rs.getString("stadium_photo"));
		mcrs.setMat_max(rs.getInt("mat_max"));
		mcrs.setAddress_x(rs.getString("address_x"));
		mcrs.setAddress_y(rs.getString("address_y"));
		mcrs.setLocation(rs.getString("location"));
		
		System.out.println(mcrs);
		
		return mcrs;
	}
	
	

}
