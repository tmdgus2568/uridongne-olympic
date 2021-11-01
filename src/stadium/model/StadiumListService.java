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
	
	public List<StadiumListVO> selectSports(String sports_name, String stadium_address) {
		return stadiumListdao.selectSports(sports_name, stadium_address);
	}

}
