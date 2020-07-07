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

import exam.db.GradeSheet;
import exam.db.Student;
import exam.model.ExamDAO;

/**
 * Servlet implementation class ShowResult
 */
@WebServlet("/exam.controller.ShowResult2")
public class ShowResult2 extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		GradeSheet c = new GradeSheet();				
		
		c.setRegdno(request.getParameter("regd"));
		c.setSem(request.getParameter("sem"));
		c.setSubcode(request.getParameter("code"));
		c.setSubname(request.getParameter("sname"));
		c.setCredit(request.getParameter("credit"));
		c.setGrade(request.getParameter("grade"));
		
		int status = ExamDAO.insertResult(c);
		if (status>0) 
		{			
			response.sendRedirect("addGrade.jsp?msg1=reslut is here && msg2=result also here");
		}
		else 
		{
			response.sendRedirect("addGrade.jsp?msg1=Invalid in showresult2");
		}
	}

}
