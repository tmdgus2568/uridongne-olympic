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

import matching.model.MatCreateJoinVO;
import member.model.MemberService;
import member.model.MemberVO;

/**
 * Servlet implementation class MatchingApplyInfo
 */
@WebServlet("/member/matchingapplyinfo")
public class MatchingApplyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String path = getServletContext().getRealPath(".");
		MemberService service = new MemberService(path);
		String user_id = member.getUser_id();
		List<MatCreateJoinVO> appList = service.matchingApplyInfo(user_id);
		System.out.println(user_id);
		System.out.println(appList);
		request.setAttribute("appList", appList);
		RequestDispatcher rd = request.getRequestDispatcher("matchingAppplyInfo.jsp");
		rd.forward(request, response);

	}

}
