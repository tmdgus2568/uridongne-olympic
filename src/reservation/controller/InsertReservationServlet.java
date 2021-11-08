package reservation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberVO;
import reservation.model.ReservationService;
import reservation.model.ReservationVO;

@WebServlet("/reservation/stadiumConfirmed")
public class InsertReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		ReservationVO reservation = makeReserve(request);

		String dbPath = getServletContext().getRealPath(".");
		ReservationService service = new ReservationService(dbPath);
		int confirmedCnt = service.insertReserveInfo(reservation);

		request.setAttribute("confirmedCnt", confirmedCnt);

		RequestDispatcher rd = request.getRequestDispatcher("reservationConfirmed.jsp");
		rd.forward(request, response);
	}

	private ReservationVO makeReserve(HttpServletRequest request) {

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		// 경기날짜
		String playDate = request.getParameter("play_date");
		playDate = playDate.replace("/", "-");
		java.sql.Date date = java.sql.Date.valueOf(playDate);
		// 경기시간
		String playTime = request.getParameter("play_time");
		String startTime = substrTime(playTime).get(0);
		String endTime = substrTime(playTime).get(1);
		// 이용금액&경기장ID
		int price = Integer.parseInt(request.getParameter("stadium_price"));
		String stadiumId = request.getParameter("stadium_id2");

		ReservationVO rvo = new ReservationVO();

		rvo.setMatching(0); // 매칭 X
		rvo.setPlay_date(date);
		rvo.setPlay_end(endTime);
		rvo.setPlay_start(startTime);
		rvo.setRes_status("완료");
		rvo.setStadium_id(stadiumId);
		rvo.setStadium_price(price);
		rvo.setUser_id(member.getUser_id());

		return rvo;
	}

	private List<String> substrTime(String playTime) {
		
		List<String> times = new ArrayList<>();
		// 형식 > 08:00~10:00 (2시간)
		String[] hours = playTime.split("~|\\s");

		for(int i = 0; i < (hours.length -1); i++) {
			if (hours[i] == "(2시간)") {
				continue;
			} else if(Integer.parseInt(hours[i].substring(0,1)) > 2) {
				times.add("0" + hours[i]);
			} else {
				times.add(hours[i]);
			}
		}
		return times;
	}
}
