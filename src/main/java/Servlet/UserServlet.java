package Servlet;

import java.io.IOException;

import DAO.UserDao;
import Db.DBConnect;
import User.UserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
{
String firstName=request.getParameter("fname");
String lastName=request.getParameter("lname");
String email=request.getParameter("uemail");
String number=request.getParameter("unumber");
String password=request.getParameter("upassword");

UserDetails userDetails=new UserDetails();
userDetails.setFirstNameString(firstName);
userDetails.setLastNameString(lastName);;
userDetails.setEmailString(email);
userDetails.setPhoneString(number);;
userDetails.setPasswordString(password);;
 

UserDao dao=new UserDao(DBConnect.getConnection());
boolean f=dao.addUserDetails(userDetails);
HttpSession session;
if (f) {
	session=request.getSession();
	session.setAttribute("reg-success","Registration successfully");
	response.sendRedirect("register.jsp");
} else {
	session=request.getSession();
	session.setAttribute("failed-msg","OOPs! Something went wrong in Server");
	response.sendRedirect("register.jsp");
}
}
}
