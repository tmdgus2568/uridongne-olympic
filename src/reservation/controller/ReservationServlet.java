package reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberVO;


@WebServlet("/reservation/stadium")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
//		HttpSession session = request.getSession();
//		MemberVO member = (MemberVO)session.getAttribute("member"); 
//		if(member == null) {
//			member = new MemberVO();
//			member.setUser_id("000");
//		}
//		if(session.getAttribute("member") == null) {
//			
//		}
		String user_id = "000";
		request.setAttribute("user_id", user_id);//"사용할변수", 조회된 내용 전부 저장		
		RequestDispatcher rd = request.getRequestDispatcher("reservationForm.jsp");
		rd.forward(request, response);
	
	}

}
