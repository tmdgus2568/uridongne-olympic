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
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/member/generallogincheck")
public class GeneralLoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		String path = getServletContext().getRealPath(".");
		MemberService service = new MemberService(path);
		
		MemberVO memberbyid = service.kakaoLoginCheck(user_id);	//아이디만 체크
		MemberVO member = service.generalLoginCheck(user_id, user_pw);	//비밀번호도 함께 체크
		
		
		if(memberbyid == null) {
			request.setAttribute("message", "가입되지 않은 아이디입니다.");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} else if(member == null) {
			request.setAttribute("message", "잘못된 비밀번호 입니다.");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} else {
			HttpSession session = request.getSession();
			System.out.println("로그인 성공");
			session.setAttribute("member", member);
			response.sendRedirect("/uridongne-olympic/main/uridongneMain.jsp");
		}
	}
}
