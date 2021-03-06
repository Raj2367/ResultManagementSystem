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
 * Servlet implementation class InstructionDelete
 */
@WebServlet("/exam.controller.InstructionDelete")
public class InstructionDelete extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		Insruction c = new Insruction();

		//code for delete will be here
		
		String ins = request.getParameter("ins");
		c.setRules(ins);;
		
		int status = ExamDAO.deleteInstruction(c);
		
		if(status>0)
		{
			response.sendRedirect("addInstruction.jsp");
		}
		else {
			out.print("error in deletion");
		}
	}

}
