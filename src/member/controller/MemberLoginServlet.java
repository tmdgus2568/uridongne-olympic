package member.controller;

import java.io.IOException;
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
@WebServlet("/member/memberlogin")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pw");
		String kakao_user_id = request.getParameter("kakao_user_id");
		String kakao_user_email = request.getParameter("kakao_user_email");
		
		System.out.println(kakao_user_id);
		System.out.println(kakao_user_email);
		
//		String path = getServletContext().getRealPath(".");
//		MemberService service = new MemberService(path);
//		MemberVO member = service.logincheck(user_id, user_pwd);
//		if(member == null) {
//			response.sendRedirect("memberlogin");
//		} else {
//			HttpSession session = request.getSession();
//			session.setAttribute("member", member);
//			response.sendRedirect("../");
//		}
	}

}
