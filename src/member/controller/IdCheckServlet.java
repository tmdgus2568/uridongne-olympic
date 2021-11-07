package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberService;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/member/idcheck")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = getServletContext().getRealPath(".");
		MemberService service = new MemberService(path);
		String user_id = request.getParameter("user_id");
		int result = service.idCheck(user_id);
		response.getWriter().write(result+"");
	}
}
