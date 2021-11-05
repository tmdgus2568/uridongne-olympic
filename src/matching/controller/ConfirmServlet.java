package matching.controller;

import java.io.IOException;

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

/**
 * Servlet implementation class ConfirmServlet
 */
@WebServlet("/matching/confirm")
public class ConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MatCreateService createService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String dbPath = getServletContext().getRealPath(".");
		createService = new MatCreateService(dbPath);
		
		
		ReservationVO reservation = makeReserv(request);
		
		MatCreateVO create = new MatCreateVO();
		create.setMat_people(Integer.parseInt(request.getParameter("people")));
		create.setMat_title(request.getParameter("title"));
		create.setMat_content(request.getParameter("content").replaceAll("\n", "<br>"));
		
		int result = createService.insertCreateAndRes(create, reservation);
		RequestDispatcher rd;
		if(result > 0) {
			
			
			rd = request.getRequestDispatcher("confirm.jsp?page=create&message=success");
		}
		else rd = request.getRequestDispatcher("confirm.jsp?page=create&message=failed");

		
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
		String startTime = request.getParameter("play_start");
		String endTime = request.getParameter("play_end");
		int price = Integer.parseInt(request.getParameter("stadium_price"));
		
		ReservationVO rvo = new ReservationVO();
		
		rvo.setMatching(1); //매칭 
		rvo.setPlay_date(date);
		rvo.setPlay_end(endTime);
	    rvo.setPlay_start(startTime);
	    rvo.setRes_status("완료");
	    rvo.setStadium_id(stadiumId);
	    rvo.setStadium_price(price);
	    rvo.setUser_id("555");
		
	    System.out.println("confirm : " + rvo);
		return rvo;
	}

}
