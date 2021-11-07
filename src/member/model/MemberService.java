package member.model;

import java.sql.Date;
import java.util.List;

import matching.model.MatCreateJoinVO;
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
		return dao.reviewInfo(user_id);
	}

	public List<ResInfoVO> resInfo(String user_id) {
		return dao.resInfo(user_id);
	}

	public List<MatCreateJoinVO> matchingApplyInfo(String user_id) {
		return dao.matchingApplyInfo(user_id);
	}

	public int cancelMatching(int mat_id, Date date, int res_number) {
		return dao.cancelMatching(mat_id, date, res_number);
	}

	public int idCheck(String user_id) {
		return dao.idCheck(user_id);
	}

	public int cancelReserve(int res_number, Date date) {
		return dao.cancelReserve(res_number, date);
	}

	public int cancelMatchingApply(int mat_id, String user_id, int together, Date date) {
		return dao.cancelMatchingApply(mat_id, user_id, together, date);
	}

	public int changeMatchingApply(int mat_id, String user_id, int together, Date date, int newtogether) {
		return dao.changeMatchingApply(mat_id, user_id, together, date, newtogether);
	}

}
