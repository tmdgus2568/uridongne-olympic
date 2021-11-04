package review.model;

import java.util.List;

public class ReviewService {
	ReviewDAO reviewDAO;

	//path
	public ReviewService(String path) {
		reviewDAO = new ReviewDAO(path);
	} 
	
	//리뷰쓰기
	public int reviewInsert(ReviewVO review) {
		return reviewDAO.reviewInsert(review);
	} 
	
	/*
	 * //대여정보 public List<ReviewInfoVO> selectInfoReview(){ return
	 * reviewDAO.selectInfoReview(); }
	 */
	
	
}
