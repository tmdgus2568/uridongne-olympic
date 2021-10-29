package review.model;

import java.util.List;

public class ReviewService {
	ReviewDAO reviewDAO = new ReviewDAO();
	
	public List<ReviewVO> selectAllReview(){
		return reviewDAO.selectAllReview();
	}
}
