package reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.ReservationService;

@WebServlet("/reservation/getStadiumByDate")
public class GetStadiumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//종목, 지역, 날짜
		String sports_name = request.getParameter("sports_name");
		String region = request.getParameter("region");
		String datepicker = request.getParameter("datepicker");
		
		String dbPath = getServletContext().getRealPath(".");
		ReservationService service = new ReservationService(dbPath);
		
		request.setAttribute("availStadiumList", service.getStadiumByDate(sports_name, region, datepicker));
		
		RequestDispatcher rd = request.getRequestDispatcher("availStadiumList.jsp");
		rd.forward(request, response);
	}
}
