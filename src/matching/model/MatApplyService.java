package matching.model;

public class MatApplyService {
	MatApplyDAO matApplyDAO;

	
	public MatApplyService(String path) {
		matApplyDAO = new MatApplyDAO(path);
	}

	
	public int insertApply(MatApplyVO apply) {
		return matApplyDAO.insertApply(apply);
	}

}
