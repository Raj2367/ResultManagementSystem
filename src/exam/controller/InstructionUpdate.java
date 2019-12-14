package exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.db.Insruction;
import exam.db.Student;
import exam.model.ExamDAO;

/**
 * Servlet implementation class InstructionUpdate
 */
@WebServlet("/exam.controller.InstructionUpdate")
public class InstructionUpdate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String oldIns = request.getParameter("oldIns");
		String newIns = request.getParameter("newIns");
		
		Insruction c = new Insruction();
		c.setRules(newIns);
		c.setOldIns(oldIns);
		
		int status = ExamDAO.updateInstruction(c);
		
		if(status>0)
		{
			response.sendRedirect("addInstruction.jsp");
		}
		else
		{
			out.print("error in updation");
		}
	}

}
