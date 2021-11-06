package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberService;

/**
 * Servlet implementation class MatchingCancelServlet
 */
@WebServlet("/member/matchingcancel")
public class MatchingCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = getServletContext().getRealPath(".");
		MemberService service = new MemberService(path);
		int mat_id = (Integer.parseInt(request.getParameter("mat_id")));
		int cnt = service.cancelMatching(mat_id);
		
		if(cnt == 1) {
			response.sendRedirect("matchingcreateinfo");
		} else 
		response.sendRedirect("test.jsp");
		
	}

}
