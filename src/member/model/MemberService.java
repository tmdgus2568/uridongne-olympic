package member.model;

public class MemberService {

	public int memberInsert(MemberVO mem) {
		MemberDAO dao = new MemberDAO();
		return dao.memberInsert(mem);
	}

}
