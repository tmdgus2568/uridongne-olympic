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
 * Servlet implementation class stadiumListServlet
 */
@WebServlet("/stadium/stadiumList")
public class StadiumListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StadiumListService stalistService = new StadiumListService();

	public StadiumListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<StadiumListVO> stadiumList = stalistService.selectAllService();

		for (StadiumListVO item : stadiumList) {
			System.out.println(item);
		}

		// 실패했으면 createList == null
		request.setAttribute("createList", stadiumList);
		RequestDispatcher rd = request.getRequestDispatcher("stadiumList.jsp");
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
