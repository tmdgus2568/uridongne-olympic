package member.model;

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

}
