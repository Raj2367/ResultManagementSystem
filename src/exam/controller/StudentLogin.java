package exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exam.db.Student;
import exam.model.ExamDAO;




@WebServlet("/exam.controller.StudentLogin")
public class StudentLogin extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		Student c = new Student();
		
		c.setId(request.getParameter("id"));
		c.setPassword(request.getParameter("pwd"));
		
		boolean status = ExamDAO.doStudentLogin(c);
		if (status==true) 
		{
			HttpSession session = request.getSession();
			session.setAttribute("name", c.getPassword());
//			response.sendRedirect("adminWelcome.jsp");
			out.print("Result of student will be Here");
		}
		else 
		{
			out.print("Student credential is wrong");
			response.sendRedirect("studentLogin.jsp?msg=Invalid Student Login Credential :( :( :(");
		}
	}
}
