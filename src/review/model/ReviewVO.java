package review.model;

import java.sql.Date;
import java.util.List;

public class ReviewVO {
	private int review_num;
	private int res_number;
	private Date review_date;
	private int review_star;
	private String review_content;
	private String review_photo;
	
	public ReviewVO() {
		
	}
	
	public ReviewVO(int review_num, int res_number, Date review_date, 
					int review_star, String review_content, String review_photo) {
		super();
		this.review_num = review_num;
		this.res_number = res_number;
		this.review_date = review_date;
		this.review_star = review_star;
		this.review_content = review_content;
		this.review_photo = review_photo;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public int getRes_number() {
		return res_number;
	}

	public void setRes_number(int res_number) {
		this.res_number = res_number;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_photo() {
		return review_photo;
	}

	public void setReview_photo(String review_photo) {
		this.review_photo = review_photo;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_num=" + review_num + ", res_number=" + res_number + ", review_date=" + review_date
				+ ", review_star=" + review_star + ", review_content=" + review_content + ", review_photo="
				+ review_photo + "]";
	}


	
	
}
