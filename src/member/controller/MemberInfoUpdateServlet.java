package member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberService;
import member.model.MemberVO;
import uridongne.util.DateUtil;

/**
 * Servlet implementation class MemberInfoUpdate
 */
@WebServlet("/member/memberupdate")
public class MemberInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		MemberVO member = updateMem(request);
		String path = getServletContext().getRealPath(".");
		MemberService service = new MemberService(path);
		service.updateMember(member);
		
		HttpSession session = request.getSession();
		session.setAttribute("member", member);
		System.out.println(member);
		System.out.println();
		response.sendRedirect("mypage.jsp");
	}

	
	private MemberVO updateMem(HttpServletRequest request) {
		
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		Date user_birth = DateUtil.convertToDate((request.getParameter("user_birth")).replace('-', '/'));
		String user_email = request.getParameter("user_email");
		int user_phone = Integer.parseInt(request.getParameter("user_phone"));
		String user_city = request.getParameter("user_city");
		String user_state = request.getParameter("user_state");
		String[] user_interest = request.getParameterValues("user_interest");
		String login_platform = request.getParameter("login_platform");
		
		
		MemberVO mem = new MemberVO();
		
		mem.setUser_id(user_id);
		mem.setUser_name(user_name);
		mem.setUser_birth(user_birth);
		mem.setUser_email(user_email);
		mem.setUser_phone(user_phone);
		mem.setUser_city(user_city);
		mem.setUser_state(user_state);
		mem.setUser_interest((Arrays.toString(user_interest)).substring(1, ((Arrays.toString(user_interest)).length())-1));
		mem.setLogin_platform(login_platform);
		
		return mem;
	}

}
