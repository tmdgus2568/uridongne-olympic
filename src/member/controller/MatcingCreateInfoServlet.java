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
import matching.model.MatCreateService;
import member.model.MemberService;
import member.model.MemberVO;

/**
 * Servlet implementation class MatcingInfo
 */
@WebServlet("/member/matchingcreateinfo")
public class MatcingCreateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String path = getServletContext().getRealPath(".");
		MemberService service = new MemberService(path);
		String user_id = member.getUser_id();
		List<MatCreateJoinVO> matList = service.matchingCreateInfo(user_id);
		System.out.println(user_id);
		System.out.println(matList);
		request.setAttribute("matList", matList);
		RequestDispatcher rd = request.getRequestDispatcher("matchingCreateInfo.jsp");
		rd.forward(request, response);

	}


}
