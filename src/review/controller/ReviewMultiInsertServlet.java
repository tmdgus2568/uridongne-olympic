package review.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import review.model.ReviewInfoVO;
import review.model.ReviewListService;
import review.model.ReviewService;
import review.model.ReviewVO;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/review/reviewmultiinsert")
public class ReviewMultiInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReviewService ReviewService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = getServletContext().getRealPath(".");
		ReviewService = new ReviewService(path);
		// res_number 끌어오기

		/*
		 * // 예약 정보 List<ReviewInfoVO> infoList = ReviewService.selectInfoReview(); for
		 * (ReviewInfoVO list : infoList) { System.out.println(list); }
		 */

		// 입력폼 보여주기
		RequestDispatcher rd = request.getRequestDispatcher("reviewForm.jsp");
		rd.forward(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		
		//path 
		request.setCharacterEncoding("utf-8");
		String encoding = "utf-8";
		String path = getServletContext().getRealPath("./imageUpload");
		File currentDirPath = new File(path);//업로드할 파일 경로
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);//파일경로설정
		factory.setSizeThreshold(1024 * 1024);//최대 업로드 가능 크기
		
		//업로드 클래스
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List items = upload.parseRequest(request);//request객체에서 매개변수를 list로 가져옴
			for (int i = 0; i < items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);//파일 업로드 창에서 업로드된 항목들 하나씩 가져옴

				if (fileItem.isFormField()) {//폼 필드에서 전송된 매개변수 출력
					//System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
					ReviewVO review = new ReviewVO();
					//inset
					review.setRes_number(Integer.parseInt(request.getParameter("res_number")));
					review.setReview_star(Arrays.toString(request.getParameterValues("review_star")));
					review.setReview_content(request.getParameter("review_content"));
					//review.setReview_photo(request.getParameter("review_photo"));
					int result = ReviewService.reviewInsert(review);
					
					
				} else {//폼필드가 아니면 파일 업로드 기능 수행
					System.out.println("파라미터명:" + fileItem.getFieldName());
					System.out.println("파일명:" + fileItem.getName());
					System.out.println("파일크기:" + fileItem.getSize() + "bytes");

					if (fileItem.getSize() > 0) {//업로드한 파일 이름 가져옴
						int idx = fileItem.getName().lastIndexOf("\\");
						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						String fileName = fileItem.getName().substring(idx + 1);//업로드한 파일 이름 가져옴
						
						File uploadFile = new File(currentDirPath + "\\" + fileName);//저장소에 파일 업로드
						fileItem.write(uploadFile);
					} // end if
				} // end if
			} // end for
		} catch (Exception e) {
			e.printStackTrace();
		}
		 		
	}
	
	/*
	 * @Override protected void doPost(HttpServletRequest request,
	 * HttpServletResponse response) throws ServletException, IOException {
	 * 
	 * //리뷰테이블에 입력하기
	 *  request.setCharacterEncoding("utf-8"); 
	 *  String path = getServletContext().getRealPath("."); 
	 *  ReviewService = new ReviewService(path);
	 * 
	 * ReviewVO review = new ReviewVO();
	 * 
	 * //inset
	 * review.setRes_number(Integer.parseInt(request.getParameter("res_number")));
	 * review.setReview_star(Arrays.toString(request.getParameterValues("review_star")));
	 * review.setReview_content(request.getParameter("review_content"));
	 * review.setReview_photo(request.getParameter("review_photo"));
	 * 
	 * int result = ReviewService.reviewInsert(review);
	 * 
	 * if(result > 0) {
	 * response.sendRedirect("list?message=success"); 
	 * } else {
	 * response.sendRedirect("list?message=failed"); }
	 */
		
		
	

}
