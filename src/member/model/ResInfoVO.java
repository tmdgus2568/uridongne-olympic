package member.model;

import java.sql.Date;

public class ResInfoVO {

	private int res_number;
	private String stadium_id;
	private Date res_date; // 예약신청일자
	private Date play_date; // 경기예약일자
	private String play_start;
	private String play_end;
	private int stadium_price; // 평일 40,000원 주말: 60,000원 (1시간 당)
	private String res_status;
	private int matching; // 매칭여부 no: 0, yes: 1
	
	private String stadium_name;
	private String sports_name;
	private String address_x;
	private String address_y;
	private String stadium_phone;
	
	public int getRes_number() {
		return res_number;
	}
	public void setRes_number(int res_number) {
		this.res_number = res_number;
	}
	public String getStadium_id() {
		return stadium_id;
	}
	public void setStadium_id(String stadium_id) {
		this.stadium_id = stadium_id;
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
	@Override
	public String toString() {
		return "ResInfoVO [res_number=" + res_number + ", stadium_id=" + stadium_id + ", res_date=" + res_date
				+ ", play_date=" + play_date + ", play_start=" + play_start + ", play_end=" + play_end
				+ ", stadium_price=" + stadium_price + ", res_status=" + res_status + ", matching=" + matching
				+ ", stadium_name=" + stadium_name + ", sports_name=" + sports_name + ", address_x=" + address_x
				+ ", address_y=" + address_y + ", stadium_phone=" + stadium_phone + "]";
	}
	
}
