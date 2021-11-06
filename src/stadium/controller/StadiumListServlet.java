package stadium.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberService;
import stadium.model.StadiumListService;
import stadium.model.StadiumListVO;

/**
 * Servlet implementation class stadiumListServlet
 */
@WebServlet("/stadium/stadiumList")
public class StadiumListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = getServletContext().getRealPath(".");
		StadiumListService stadiumlistService = new
				StadiumListService(path);
		List<StadiumListVO> stadiumList = stadiumlistService.selectAllService();
	
		request.setAttribute("stadiumList", stadiumList);  //db데이터를 저장
		RequestDispatcher rd = request.getRequestDispatcher("stadiumList.jsp");  //jsp가 stadiumList에 담긴 정보를 가져와서 사용
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doGet(request, response);
	}

}
