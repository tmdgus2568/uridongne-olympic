package reservation.model;

import java.sql.Date;

public class ReservationVO {

	private int res_number;
	private String stadium_id;
	private String user_id;
	private Date res_date; // 예약신청일자
	private Date play_date; // 경기예약일자
	private String play_start;
	private String play_end;
	private int stadium_price; // 평일 40,000원 주말: 60,000원 (1시간 당)
	private String res_status;
	private int matching; // 매칭여부 no: 0, yes: 1

	public ReservationVO(int res_number, String stadium_id, String user_id, Date res_date, Date play_date,
			String play_start, String play_end, int stadium_price, String res_status, int matching) {
		super();
		this.res_number = res_number;
		this.stadium_id = stadium_id;
		this.user_id = user_id;
		this.res_date = res_date;
		this.play_date = play_date;
		this.play_start = play_start;
		this.play_end = play_end;
		this.stadium_price = stadium_price;
		this.res_status = res_status;
		this.matching = matching;
	}

	public ReservationVO() {

	}

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

}
