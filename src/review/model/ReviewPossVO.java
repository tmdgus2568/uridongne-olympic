package review.model;

import java.sql.Date;

public class ReviewPossVO {
	private String stadium_name; 
	private String sports_name;
	private Date res_date;
	private Date play_date;
	
	public ReviewPossVO() {
		
	}
	
	public ReviewPossVO(String stadium_name, String sports_name, Date res_date, Date play_date) {
		super();
		this.stadium_name = stadium_name;
		this.sports_name = sports_name;
		this.res_date = res_date;
		this.play_date = play_date;
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

	@Override
	public String toString() {
		return "ReviewConstVO [stadium_name=" + stadium_name + ", sports_name=" + sports_name + ", res_date=" + res_date
				+ ", play_date=" + play_date + "]";
	}
	
	
}
