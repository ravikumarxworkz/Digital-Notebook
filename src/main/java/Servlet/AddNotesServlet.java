package Servlet;

import java.io.IOException;

import DAO.postDao;
import Db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		postDao dao = new postDao(DBConnect.getConnection());
		boolean f = dao.addNotes(title, content, uid);
		if (f) {
			System.out.println("data inserted successfully");
			response.sendRedirect("showNotes.jsp");
		} else {
			System.out.println("data not inserted successfully.");
		}
	}

}
