package stadium.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stadium.model.StadiumListService;
import stadium.model.StadiumListVO;

/**
 * Servlet implementation class StadiumSearchServlet
 */
@WebServlet("/stadium/stadiumSearch")
public class StadiumSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = getServletContext().getRealPath(".");
		StadiumListService stadiumlistService = new StadiumListService(path);
		String sports_name = request.getParameter("sports");
		String stadium_address = request.getParameter("location");  //name
		//System.out.println(sports_name + stadium_address);
		List<StadiumListVO> stadiumList = stadiumlistService.selectSports(sports_name, stadium_address);
		System.out.println(stadiumList.size());
		request.setAttribute("stadiumList", stadiumList);  //db데이터를 저장
		RequestDispatcher rd = request.getRequestDispatcher("stadium2.jsp");  //jsp가 stadiumList에 담긴 정보를 가져와서 사용
		rd.forward(request, response);
	
	}

	 
}
