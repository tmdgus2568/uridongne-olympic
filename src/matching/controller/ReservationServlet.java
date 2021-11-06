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
import member.model.MemberVO;
import reservation.model.ReservationService;
import reservation.model.ReservationVO;

/**
 * Servlet implementation class ReservationServlet
 */
@WebServlet("/matching/stadium")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MatCreateService createService;
	ReservationService reserService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member"); 
		
		if(obj != null) {
			 
			 MemberVO member = (MemberVO)obj;
			 request.setAttribute("user_id", member.getUser_id());//"사용할변수", 조회된 내용 전부 저장	
			 request.setAttribute("user_name", member.getUser_name());
		 }
		
		RequestDispatcher rd = request.getRequestDispatcher("reservationForm.jsp");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
	}
	
	
	

}
