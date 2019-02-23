//FACTORY PATTERN
package student;

public class StudentFactory {
	private static StudentFactory instance = new StudentFactory();
	//SINGLE TONE (생성자를 private로)
	private StudentFactory() {}
	
	public static StudentFactory getInstance() {
		return instance;
	}
	
	
	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		if (cmd.equals("insert")) {
			cmdIf = new InsertCommand();
		}else if (cmd.equals("delete")) {
			cmdIf = new DeleteCommand();
		}else if (cmd.equals("find")) {
			cmdIf = new FindCommand();
		}else if (cmd.equals("list")) {
			cmdIf = new ListCommand();
		}else if (cmd.equals("start")) {
			cmdIf = new StartCommand();
		}
		return cmdIf;
	}
}



