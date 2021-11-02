package matching.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import matching.model.MatCreateJoinVO;
import matching.model.MatCreateService;
import matching.model.MatCreateVO;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet("/matching/list")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MatCreateService createService ;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dbPath = getServletContext().getRealPath(".");
		createService = new MatCreateService(dbPath);
		
		List<String> sportsNameList = createService.selectAllGroupBySportsName();
		
		// 파라미터 선언
		String sports_param = "none";
		String option_param = "none";
		String filter_param = "";
		
		if(request.getParameter("sports")!=null) 
			sports_param = request.getParameter("sports");
		if(request.getParameter("option")!=null) 
			option_param = request.getParameter("option");
		if(request.getParameter("filter")!=null) 
			filter_param = request.getParameter("filter");
		
		
		List<MatCreateJoinVO> createJoinList = null;
		
		// 파라미터가 있다면 검색기능을 이용한 것이므로 따로 처리해 준다
		// sports=none&option=none&filter= 라면 모두 비어있으므로 그냥 selectAll과 같다 
		if(!sports_param.equals("none") || !filter_param.equals("")) 
			createJoinList = createService.selectByFilter(sports_param, option_param, filter_param);
		
		
		else createJoinList = createService.selectAll();
		
		
		for(MatCreateJoinVO item : createJoinList) {
			System.out.println(item);
		}
		
		// 실패했으면 createList == null 
		request.setAttribute("createJoinList", createJoinList);
		request.setAttribute("sportsNameList", sportsNameList);
		
		RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
		rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
