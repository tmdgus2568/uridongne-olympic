package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberService;

/**
 * Servlet implementation class ReserveCancelServlet
 */
@WebServlet("/member/reservecancel")
public class ReserveCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = getServletContext().getRealPath(".");
		MemberService service = new MemberService(path);
		int res_number = (Integer.parseInt(request.getParameter("res_number")));
		String play_date = request.getParameter("play_date");
		play_date = play_date.replace("/", "-");
		java.sql.Date date = java.sql.Date.valueOf(play_date);
		int result = service.cancelReserve(res_number, date);
		response.getWriter().write(result+"");
	}

}
