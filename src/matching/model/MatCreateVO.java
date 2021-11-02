package matching.model;

import reservation.model.ReservationVO;

public class MatCreateVO {
	private int mat_id;
	
	private int res_number; // 예약번호, reference : stadium_reservation(res_number) -> 추후에 객체로 바꾸기 
	private int mat_people; // 총 몇명이 참가해야 매칭이 성사되는지 
	private int nowjoin_people; // 현재 참가인원 
	private String mat_status; // 진행중/취소/완료 
	private String mat_title;
	private String mat_content;
	

	public MatCreateVO() {
		super();
	}

	public MatCreateVO(int mat_id, int res_number, int mat_people, int nowjoin_people, String mat_status, String mat_title, String mat_content) {
		super();
		this.mat_id = mat_id;
		this.res_number = res_number;
		this.mat_people = mat_people;
		this.nowjoin_people = nowjoin_people;
		this.mat_status = mat_status;
		this.mat_title = mat_title;
		this.mat_content = mat_content;
	}
	
	
	
	public MatCreateVO(int mat_id, ReservationVO reservation, int mat_people, int nowjoin_people,
			String mat_status, String mat_title, String mat_content) {
		super();
		this.mat_id = mat_id;
		this.mat_people = mat_people;
		this.nowjoin_people = nowjoin_people;
		this.mat_status = mat_status;
		this.mat_title = mat_title;
		this.mat_content = mat_content;
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

	@Override
	public String toString() {
		return "Mat_createVO [mat_id=" + mat_id + ", res_number=" + res_number + ", mat_people=" + mat_people
				+ ", nowjoin_people=" + nowjoin_people + ", mat_status=" + mat_status + ", mat_title=" + mat_title
				+ ", mat_content=" + mat_content + "]";
	}
	
	
	
}
