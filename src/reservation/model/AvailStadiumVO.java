package reservation.model;

public class AvailStadiumVO {

	private String stadium_name;
	private String sports_name;
	private String user_id;
	private String stadium_id;
	private String stadium_start;
	private String stadium_end;
	private String payment_method;
	private int stadium_price;
	private int stadium_number; // 수용가능인원

	public AvailStadiumVO() {

	}

	public int getStadium_number() {
		return stadium_number;
	}

	public void setStadium_number(int stadium_number) {
		this.stadium_number = stadium_number;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getStadium_id() {
		return stadium_id;
	}

	public void setStadium_id(String stadium_id) {
		this.stadium_id = stadium_id;
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

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public int getStadium_price() {
		return stadium_price;
	}

	public void setStadium_price(int stadium_price) {
		this.stadium_price = stadium_price;
	}

}
