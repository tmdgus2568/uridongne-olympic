package matching.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import matching.model.MatCreateService;
import matching.model.MatCreateVO;
import reservation.model.ReservationVO;
import stadium.model.StadiumListService;
import stadium.model.StadiumListVO;

/**
 * Servlet implementation class MatCreateServlet
 */
@WebServlet("/matching/create")
public class MatCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StadiumListService stadiumService;
	MatCreateService createService;
       
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
		
		request.setCharacterEncoding("utf-8");
		
		String dbPath = getServletContext().getRealPath(".");
		createService = new MatCreateService(dbPath);
		
		// 테스트용 예약 데이터 
		ReservationVO reservation = new ReservationVO();
		reservation.setStadium_id(request.getParameter("stadium_id"));
		reservation.setStadium_price(100000);
		reservation.setUser_id(request.getSession().getAttribute("test_id").toString());
		
		MatCreateVO create = new MatCreateVO();
		create.setMat_people(Integer.parseInt(request.getParameter("people")));
		create.setMat_title(request.getParameter("title"));
		create.setMat_content(request.getParameter("content").replaceAll("\n", "<br>"));
		
		int result = createService.insertCreateAndRes(create, reservation);
		RequestDispatcher rd;
		if(result > 0) {
			
			
			rd = request.getRequestDispatcher("confirm.jsp?page=create&message=success");
		}
		else rd = request.getRequestDispatcher("confirm.jsp?page=create&message=failed");
		
		rd.forward(request, response);
	}

}
