package review.model;

import java.util.List;

import member.model.MemberDAO;

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
	
	//리뷰목록 전체 검색
	public List<ReviewListVO> selectAllReview(){
		return reviewDAO.selectAllReview();
	}
}
