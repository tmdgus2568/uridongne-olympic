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
	
	
	static final String SQL_SELECT_ALL = "select stadium_id, stadium_name, payment_method, "
			+ " stadium_number, sports_name, location "
			+ " from stadium "
			+ " order by 1";
	
	
	static final String SQL_SELECT_sports = "select stadium_id, stadium_name, payment_method, "
			+ " stadium_number, sports_name, location "
			+ " from stadium where sports_name = ? and location like ? "
			+ " order by 1";
	
	
	static final String SQL_SELECT_Address = "select address_x, address_y, stadium_address "
			+ " from stadium ";
	
	/*
	 * static final String SQL_SELECT_Detail = "select s.*, v.review_star" +
	 * " from stadium s inner join stadium_reservation r on s.stadium_id=r.stadium_id"
	 * + " inner join review v on r.res_number=v.res_number" +
	 * " where s.stadium_id = ? " + "	order by 1";
	 */
			
	static final String SQL_SELECT_Detail =	"select * from stadium s join (select s.stadium_id, avg(v.review_star) as review_star"
			+ " from stadium s left join stadium_reservation r on s.stadium_id=r.stadium_id"
			+ " left join review v on r.res_number=v.res_number"
			+ " group by s.stadium_id) v on (s.stadium_id = v.stadium_id)"
			+ " where s.stadium_id = ?";
			
	
	static final String SQL_SELECT_review = "select s.stadium_id, s.stadium_name, v.*, r.user_id"
			+ " from stadium s inner join stadium_reservation r on s.stadium_id=r.stadium_id "
			+ " inner join review v on r.res_number=v.res_number "
			+ " where s.stadium_id  = ? ";
	
	
 
	public StadiumListDAO(String path) {
		this.path=path;
	}
	
	
	//전체 경기장정보 리스트(필터전 전체 화면)
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
				stadiumList.add( make1(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}
		return stadiumList;
	}
	private StadiumListVO make1(ResultSet rs) throws SQLException {
		StadiumListVO stadium=new StadiumListVO();
		stadium.setStadium_id(rs.getString("stadium_id"));
		stadium.setStadium_name(rs.getString("stadium_name"));
		stadium.setPayment_method(rs.getString("payment_method"));
		stadium.setStadium_number(rs.getInt("stadium_number"));
		stadium.setSports_name(rs.getString("sports_name"));
		stadium.setLocation(rs.getString("location"));
		return stadium;
	}
	
	
	
	//전체 경기장정보: 종목 및 지역 필터 리스트 
	public List<StadiumListVO> selectSports(String sports_name, String location) {
		List<StadiumListVO> stadiumsprt = new ArrayList<>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			conn=DBConnection.dbConnect(path);
			st = conn.prepareStatement(SQL_SELECT_sports);
			st.setString(1, sports_name);
			st.setString(2, "%"+location+"%");
			rs = st.executeQuery();
			while (rs.next()) {
				stadiumsprt.add( make2(rs));
				//System.out.println(rs.getString("stadium_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.dbClose(conn, st, rs);
		}
		return stadiumsprt;
	}
	private StadiumListVO make2(ResultSet rs) throws SQLException {
		StadiumListVO stadium=new StadiumListVO();
		stadium.setStadium_id(rs.getString("stadium_id"));
		stadium.setStadium_name(rs.getString("stadium_name"));
		stadium.setPayment_method(rs.getString("payment_method"));
		stadium.setStadium_number(rs.getInt("stadium_number"));
		stadium.setSports_name(rs.getString("sports_name"));
		stadium.setLocation(rs.getString("location"));
		return stadium;
	}
	
	
	//주소 가져오기: x, y좌표, 주소
		public List<StadiumListVO> selectAddress() {
			List<StadiumListVO> stadiumadr = new ArrayList<>();
			Connection conn = null;
			PreparedStatement st = null;
			ResultSet rs = null;
			try {
				conn=DBConnection.dbConnect(path);
				st = conn.prepareStatement(SQL_SELECT_Address);
				//st.setString(1, sports_name);
				//st.setString(2, "%"+location+"%");
				rs = st.executeQuery();
				while (rs.next()) {
					stadiumadr.add( make3(rs));
					//System.out.println(rs.getString("stadium_name"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnection.dbClose(conn, st, rs);
			}
			return stadiumadr;
		}
		private StadiumListVO make3(ResultSet rs) throws SQLException {
			StadiumListVO stadium=new StadiumListVO();
			stadium.setAddress_x(rs.getString("address_x"));
			stadium.setAddress_y(rs.getString("address_y"));
			stadium.setStadium_address(rs.getString("stadium_address"));
			return stadium;
		}
		
		//경기장 정보 detail페이지
		public StadiumListVO selectDetail(String stadium_id) {
			StadiumListVO stadiumdetail = null;
			Connection conn = null;
			PreparedStatement st = null;
			ResultSet rs = null;
			try {
				conn=DBConnection.dbConnect(path);
				st = conn.prepareStatement(SQL_SELECT_Detail);
				st.setString(1, stadium_id);
				rs = st.executeQuery();
				while (rs.next()) {
					stadiumdetail = make4(rs);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnection.dbClose(conn, st, rs);
			}
			return stadiumdetail;
		}
		private StadiumListVO make4(ResultSet rs) throws SQLException {
			StadiumListVO stadium=new StadiumListVO();
			stadium.setStadium_id(rs.getString("stadium_id"));
			stadium.setStadium_name(rs.getString("stadium_name"));
			stadium.setSports_name(rs.getString("sports_name"));
			stadium.setPayment_method(rs.getString("payment_method"));
			stadium.setStadium_address(rs.getString("stadium_address"));
			stadium.setAddress_x(rs.getString("address_x"));
			stadium.setAddress_y(rs.getString("address_y"));
			stadium.setStadium_phone(rs.getString("stadium_phone"));
			stadium.setStadium_start(rs.getString("stadium_start"));
			stadium.setStadium_end(rs.getString("stadium_end"));
			stadium.setStadium_photo(rs.getString("stadium_photo"));
			stadium.setStadium_number(rs.getInt("stadium_number"));
			stadium.setMat_max(rs.getInt("mat_max"));
			stadium.setStadium_parking(rs.getInt("stadium_parking"));
			stadium.setStadium_shower(rs.getInt("stadium_shower"));
			stadium.setStadium_char(rs.getString("stadium_char"));
			stadium.setLocation(rs.getString("location"));
			stadium.setReview_star(rs.getString("review_star"));
			return stadium;
		}

		//SQL_SELECT_review 리뷰상세보기로 넘어감  
				public List<StadiumListVO> selectReview(String stadium_id) {
					List<StadiumListVO> stadiumreview = new ArrayList<>();
					Connection conn = null;
					PreparedStatement st = null;
					ResultSet rs = null;
					try {
						conn=DBConnection.dbConnect(path);
						st = conn.prepareStatement(SQL_SELECT_review);
						st.setString(1, stadium_id);
						rs = st.executeQuery();
						while (rs.next()) {
							stadiumreview.add( make5(rs));
							//System.out.println(rs.getString("stadium_name"));
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						DBConnection.dbClose(conn, st, rs);
					}
					return stadiumreview;
				}
				
				
				private StadiumListVO make5(ResultSet rs) throws SQLException {
					StadiumListVO stadium=new StadiumListVO();
					stadium.setStadium_id(rs.getString("stadium_id"));
					stadium.setStadium_name(rs.getString("stadium_name"));
					stadium.setReview_num(rs.getInt("review_num"));
					stadium.setRes_number(rs.getInt("res_number"));
					stadium.setReview_date(rs.getDate("review_date"));
					stadium.setReview_star(rs.getString("review_star"));
					stadium.setReview_content(rs.getString("review_content"));
					stadium.setUser_id(rs.getString("user_id"));
					
					
					return stadium;
				}

		
}
