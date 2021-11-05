package reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

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
		service.insertReserveInfo(reservation);
		
		RequestDispatcher rd = request.getRequestDispatcher("reserveationConfirmed.jsp");
		rd.forward(request, response);
	}
	
	private ReservationVO makeReserv(HttpServletRequest request) {
		
		HttpSession session = request.getSession(); //세션가져오기
		
		//바인딩한 객체 이름(member)으로 객체 돌려주기
		MemberVO member = (MemberVO)session.getAttribute("member"); 
		// 테스트용, session 확인 필요
		if(member == null) {
			member = new MemberVO();
			member.setUser_id("000");
		}
		
		String stadiumId = request.getParameter("stadium_id");
		String playDate = request.getParameter("play_date");
		playDate = playDate.replace("/", "-");
		java.sql.Date date = java.sql.Date.valueOf(playDate);
		String playTime = request.getParameter("play_time");
		String startTime = playTime.substring(0, 5);
		String endTime = playTime.substring(6, 11);
		int price = Integer.parseInt(request.getParameter("stadium_price"));
		
		ReservationVO rvo = new ReservationVO();
		
		rvo.setMatching(0); //매칭 X
		rvo.setPlay_date(date);
		rvo.setPlay_end(endTime);
	    rvo.setPlay_start(startTime);
	    rvo.setRes_status("완료");
	    rvo.setStadium_id(stadiumId);
	    rvo.setStadium_price(price);
	    rvo.setUser_id("555");
//	    rvo.setUser_id(member.getUser_id());
		
		return rvo;
	}

}
