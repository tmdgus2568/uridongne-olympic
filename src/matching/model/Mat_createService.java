package matching.model;

import java.util.List;

public class Mat_createService {
	Mat_createDAO mat_createDAO;
	
	
	public Mat_createService(String path) {

		mat_createDAO= new Mat_createDAO(path);
	}

	
	
	public List<Mat_createVO> selectAll(){
		return mat_createDAO.selectAll();
	}
	
	public Mat_createVO selectById(int id) {
		return mat_createDAO.selectById(id);
	}

}
