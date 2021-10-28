package matching.model;

public class Mat_applyVO {
//	private int mat_id;
	private Mat_createVO mat_create;
	private String user_id; // reference : member(user_id) -> 나중에 객체로 바꾸자 ~

	private int together; // 몇명이 함께 참여하는지 
	
	public Mat_applyVO() {
		
	}
	
	public Mat_applyVO(Mat_createVO mat_create, String user_id, int together) {
		super();
//		this.mat_id = mat_id;
		this.mat_create = mat_create;
		this.user_id = user_id;
		this.together = together;
	}
//	public int getMat_id() {
//		return mat_id;
//	}
//	public void setMat_id(int mat_id) {
//		this.mat_id = mat_id;
//	}
	
	public String getUser_id() {
		return user_id;
	}
	public Mat_createVO getMat_create() {
		return mat_create;
	}

	public void setMat_create(Mat_createVO mat_create) {
		this.mat_create = mat_create;
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
