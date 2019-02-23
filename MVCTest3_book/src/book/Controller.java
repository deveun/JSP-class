package book;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	public abstract Object processController
	(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException;
}
