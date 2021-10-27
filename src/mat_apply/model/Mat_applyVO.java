package mat_apply.model;

public class Mat_applyVO {
	private int mat_id;
	private String user_id; // reference : member(user_id)
	private int together; // 몇명이 함께 참여하는지 
	
	public Mat_applyVO(int mat_id, String user_id, int together) {
		super();
		this.mat_id = mat_id;
		this.user_id = user_id;
		this.together = together;
	}
	public int getMat_id() {
		return mat_id;
	}
	public void setMat_id(int mat_id) {
		this.mat_id = mat_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTogether() {
		return together;
	}
	public void setTogether(int together) {
		this.together = together;
	}
	
	

}
