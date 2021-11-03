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
@WebServlet("/member/kakaologincheck")
public class KakaoLoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String user_id = request.getParameter("kakao_user_id");
		String user_email = request.getParameter("kakao_user_email");
		
		String path = getServletContext().getRealPath(".");
		MemberService service = new MemberService(path);
		MemberVO member = service.kakaoLoginCheck(user_id);
		
		if(member == null) {
			request.setAttribute("kakao_user_id", user_id);
			request.setAttribute("kakao_user_email", user_email);
			RequestDispatcher rd = request.getRequestDispatcher("joinFormKakao.jsp");
			rd.forward(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			response.sendRedirect("test.jsp");
		}
	}

}
