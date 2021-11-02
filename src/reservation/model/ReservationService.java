package reservation.model;

import java.util.Set;

public class ReservationService {

	ReservationDAO dao;
	
	
	public ReservationService(String path) {

		dao= new ReservationDAO(path);
	}
	
	public Set<String> selectBySports(String sports) {
		return dao.selectBySports(sports);
	}

	public Object getStadiumByDate(String sports_name, String datepicker, String region) {
		return dao.getStadiumByDate(sports_name, datepicker, region);
	}
}
