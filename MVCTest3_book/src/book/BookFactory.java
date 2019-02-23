package book;

public class BookFactory {
	private static BookFactory instance = new BookFactory();
	private BookFactory() {}
	
	public static BookFactory getInstance() {
		return instance;
	}
	
	public Controller createController(String cmd) {
		Controller cmdIf = null;
		if(cmd.contentEquals("delete")) {
			cmdIf = new DeleteController();
		} else if(cmd.contentEquals("add")) {
			cmdIf = new AddController();
		} else if(cmd.contentEquals("edit")) {
			cmdIf = new EditController();
		} else if(cmd.contentEquals("select")) {
			cmdIf = new SelectController();
		} else if(cmd.contentEquals("list")) {
			cmdIf = new ListController();
		} else if(cmd.contentEquals("find")) {
			cmdIf = new FindController();
		}
		return cmdIf;
	}
}
