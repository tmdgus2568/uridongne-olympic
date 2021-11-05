package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberService;
import member.model.MemberVO;
import member.model.ResInfoVO;
import review.model.ReviewListVO;

/**
 * Servlet implementation class ReserveInfo
 */
@WebServlet("/member/reserveinfo")
public class ReserveInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String path = getServletContext().getRealPath(".");
		MemberService service = new MemberService(path);
		String user_id = member.getUser_id();
		List<ResInfoVO> resList = service.resInfo(user_id);
		request.setAttribute("resList", resList);
		
		RequestDispatcher rd = request.getRequestDispatcher("reserveinfo.jsp");
		rd.forward(request, response);
	}

}
