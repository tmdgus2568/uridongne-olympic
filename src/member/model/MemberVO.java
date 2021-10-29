package member.model;

import java.sql.Date;

public class MemberVO {

	String user_id;
	String user_pw;
	String user_name;
	int user_birth;
	String user_email;
	int user_phone;
	String user_city;
	String user_state;
	String user_interest;
	Date signupdate;
	String login_platform;
	
	public MemberVO() {
		
	}
	
	public MemberVO(String user_id, String user_pw, String user_name, int user_birth, String user_email, int user_phone,
			String user_city, String user_state, String user_interest, Date signupdate, String login_platform) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_birth = user_birth;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_city = user_city;
		this.user_state = user_state;
		this.user_interest = user_interest;
		this.signupdate = signupdate;
		this.login_platform = login_platform;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(int user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(int user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_city() {
		return user_city;
	}

	public void setUser_city(String user_city) {
		this.user_city = user_city;
	}

	public String getUser_state() {
		return user_state;
	}

	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}

	public String getUser_interest() {
		return user_interest;
	}

	public void setUser_interest(String user_interest) {
		this.user_interest = user_interest;
	}

	public Date getSignupdate() {
		return signupdate;
	}

	public void setSignupdate(Date signupdate) {
		this.signupdate = signupdate;
	}

	public String getLogin_platform() {
		return login_platform;
	}

	public void setLogin_platform(String login_platform) {
		this.login_platform = login_platform;
	}

	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_birth="
				+ user_birth + ", user_email=" + user_email + ", user_phone=" + user_phone + ", user_city=" + user_city
				+ ", user_state=" + user_state + ", user_interest=" + user_interest + ", signupdate=" + signupdate
				+ ", login_platform=" + login_platform + "]";
	}
	
}
