package Servlet;

import java.io.IOException;

import DAO.postDao;
import Db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Integer noteIdInteger =Integer.parseInt(request.getParameter("noteId"));
			
			String titleString = request.getParameter("title");
			String contentString = request.getParameter("content");

			postDao pDao = new postDao(DBConnect.getConnection());
			boolean f = pDao.PostUpdate(titleString,contentString,noteIdInteger);
			if (f) {
				System.out.println("data updated successfully");
				HttpSession session = request.getSession();
				session.setAttribute("updateMsg", "Note Updated Successfully...");
				response.sendRedirect("showNotes.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("wrongMsg", "oops! Something went wrong on the server...");
				response.sendRedirect("showNotes.jsp");
			}

		} catch (NumberFormatException ne) {
			ne.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
