package exam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exam.db.subjectList;
import exam.model.ExamDAO;

/**
 * Servlet implementation class ShowResult
 */
@WebServlet("/exam.controller.AddGrade")
public class AddGrade extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		subjectList c = new subjectList();
		
		c.setStream(request.getParameter("stream"));
		c.setSemester(request.getParameter("sem"));
		
		
//		c.setSubjects(request.getParameter("subject"));
//		c.setCredits(request.getParameter("grade"));
//		
//		ResultSet status = ExamDAO.showResult(c);
//		if (status!=null) 
//		{
//			HttpSession session = request.getSession();
//			session.setAttribute("regd", c.getRegdno());
//			session.setAttribute("sem", c.getSem());
//			
//			response.sendRedirect("adminWelcome.jsp?msg1=reslut is here");
//		}
//		else 
//		{
//			out.print("Student credential is wrong");
//			response.sendRedirect("adminWelcome.jsp?msg=Invalid Student Login Credential :( :( :(");
//		}
	}

}
