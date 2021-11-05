package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberService;
import member.model.MemberVO;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/member/sociallogincheck")
public class SocialLoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String user_id = request.getParameter("social_user_id");
		String user_email = request.getParameter("social_user_email");
		String login_platform =  request.getParameter("login_platform");
		
		String path = getServletContext().getRealPath(".");
		MemberService service = new MemberService(path);
		MemberVO member = service.kakaoLoginCheck(user_id);
		
		if(member == null) {
			request.setAttribute("social_user_id", user_id);
			request.setAttribute("social_user_email", user_email);
			request.setAttribute("login_platform", login_platform);
			RequestDispatcher rd = request.getRequestDispatcher("joinFormSocial.jsp");
			rd.forward(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			response.sendRedirect("/uridongne-olympic/header.jsp");
		}
	}

}
