package matching.model;

import java.sql.Date;

public class MatCreateJoinVO {
	// mat_create 
	private int mat_id;
	private int res_number; // 예약번호, reference : stadium_reservation(res_number) -> 추후에 객체로 바꾸기 
	private int mat_people; // 총 몇명이 참가해야 매칭이 성사되는지 
	private int nowjoin_people; // 현재 참가인원 
	private String mat_status; // 진행중/취소/완료 
	private String mat_title;
	private String mat_content;
	
	// stadium_reservation
	private String stadium_id;
	private String user_id;
	private Date res_date; // 예약신청일자
	private Date play_date; // 경기예약일자
	private String play_start;
	private String play_end;
	private int stadium_price; // 평일 40,000원 주말: 60,000원 (1시간 당)
	private String res_status;
	private int matching; // 매칭여부 no: 0, yes: 1
	
	// stadium
	String  stadium_name;
	String  sports_name;
	String  payment_method;	
	String  stadium_address;
	String  address_x;	
	String  address_y;	
	String  stadium_phone;	
	String  stadium_start;	
	String  stadium_end;	
	String  stadium_photo;
	int stadium_number;
	int mat_max;	
	int stadium_parking;	
	int stadium_shower;	
	String stadium_char;
	
	public MatCreateJoinVO() {
		super();
	}
	public int getMat_id() {
		return mat_id;
	}
	public void setMat_id(int mat_id) {
		this.mat_id = mat_id;
	}
	public int getRes_number() {
		return res_number;
	}
	public void setRes_number(int res_number) {
		this.res_number = res_number;
	}
	public int getMat_people() {
		return mat_people;
	}
	public void setMat_people(int mat_people) {
		this.mat_people = mat_people;
	}
	public int getNowjoin_people() {
		return nowjoin_people;
	}
	public void setNowjoin_people(int nowjoin_people) {
		this.nowjoin_people = nowjoin_people;
	}
	public String getMat_status() {
		return mat_status;
	}
	public void setMat_status(String mat_status) {
		this.mat_status = mat_status;
	}
	public String getMat_title() {
		return mat_title;
	}
	public void setMat_title(String mat_title) {
		this.mat_title = mat_title;
	}
	public String getMat_content() {
		return mat_content;
	}
	public void setMat_content(String mat_content) {
		this.mat_content = mat_content;
	}
	public String getStadium_id() {
		return stadium_id;
	}
	public void setStadium_id(String stadium_id) {
		this.stadium_id = stadium_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	public Date getPlay_date() {
		return play_date;
	}
	public void setPlay_date(Date play_date) {
		this.play_date = play_date;
	}
	public String getPlay_start() {
		return play_start;
	}
	public void setPlay_start(String play_start) {
		this.play_start = play_start;
	}
	public String getPlay_end() {
		return play_end;
	}
	public void setPlay_end(String play_end) {
		this.play_end = play_end;
	}
	public int getStadium_price() {
		return stadium_price;
	}
	public void setStadium_price(int stadium_price) {
		this.stadium_price = stadium_price;
	}
	public String getRes_status() {
		return res_status;
	}
	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}
	public int getMatching() {
		return matching;
	}
	public void setMatching(int matching) {
		this.matching = matching;
	}
	public String getStadium_name() {
		return stadium_name;
	}
	public void setStadium_name(String stadium_name) {
		this.stadium_name = stadium_name;
	}
	public String getSports_name() {
		return sports_name;
	}
	public void setSports_name(String sports_name) {
		this.sports_name = sports_name;
	}
	public String getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	public String getStadium_address() {
		return stadium_address;
	}
	public void setStadium_address(String stadium_address) {
		this.stadium_address = stadium_address;
	}
	public String getAddress_x() {
		return address_x;
	}
	public void setAddress_x(String address_x) {
		this.address_x = address_x;
	}
	public String getAddress_y() {
		return address_y;
	}
	public void setAddress_y(String address_y) {
		this.address_y = address_y;
	}
	public String getStadium_phone() {
		return stadium_phone;
	}
	public void setStadium_phone(String stadium_phone) {
		this.stadium_phone = stadium_phone;
	}
	public String getStadium_start() {
		return stadium_start;
	}
	public void setStadium_start(String stadium_start) {
		this.stadium_start = stadium_start;
	}
	public String getStadium_end() {
		return stadium_end;
	}
	public void setStadium_end(String stadium_end) {
		this.stadium_end = stadium_end;
	}
	public String getStadium_photo() {
		return stadium_photo;
	}
	public void setStadium_photo(String stadium_photo) {
		this.stadium_photo = stadium_photo;
	}
	public int getStadium_number() {
		return stadium_number;
	}
	public void setStadium_number(int stadium_number) {
		this.stadium_number = stadium_number;
	}
	public int getMat_max() {
		return mat_max;
	}
	public void setMat_max(int mat_max) {
		this.mat_max = mat_max;
	}
	public int getStadium_parking() {
		return stadium_parking;
	}
	public void setStadium_parking(int stadium_parking) {
		this.stadium_parking = stadium_parking;
	}
	public int getStadium_shower() {
		return stadium_shower;
	}
	public void setStadium_shower(int stadium_shower) {
		this.stadium_shower = stadium_shower;
	}
	public String getStadium_char() {
		return stadium_char;
	}
	public void setStadium_char(String stadium_char) {
		this.stadium_char = stadium_char;
	}
	
	
	
	
}
