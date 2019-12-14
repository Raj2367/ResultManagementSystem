package exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.db.Student;
import exam.model.ExamDAO;

/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/exam.controller.AddStudent")
public class AddStudent extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String id= request.getParameter("id");
		String name = request.getParameter("name");
		Student c = new Student();
		c.setId(id);
		c.setPassword(name);
		int status = ExamDAO.addStudent(c);
		if (status>0) 
		{
			response.sendRedirect("adminWelcome.jsp");
		} 
		else 
		{
			out.print("error in student addition " +status);	
			response.sendRedirect("adminWelcome.jsp?msg=Error in Student Addition");
		}
	}

}
