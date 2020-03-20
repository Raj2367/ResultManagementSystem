
<%@page import="java.sql.*,exam.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<%
		if(request.getParameter("msg") != null)
			response.sendRedirect("index.jsp?msg=Please do login before proceed! ! ! :)");
	%>
    <div class="container-fluid display-table">
        <div class="row display-table-row">
            <!-- Side menu -->
            <div class="col-md-2 display-table-cell" id="side-menu">
                <div class="text-center">
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
                    <li class="link active">
                        <a href="./addInstruction.jsp">
                            <span><i class="fas fa-chalkboard-teacher"></i> </span>
                            <span class="hidden-sm hidden-xs">&nbsp;&nbsp; Instruction</span>
                        </a>
                    </li>
                    <li class="link">
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
                <h1 class="text-center">Instruction List</h1>
                <div class="clearfix" style="margin-right: 20px;">
                    <button type="button" class="btn btn-success btn-lg float-right" data-toggle="modal" data-target="#AddModal">Add Instruction</button>
                </div>

                <div class="student-list text-center">
                    <%
							ResultSet rs = ExamDAO.showInstruction();
							if (rs != null) 
							{
								try {
									ResultSetMetaData rsmd = rs.getMetaData();
									out.print("<table class='table table-striped'>");
									out.print("<thead><tr>");
									for (int j = 1; j <= rsmd.getColumnCount(); j++) 
									{
										out.print("<th>"+rsmd.getColumnName(j)+"</th>");
									}
									out.print("</tr></thead><tbody>");
									while (rs.next()) 
									{
										out.print("<tr>");
										for (int j = 1; j <= rsmd.getColumnCount(); j++) 
										{
											out.print("<td>"+rs.getString(j)+"</td>");
										}
										
										String idd = rs.getString(1);
										
									%>
										<td><button class='btn btn-warning' data-toggle='modal' onclick="updateId('<% out.print(idd); %>')" data-target="#UpdateModal">Update</button></td>
					
										 <td><input type="submit" class='btn btn-danger' data-toggle='modal' onclick="deleteId('<% out.print(idd); %>')" data-target="#DeleteModal" name="id" value="Delete"></td>
									<%
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
					%>
                </div>
                
            </div>
            <!-- main content area end -->
        </div>
    </div>

    <!-- Add Instruction Model -->
    <div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add New Instruction</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="exam.controller.AddInstruction" method="post">
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Instruction</label>
                            <input type="text" class="form-control" name="instruction" id="recipient-name">
                        </div>
                        <!-- <div class="form-group">
                            <label for="text" class="col-form-label">Name :</label>
                            <input type="text" class="form-control" id="recipient-name">
                        </div> -->
                        <input type="submit" class="btn btn-primary" value="Add instuction">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <!-- <button type="button" class="btn btn-primary">Add instuction</button> -->
                </div>
            </div>
        </div>
    </div>
	
	    <!-- Update student Model -->
    <div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Update Instruction</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="exam.controller.InstructionUpdate" method="post">
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Previous Instruction :</label>
                            <input type="text" class="form-control" name="oldIns" id="stdid" readonly>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-form-label">New Instruction :</label>
                            <input type="text" class="form-control" name="newIns">
                        </div>
                        <input type="submit" class="btn btn-primary" value="Update">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    
                </div>
            </div>
        </div>
    </div>
    
    <!-- Delete Instruction Model -->
    <div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to delete?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    	<form action="exam.controller.InstructionDelete" method="post">
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Instruction :</label>
                            <input type="text" class="form-control" name="ins" id="stdidd" readonly>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Delete from Database">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    
                </div>
            </div>
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
       		console.log(id);
   			document.getElementById("stdid").value = id;
	   	}
	   	
	   	function deleteId(id) {
	   		document.getElementById("stdidd").value = id;
	   	}
       </script>
</body>

</html>