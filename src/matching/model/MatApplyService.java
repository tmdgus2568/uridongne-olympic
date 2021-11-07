package matching.model;

public class MatApplyService {
	MatApplyDAO matApplyDAO;

	
	public MatApplyService(String path) {
		matApplyDAO = new MatApplyDAO(path);
	}

	
	public int insertApply(MatApplyVO apply) {
		return matApplyDAO.insertApply(apply);
	}
	
	public int isSelectByUserAndRes(String user_id, int mat_id) {
		return matApplyDAO.isSelectByUserAndRes(user_id, mat_id);
	}

}
