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
public class ReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member"); 
		
		//로그인했을 때 user id와 name 가져오기
		if(obj != null) {
			 
			 MemberVO member = (MemberVO)obj;
			 request.setAttribute("user_id", member.getUser_id());
			 request.setAttribute("user_name", member.getUser_name());
		 }
		
		RequestDispatcher rd = request.getRequestDispatcher("reservationForm.jsp");
		rd.forward(request, response);
	
	}

}