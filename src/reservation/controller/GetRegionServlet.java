package reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.ReservationService;

@WebServlet("/reservation/getRegionBySports")
public class GetRegionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//종목
		String sports_name = request.getParameter("sports_name");
		
		String dbPath = getServletContext().getRealPath(".");
		ReservationService service = new ReservationService(dbPath);
		
		request.setAttribute("regionList", service.selectBySports(sports_name));
		
		RequestDispatcher rd = request.getRequestDispatcher("regionList.jsp");
		rd.forward(request, response);
	}

}

