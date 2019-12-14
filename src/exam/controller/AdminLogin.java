package exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exam.db.Admin;
import exam.db.Student;
import exam.model.ExamDAO;




@WebServlet("/exam.controller.AdminLogin")
public class AdminLogin extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		Admin a = new Admin();
		
		a.setId(request.getParameter("aid"));
		a.setPassword(request.getParameter("apwd"));
		
		boolean status = ExamDAO.doAdminLogin(a);
		if (status==true) 
		{
			System.out.println("baba sabu thik");
			HttpSession session = request.getSession();
			session.setAttribute("aid", a.getId());
			response.sendRedirect("adminWelcome.jsp");
		}
		else 
		{
			out.print("Admin credential is wrong");
			response.sendRedirect("adminLogin.jsp?msg=Invalid Admin Login Credential :( :( :(");
		}
	}
}
