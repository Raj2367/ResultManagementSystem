package exam.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import exam.db.Student;
import exam.db.Admin;
import exam.db.GradeSheet;
import exam.db.Insruction;
import exam.db.Provider;

public class ExamDAO {

	public static boolean doStudentLogin(Student c) 
	{
		boolean status = false;
		Connection con =null;
		try 
		{
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","lit");
			String sql ="select * from students where id=? and name=?";
			PreparedStatement pst = con.prepareStatement(sql);
			System.out.println(pst);
	
			 pst.setString(1, c.getId()); 
			 System.out.println(c.getId());
			 System.out.println(c.getPassword()); 
			 pst.setString(2, c.getPassword());
			 
			ResultSet rs = pst.executeQuery();
			if(rs.next()) 
			{
				status=true;
				System.out.println("status is "+ status);
			}
		}
		catch (Exception e) 
		{
			status=false;
			e.printStackTrace();
		}
		return status;
	}

	public static boolean doAdminLogin(Admin a) {
		
		boolean status = false;
		Connection con =null;
		try 
		{
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","lit");
			String sql ="select * from admin where id=? and password=?";
			PreparedStatement pst = con.prepareStatement(sql);
			System.out.println(pst);
			
			 pst.setString(1, a.getId());
			 System.out.println(a.getId());
			 System.out.println(a.getPassword()); 
			 pst.setString(2, a.getPassword());
			 
			ResultSet rs = pst.executeQuery();
			if(rs.next()) 
			{
				status=true;
				System.out.println("status is "+ status);
			}
		}
		catch (Exception e) 
		{
			status=false;
			e.printStackTrace();
		}
		return status;
	}
	public static ResultSet showComplains()
	{
		ResultSet rs=null;
		try {
			Connection conn = Provider.getOracleConnection();
			String sql = "select * from GRADESHEET";
			Statement st = conn.createStatement();
			rs = st.executeQuery(sql);
			return rs;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return rs;
		
	}
	public static ResultSet showInstruction()
	{
		ResultSet rs=null;
		try {
			Connection conn = Provider.getOracleConnection();
			String sql = "select * from instruction";
			Statement st = conn.createStatement();
			rs = st.executeQuery(sql);
			return rs;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return rs;
		
	}
	public static ResultSet showQuestion()
	{
		ResultSet rs=null;
		try {
			Connection conn = Provider.getOracleConnection();
			String sql = "select * from questions";
			Statement st = conn.createStatement();
			rs = st.executeQuery(sql);
			return rs;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return rs;
		
	}

	public static int addStudent(Student c) 
	{
		int status = 0;
		try 
		{
			Connection conn = Provider.getOracleConnection();
			String sql = "insert into students values(?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c.getId());
			pst.setString(2, c.getPassword());
			status = pst.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			status = -1;
		}
		return status;
		
	}

	

	public static int addInstruction(Insruction c) {
		int status = 0;
		try 
		{
			Connection conn = Provider.getOracleConnection();
			String sql = "insert into instruction values(?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c.getRules());
			status = pst.executeUpdate();
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
	}

	public static int updateStudent(Student c) 
	{
		int status = 0;
		try 
		{
			Connection conn = Provider.getOracleConnection();
			String sql = "update students set name=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(2, c.getId());
			pst.setString(1, c.getPassword());
			
			status = pst.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
	}

	public static int delete(Student c) 
	{
		int status = 0;
		try 
		{
			Connection conn = Provider.getOracleConnection();
			String sql = "delete from students where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c.getId());
			status = pst.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
	}

	public static int updateInstruction(Insruction c) 
	{
		int status = 0;
		try 
		{
			Connection conn = Provider.getOracleConnection();
			String sql = "update instruction set rules=? where rules=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c.getRules());
			pst.setString(2, c.getOldIns());
			
			status = pst.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
	}

	public static int deleteInstruction(Insruction c) 
	{
		int status = 0;
		try 
		{
			Connection conn = Provider.getOracleConnection();
			String sql = "delete from instruction where rules=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1,c.getRules());
			status = pst.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
	}

	public static ResultSet showResult(GradeSheet c) {
		
		ResultSet rs=null;
		try {
			Connection conn = Provider.getOracleConnection();
			String regd=c.getRegdno();
			String sem= c.getSem();
			System.out.println(sem);
			String sql = "select * from gradesheet where regd_no = '"+regd+"' and sem = '"+sem+"'";
			Statement st = conn.createStatement();
			rs = st.executeQuery(sql);
			return rs;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return rs;

	
	}
	

}

