package member.model;

public class MemberService {
	
	MemberDAO dao;
	
	public MemberService(String path) {
		dao = new MemberDAO(path);
	}	
	
	public int memberInsert(MemberVO mem) {
		return dao.memberInsert(mem);
	}

}
