package stadium.model;

import java.util.List;

public class StadiumListService {
	StadiumListDAO stadiumListdao;

	public StadiumListService(String path) {
		stadiumListdao = new StadiumListDAO(path);
	}

	public List<StadiumListVO> selectAllService() {
		return stadiumListdao.selectAll();
	}

	public List<StadiumListVO> selectSports(String sports_name, String location) {
		return stadiumListdao.selectSports(sports_name, location);
	}

	public List<StadiumListVO> selectAddress() {
		return stadiumListdao.selectAddress();
	}

	public StadiumListVO selectDetail(String stadium_id) {
		return stadiumListdao.selectDetail(stadium_id);
	}
	
	public List<StadiumListVO> selectReview(String stadium_id) {
		return stadiumListdao.selectReview(stadium_id);
	}

}
