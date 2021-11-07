package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberService;

/**
 * Servlet implementation class MatchingApplyCancelServlet
 */
@WebServlet("/member/matchingapplycancel")
public class MatchingApplyCancelServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = getServletContext().getRealPath(".");
		MemberService service = new MemberService(path);
		int mat_id = (Integer.parseInt(request.getParameter("mat_id")));
		String user_id = request.getParameter("user_id");
		int together = (Integer.parseInt(request.getParameter("together")));
		String play_date = request.getParameter("play_date");

		System.out.println(mat_id);
		System.out.println(user_id);
		System.out.println(together);
		System.out.println(play_date);

		play_date = play_date.replace("/", "-");
		java.sql.Date date = java.sql.Date.valueOf(play_date);
		
		int result = service.cancelMatchingApply(mat_id, user_id, together, date);
		response.getWriter().write(result + "");
	}

}
