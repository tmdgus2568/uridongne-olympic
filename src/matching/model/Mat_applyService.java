package matching.model;

public class Mat_applyService {
	
	Mat_applyDAO mat_applyDAO = new Mat_applyDAO();
	
	public int insertApply(Mat_applyVO apply) {
		return mat_applyDAO.insertApply(apply);
	}

}
