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
                    <li class="link">
                        <a href="./adminWelcome.jsp">
                            <span><i class="fas fa-user-graduate"></i> </span>
                            <span class="hidden-sm hidden-xs">&nbsp;&nbsp; Student</span>
                        </a>
                    </li>
                    <li class="link">
                        <a href="./addInstruction.jsp">
                            <span><i class="fas fa-chalkboard-teacher"></i> </span>
                            <span class="hidden-sm hidden-xs">&nbsp;&nbsp; Instruction</span>
                        </a>
                    </li>
                    <li class="link active">
                        <a href="./addGrade.jsp">
                            <span><i class="fas fa-chalkboard-teacher"></i> </span>
                            <span class="hidden-sm hidden-xs">&nbsp;&nbsp; Add Garde</span>
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
                <h1 class="text-center">Add Grade</h1>
                	<form action="exam.controller.AddGrade" method="post">
		                Enter the Student's Regd. no : <input type="text" name="regd"><br><br>
		                Enter the Stream : <input type="text" name="stream"><br><br>
						Enter the Semester : <input type="text" name="sem"><br><br>
		                Enter the Subject : <input type="text" name="subject"><br><br>
		                Enter the Grade : <input type="text" name="grade"><br><br>
		                <input class='btn btn-warning' type="submit" value="Add Grade">
		            </form>
            </div>    
            <!-- main content area end -->
            <div>
            	<%
            		Connection con = null;
            		ResultSet resultset = null;
            		try{

    	            	Class.forName("oracle.jdbc.OracleDriver");
    	    			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","lit");
    	    			String sql ="select * from subjectList";
                	
            		}
	            	catch(Exception e)
	            	{
	            			System.out.println("bhul heuchi kn gote!!!");
	            	}
	            	Statement statement = con.createStatement() ;
	
	                resultset =statement.executeQuery("select * from subjectList") ;
            	%>
            	<center>
				    <h1> Drop down box or select element</h1>
				        <select>
				        <%  while(resultset.next()){ %>
				            <option><%= resultset.getString(2)%></option>
				        <% } %>
				        </select>
				</center>
            </div>
         </div>
    </div>

    
    <jsp:include page="footer.jsp"></jsp:include>

</body>

</html>