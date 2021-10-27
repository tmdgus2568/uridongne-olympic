package mat_create.model;

public class Mat_createVO {
	private int mat_id;
	private int res_number; // 예약번호, reference : stadium_reservation(res_number)
	private int mat_people; // 총 몇명이 참가해야 매칭이 성사되는지 
	private int nowjoin_people; // 현재 참가인원 
	private String mat_status; // 진행중/취소/완료 
	
	public Mat_createVO(int mat_id, int res_number, int mat_people, int nowjoin_people, String mat_status) {
		super();
		this.mat_id = mat_id;
		this.res_number = res_number;
		this.mat_people = mat_people;
		this.nowjoin_people = nowjoin_people;
		this.mat_status = mat_status;
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
	
	
}
