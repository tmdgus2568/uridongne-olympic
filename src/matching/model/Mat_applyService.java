package matching.model;

public class Mat_applyService {
	String path;
	
	
	
	public Mat_applyService(String path) {
		this.path = path;
	}

	Mat_applyDAO mat_applyDAO = new Mat_applyDAO(path);
	
	public int insertApply(Mat_applyVO apply) {
		return mat_applyDAO.insertApply(apply);
	}

}
