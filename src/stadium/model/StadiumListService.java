package stadium.model;

import java.util.List;

public class StadiumListService {
	StadiumListDAO stadiumListdao = new StadiumListDAO();

	public List<StadiumListVO> selectAllService() {
		return stadiumListdao.selectAll();
	}

}
