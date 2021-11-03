package stadium.model;

public class StadiumListVO {
	String  stadium_id;
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
	String location;
	
	
	public StadiumListVO() {
		
	}
	

	public StadiumListVO(String stadium_id, String stadium_name, String sports_name, String payment_method,
			String stadium_address, String address_x, String address_y, String stadium_phone, String stadium_start,
			String stadium_end, String stadium_photo, int stadium_number, int mat_max, int stadium_parking,
			int stadium_shower, String stadium_char, String location) {
		super();
		this.stadium_id = stadium_id;
		this.stadium_name = stadium_name;
		this.sports_name = sports_name;
		this.payment_method = payment_method;
		this.stadium_address = stadium_address;
		this.address_x = address_x;
		this.address_y = address_y;
		this.stadium_phone = stadium_phone;
		this.stadium_start = stadium_start;
		this.stadium_end = stadium_end;
		this.stadium_photo = stadium_photo;
		this.stadium_number = stadium_number;
		this.mat_max = mat_max;
		this.stadium_parking = stadium_parking;
		this.stadium_shower = stadium_shower;
		this.stadium_char = stadium_char;
		this.location = location;
	}
	
	
	
	public String getStadium_id() {
		return stadium_id;
	}

	public void setStadium_id(String stadium_id) {
		this.stadium_id = stadium_id;
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	
	@Override
	public String toString() {
		return "StadiumListVO [stadium_id=" + stadium_id + ", stadium_name=" + stadium_name + ", sports_name="
				+ sports_name + ", payment_method=" + payment_method + ", stadium_address=" + stadium_address
				+ ", address_x=" + address_x + ", address_y=" + address_y + ", stadium_phone=" + stadium_phone
				+ ", stadium_start=" + stadium_start + ", stadium_end=" + stadium_end + ", stadium_photo="
				+ stadium_photo + ", stadium_number=" + stadium_number + ", mat_max=" + mat_max + ", stadium_parking="
				+ stadium_parking + ", stadium_shower=" + stadium_shower + ", stadium_char=" + stadium_char
				+ ", location=" + location + "]";
	}
	
	
}
