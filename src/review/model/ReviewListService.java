package review.model;

import java.util.List;

public class ReviewListService {
	ReviewListDAO reviewlistDAO;

	// path
	public ReviewListService(String path) {
		reviewlistDAO = new ReviewListDAO(path);
	}

	// 리뷰목록 전체 검색
	public List<ReviewListVO> selectAllReview() {
		return reviewlistDAO.selectAllReview();
	}

	// 리뷰 가능 대상자 검색
	public List<ReviewInfoVO> selectPossibleReview() {
		return reviewlistDAO.selectPossibleReview();
	}
}
