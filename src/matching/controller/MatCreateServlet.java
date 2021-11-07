package matching.controller;

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

import matching.model.MatCreateService;
import matching.model.MatCreateVO;
import member.model.MemberVO;
import reservation.model.ReservationVO;
import stadium.model.StadiumListService;
import stadium.model.StadiumListVO;

/**
 * Servlet implementation class MatCreateServlet
 */
@WebServlet("/matching/create")
public class MatCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StadiumListService stadiumService;
	MatCreateService createService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MatCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String dbPath = getServletContext().getRealPath(".");
		stadiumService = new StadiumListService(dbPath);
		StadiumListVO stadium = stadiumService.selectDetail(request.getParameter("stadium_id"));
	
		
		
		request.setAttribute("stadium", stadium);
		
		System.out.println(stadium.getStadium_id() +  " " +  stadium.getMat_max());
		
		RequestDispatcher rd = request.getRequestDispatcher("createForm.jsp");
        rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 다음으로 누르면 MatCreateServlet로 이동 -> 객체를 보내므로 post로 보냄 
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		RequestDispatcher rd;
		System.out.println("stadium_id2 : " + request.getParameter("stadium_id2"));
		
		ReservationVO reservation = makeReserv(request);
		
		String dbPath = getServletContext().getRealPath(".");
		stadiumService = new StadiumListService(dbPath);
		StadiumListVO stadium = stadiumService.selectDetail(request.getParameter("stadium_id2"));
	
			
		request.setAttribute("reservation", reservation);
		request.setAttribute("stadium", stadium);
		
		rd = request.getRequestDispatcher("createForm.jsp");
		rd.forward(request, response);
		
	}
	
	
	private ReservationVO makeReserv(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member"); 
		
		String stadiumId = request.getParameter("stadium_id2");
		String playDate = request.getParameter("play_date");
		playDate = playDate.replace("/", "-");
		
//		System.out.println("stadium_id2 : " + stadiumId);
		System.out.println("playDate : " + playDate);
		java.sql.Date date = java.sql.Date.valueOf(playDate);
		String playTime = request.getParameter("play_time");
		String startTime = substrTime(playTime).get(0);
		String endTime = substrTime(playTime).get(1);
		int price = Integer.parseInt(request.getParameter("stadium_price"));
		
		System.out.println(stadiumId); ////////////////////////////////////////////////////테스트지우기
		
		ReservationVO rvo = new ReservationVO();
		
		rvo.setMatching(0); //매칭 X
		rvo.setPlay_date(date);
		rvo.setPlay_end(endTime);
	    rvo.setPlay_start(startTime);
	    rvo.setRes_status("완료");
	    rvo.setStadium_id(stadiumId);
	    rvo.setStadium_price(price);
	    rvo.setUser_id(member.getUser_id());
		
		return rvo;
	   
	}
	
	private List<String> substrTime(String playTime) {
		List<String> times = new ArrayList<>();
		// split > 10:00~12:00 (2시간) 
		String[] hours = playTime.split("~|\\s");
		
		for(String hour : hours) {
			times.add(hour);
		}
		
		System.out.println(times);
		
		return times;
	}

}
