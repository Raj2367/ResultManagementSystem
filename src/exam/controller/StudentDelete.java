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
 * Servlet implementation class StudentDelete
 */
@WebServlet("/exam.controller.StudentDelete")
public class StudentDelete extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		Student c = new Student();

		//code for delete will be here
		
		String id = request.getParameter("id");
		c.setId(id);
		int status = ExamDAO.delete(c);
		
		if(status>0)
		{
			response.sendRedirect("adminWelcome.jsp");
		}
		else {
			out.print("error in deletion");
		}
	}

}
