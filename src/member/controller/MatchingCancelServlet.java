package member.controller;

import java.io.IOException;
import java.sql.Date;

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
		String play_date = request.getParameter("play_date");
		
		System.out.println(mat_id);
		System.out.println(play_date);
		
		play_date = play_date.replace("/", "-");
		java.sql.Date date = java.sql.Date.valueOf(play_date);
		int result = service.cancelMatching(mat_id, date);
		response.getWriter().write(result+"");
		
	}

}
