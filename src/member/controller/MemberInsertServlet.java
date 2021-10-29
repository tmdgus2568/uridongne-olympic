package member.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberService;
import member.model.MemberVO;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/member/memberjoin")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberVO mem = makeMem(request);
		MemberService service = new MemberService();
		int result = service.memberInsert(mem);
		
		request.setAttribute("message", result > 0? "입력성공" : "입력실패");
		RequestDispatcher rd = request.getRequestDispatcher("joinResult.jsp");
		rd.forward(request, response);
	}
	
	private MemberVO makeMem(HttpServletRequest request) {
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		int user_birth = Integer.parseInt(request.getParameter("user_birth"));
		String user_email = request.getParameter("user_email");
		int user_phone = Integer.parseInt(request.getParameter("user_phone"));
		String user_city = request.getParameter("user_city");
		String user_state = request.getParameter("user_state");
		String[] user_interest = request.getParameterValues("user_interest");
		String login_platform = request.getParameter("login_platform");
		
		
		MemberVO mem = new MemberVO();
		
		mem.setUser_id(user_id);
		mem.setUser_pw(user_pw);
		mem.setUser_name(user_name);
		mem.setUser_birth(user_birth);
		mem.setUser_email(user_email);
		mem.setUser_phone(user_phone);
		mem.setUser_city(user_city);
		mem.setUser_state(user_state);
		mem.setUser_interest(Arrays.toString(user_interest));
		mem.setLogin_platform(login_platform);
		
		return mem;
	}

}
