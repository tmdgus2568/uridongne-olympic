package review.model;

import java.sql.Date;

public class ReviewListVO {
	private String user_id; 
	private String stadium_name;
	private Date play_date;
	private String review_star;
	private String review_content;
	private int res_number;
	
	public ReviewListVO(){
		
	}

	public ReviewListVO(String user_id, String stadium_name, Date play_date, String review_star, String review_content,
			int res_number) {
		super();
		this.user_id = user_id;
		this.stadium_name = stadium_name;
		this.play_date = play_date;
		this.review_star = review_star;
		this.review_content = review_content;
		this.res_number = res_number;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getStadium_name() {
		return stadium_name;
	}

	public void setStadium_name(String stadium_name) {
		this.stadium_name = stadium_name;
	}

	public Date getPlay_date() {
		return play_date;
	}

	public void setPlay_date(Date play_date) {
		this.play_date = play_date;
	}

	public String getReview_star() {
		return review_star;
	}

	public void setReview_star(String review_star) {
		this.review_star = review_star;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getRes_number() {
		return res_number;
	}

	public void setRes_number(int res_number) {
		this.res_number = res_number;
	}

	
	
	
	
	
}
