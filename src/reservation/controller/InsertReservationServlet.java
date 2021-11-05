package reservation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberVO;
import reservation.model.ReservationService;
import reservation.model.ReservationVO;

@WebServlet("/reservation/stadiumConfirmed")
public class InsertReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ReservationVO reservation = makeReserv(request);
				
		String dbPath = getServletContext().getRealPath(".");
		ReservationService service = new ReservationService(dbPath);
		int confirmedCnt = service.insertReserveInfo(reservation);
		
		request.setAttribute("confirmedCnt", confirmedCnt);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("reservationConfirmed.jsp");
		rd.forward(request, response);
	}
	
	private ReservationVO makeReserv(HttpServletRequest request) {
		
//		HttpSession session = request.getSession(); //세션가져오기
//		
//		//바인딩한 객체 이름(member)으로 객체 돌려주기
//		MemberVO member = (MemberVO)session.getAttribute("member"); 
//		// 테스트용, session 확인 필요
//		if(member == null) {
//			member = new MemberVO();
//			member.setUser_id("000");
//		}
		
		String stadiumId = request.getParameter("stadium_id");
		String playDate = request.getParameter("play_date");
		playDate = playDate.replace("/", "-");
		java.sql.Date date = java.sql.Date.valueOf(playDate);
		String playTime = request.getParameter("play_time");
		String startTime = substrTime(playTime).get(0);
		String endTime = substrTime(playTime).get(1);
		int price = Integer.parseInt(request.getParameter("stadium_price"));
		
		ReservationVO rvo = new ReservationVO();
		
		rvo.setMatching(0); //매칭 X
		rvo.setPlay_date(date);
		rvo.setPlay_end(endTime);
	    rvo.setPlay_start(startTime);
	    rvo.setRes_status("완료");
	    rvo.setStadium_id(stadiumId);
	    rvo.setStadium_price(price);
	    rvo.setUser_id("000");
//	    rvo.setUser_id(member.getUser_id());
		
		return rvo;
	}
	
	private List<String> substrTime(String playTime) {
		List<String> times = new ArrayList<>();
		String startTime = null;
		String endTime = null;
		int hour = Integer.parseInt(playTime.substring(0, 1));
		if(hour < 3) {
			startTime = playTime.substring(0, 5);
			endTime = playTime.substring(6, 11);
		} else {
			startTime = "0" + playTime.substring(0, 4);
			endTime = "0" + playTime.substring(5, 10);
		}
		
		times.add(startTime);
		times.add(endTime);
		
		return times;
	}

}
