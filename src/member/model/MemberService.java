package member.model;

import java.util.List;

import matching.model.MatCreateJoinVO;
import review.model.ReviewInfoVO;
import review.model.ReviewListVO;

public class MemberService {
	
	MemberDAO dao;
	
	public MemberService(String path) {
		dao = new MemberDAO(path);
	}	
	
	public int memberInsert(MemberVO mem) {
		return dao.memberInsert(mem);
	}

	public MemberVO logincheck(String user_id, String user_pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	public MemberVO kakaoLoginCheck(String user_id) {
		return dao.kakaoLoginCheck(user_id);
	}

	public MemberVO generalLoginCheck(String user_id, String user_pw) {
		return dao.generalLoginCheck(user_id, user_pw);
	}

	public int updateMember(MemberVO mem) {
		return dao.updateMember(mem);
		
	}

	public List<MatCreateJoinVO> matchingCreateInfo(String user_id) {
		return dao.matchingCreateInfo(user_id);
	}

	public List<ReviewListVO> reviewInfo(String user_id) {
		return dao.reviewList(user_id);
	}

}
