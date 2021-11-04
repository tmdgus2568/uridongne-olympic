package matching.model;

import java.util.List;

import reservation.model.ReservationVO;

public class MatCreateService {
	MatCreateDAO matCreateDAO;
	
	public MatCreateService(String path) {

		matCreateDAO= new MatCreateDAO(path);
	}

	
	
	public List<MatCreateJoinVO> selectAll(){
		return matCreateDAO.selectAll();
	}
	
	public MatCreateJoinVO selectById(int id) {
		return matCreateDAO.selectById(id);
	}
	
	public List<String> selectAllGroupBySportsName(){
		return matCreateDAO.selectAllGroupBySportsName();
	}
	
	public List<MatCreateJoinVO> selectByFilter(String sports, String option, String filter){
		return matCreateDAO.selectByFilter(sports, option, filter);
	}
	
	public int insertCreateAndRes(MatCreateVO create, ReservationVO reservation) {
		return matCreateDAO.insertCreateAndRes(create, reservation);
	}

}
