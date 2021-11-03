package matching.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import matching.model.MatCreateService;
import stadium.model.StadiumListService;
import stadium.model.StadiumListVO;

/**
 * Servlet implementation class MatCreateServlet
 */
@WebServlet("/matching/create")
public class MatCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StadiumListService stadiumService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MatCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 경기장 예약 전, 테스트용 데이터
		String dbPath = getServletContext().getRealPath(".");
		stadiumService = new StadiumListService(dbPath);
		StadiumListVO stadium = stadiumService.selectDetail(request.getParameter("stadium_id")); 
		
		request.setAttribute("stadium", stadium);
		
		System.out.println(stadium.getStadium_id() +  " " +  stadium.getMat_max());
		
		RequestDispatcher rd = request.getRequestDispatcher("createForm.jsp");
        rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
