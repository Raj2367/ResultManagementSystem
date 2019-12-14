package exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.db.Insruction;
import exam.model.ExamDAO;

/**
 * Servlet implementation class AddInstruction
 */
@WebServlet("/exam.controller.AddInstruction")
public class AddInstruction extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String rules = request.getParameter("instruction");

		Insruction c = new Insruction();
		c.setRules(rules);
		int status = ExamDAO.addInstruction(c);
		if (status>0) 
		{
			response.sendRedirect("addInstruction.jsp");
		} 
		else 
		{
			out.print("error in question addition");
		}
	}

}
