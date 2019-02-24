package board;

public class BoardFactory {
	private static BoardFactory instance = new BoardFactory();
	
	private BoardFactory() {}
	
	public static BoardFactory getInstance() {
		return instance;
	}
	
	public Controller createController(String cmd) {
		Controller controller = null;
		
		if(cmd.equals("/list.board")) {
			controller = new BoardListController(); 
		} else if(cmd.equals("/.board")) {
			controller = new BoardListController();
		}
		return controller;
	}
}