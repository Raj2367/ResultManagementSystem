<%@page import="java.sql.*,exam.model.*,exam.db.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! int status=0; %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Welcome Administrator</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <link rel="stylesheet" href="admin.css">
</head>

<body>
	
    <div class="container-fluid display-table">
        <div class="row display-table-row">
            <!-- Side menu -->
            <div class="col-md-2 display-table-cell" id="side-menu">
                <div class="text-center" id='printMe1'>
                    <img src="logo.png" width="60" height="60" alt="">
                    <h1>College Of Engineering And Technology</h1>
                </div>
                <ul>
                    <li class="link active">
                        <a href="./adminWelcome.jsp">
                            <span><i class="fas fa-user-graduate"></i> </span>
                            <span class="hidden-sm hidden-xs">&nbsp;&nbsp; Student</span>
                        </a>
                    </li>                    
                    <li class="link">
                        <a href="./addGrade.jsp">
                            <span><i class="fas fa-chalkboard-teacher"></i> </span>
                            <span class="hidden-sm hidden-xs">&nbsp;&nbsp; Add Grade</span>
                        </a>
                    </li>
                    <li class="link">
                        <a href="./addInstruction.jsp">
                            <span><i class="fas fa-chalkboard-teacher"></i> </span>
                            <span class="hidden-sm hidden-xs">&nbsp;&nbsp; Instruction</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- Side menu end-->

            <!-- main content area -->
            <div class="col-md-10 display-table-cell box">
                <header id="nav-header" class="clearfix" style="background: #e8e9eb;">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="#"> Welcome <%out.print(session.getAttribute("aid"));%></a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                        
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav ml-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="index.jsp?msg=Logout successfully :)">Logout <i class="fas fa-sign-out-alt"></i><span class="sr-only">(current)</span></a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                </header>
                <!-- header close -->
                <br>
                <h1 class="text-center">Mark Sheet</h1>
				
                <div class="student-list text-center">
	             <form action="exam.controller.ShowResult" method="post">   
	                Enter the Student's Regd. no : <input type="text" name="regd"><br><br>
	                Enter the Semester : <input type="text" name="sem"><br><br>
	                <input class='btn btn-warning' type="submit" value="Show Result">
	                <br>
	             </form>
	             <div id='printMe'>
                    <%
                    	if(request.getParameter("msg1") != null)
                    	{
                    		ResultSet rs=null;
                    		ResultSetMetaData rsmd =null;
                    		try 
                    		{
                    			Connection conn = Provider.getOracleConnection();
                    			String regd=(String) session.getAttribute("regd");
                    			String sem= (String)session.getAttribute("sem");
                    			System.out.println(sem);
                    			String sql = "select name,regd_no,subcode,subject,credits,grade,sgpa_2nd from gradesheet where regd_no = '"+regd+"' and sem = '"+sem+"'";
                    			Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                    			rs = st.executeQuery(sql);
                    		}
                    		catch (Exception e) 
                    		{
                    			e.printStackTrace();
                    		}
                    		
                    		if(rs.next()) 
                    		{
                    			out.print("<br><br>Name : <b>"+rs.getString(1)+"</b><br><br>");
                    			out.print("Regd No : <b>"+rs.getString(2)+"</b>");
                    		}
                    		rs.previous();
                    		
							if (rs != null) 
							{
								try {
									rsmd = rs.getMetaData();
									out.print("<br><table class='table table-striped'>");
									out.print("<thead><tr>");
									for (int j = 3; j <= rsmd.getColumnCount()-1; j++) 
									{
										out.print("<th>"+rsmd.getColumnName(j)+"</th>");
									}
									out.print("</tr></thead><tbody>");
									
									
							
									while (rs.next()) 
									{
										
										out.print("<tr>");
										for (int j = 3; j <= rsmd.getColumnCount()-1; j++) 
										{
											out.print("<td>"+rs.getString(j)+"</td>");
										}
										out.print("</tr>");
							
									}
									out.print("</tbody></table>");
								} 
								catch (SQLException e) 
								{
									out.print("<br>error in ShowComplain rs.next()");
									e.printStackTrace();
								}
							}
							else 
							{
								out.print("error...");
							}
							if(rs.previous()) 
							{
								out.print("SGPA :<b> "+rs.getString(rsmd.getColumnCount())+"</b>");
							}
							
                    	}
					%>
					</div>
                </div>    
                <%
                	if(request.getParameter("msg1") != null)
                	{
                %>
                	<input type="button" class="btn btn-success btn-lg float-right" onclick="printDiv('printMe');" value="Print Mark sheet">
                <%
                	}
                %>
            </div>
            <!-- main content area end -->
        </div>
    </div>

    
    <jsp:include page="footer.jsp"></jsp:include>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    
    <script>
    	function updateId(id) { 		
    		document.getElementById("stdid").value = id;
    	}
    	
    	function deleteId(id) {
    		document.getElementById("stdidd").value = id;
    	}   
    	function printDiv(divName){
			var printContents = document.getElementById(divName).innerHTML;
			var originalContents = document.body.innerHTML;
			document.body.innerHTML = printContents;
			window.print();
			document.body.innerHTML = originalContents;
		}
    </script>
</body>

</html>