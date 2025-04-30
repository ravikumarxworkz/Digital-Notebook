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

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
Integer noteIdInteger=Integer.parseInt(request.getParameter("note_id"));
postDao poDao=new postDao(DBConnect.getConnection());
boolean f=poDao.deleteNotes(noteIdInteger);
HttpSession session=null;
if (f) {
 session=request.getSession();
	session.setAttribute("updateMsg","Notes Deleted Successfully..");
	response.sendRedirect("showNotes.jsp");
	
}else {
	session=request.getSession();
session.setAttribute("wrongMsg", "OOps! SOmething went wrong on the server..");
response.sendRedirect("showNotes.jsp");
}
	}

}
