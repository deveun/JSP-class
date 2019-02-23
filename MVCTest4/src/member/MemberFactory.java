package member;

public class MemberFactory {
	private static MemberFactory instance = new MemberFactory();
	
	private MemberFactory() {}
	
	public static MemberFactory getInstance() {
		return instance;
	}
	
	public Controller createController(String cmd) {
		Controller controller = null;
		
		if(cmd.equals("/memberSsn.mem")) {
			controller = new MemberSsnController();
		} else if(cmd.equals("/checkMember.mem")) {
			controller = new CheckMemberController();
		} else if(cmd.equals("/member.mem")) {
			controller = new MemberController();
		} else if(cmd.equals("/member_input.mem")) {
			controller = new MemberInputController();
		} else if(cmd.equals("/index.mem")) {
			controller = new IndexController() ;
		} else if(cmd.equals("/memberAll.mem")) {
			controller = new MemberAllController() ;
		} else if(cmd.equals("/member_update.mem")) {
			controller = new MemberUpdateController() ;
		} else if(cmd.equals("/member_delete.mem")) {
			controller = new MemberDeleteController() ;
		} else if(cmd.equals("/member_update_ok.mem")) {
			controller = new MemberUpdateOkController(); 
		}
		
		return controller;
	}
}
