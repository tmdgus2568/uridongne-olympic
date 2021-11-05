package reservation.model;

import java.util.List;
import java.util.Set;

public class ReservationService {

	ReservationDAO dao;
	
	
	public ReservationService(String path) {

		dao= new ReservationDAO(path);
	}
	
	public Set<String> selectBySports(String sports) {
		return dao.selectBySports(sports);
	}

	public List<AvailStadiumVO> getStadiumByDate(String sports_name, String region, String datepicker) {
		return dao.getStadiumByDate(sports_name, region, datepicker);
	}

	public int insertReserveInfo(ReservationVO reservation) {
		return dao.insertReserveInfo(reservation);
		
	}

}
