/* Command �� ��üȭ */
package student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandIf {
	public abstract Object processCommand
		(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException;

}
