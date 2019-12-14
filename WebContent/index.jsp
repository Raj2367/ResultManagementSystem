<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <%-- Required meta tags --%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Welcome to CET-Result-List</title>

    <%-- Bootstrap CSS --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
     integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="ind.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>

<body>
    <%-- nav start --%>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#"><img src="logo.png" height="40" width="40" alt="">CET, Bhubaneswar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <br><br><br>
    </nav>
    <%-- nav end --%>
    <div style="margin-left: 20px">
    	<font color="red">
				<%
					if(request.getParameter("msg") != null)
						out.print(request.getParameter("msg"));
				%>
		</font>
    </div>
    <%-- heading --%>
    <div class="heading">
        <h2 class="display-4 text-center"><marquee behavior="" direction="">Welcome To College Of Engineering & Technology Examination</marquee></h2>
    </div>
    <%-- heading --%>

    <%-- slider --%>
    <div id="demo" class="carousel slide" data-ride="carousel">
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="http://www.prameyanews.com/wp-content/uploads/2018/09/cet.jpg"
                    alt="CET" width="1100" height="500">
                <div class="carousel-caption">
                    <h3>CET</h3>
                    <p>Portal for Result List</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://www.indcareer.com/files/photos/2015/10/images-college-engineering-technology-cet-bhubaneswar-2."
                    alt="Chicago" width="1100" height="500">
                <div class="carousel-caption">
                    <h3>CET</h3>
                    <p>Portal for Result List</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://images.shiksha.com/mediadata/images/1519216655phpHDt6VH.png"
                    alt="Chicago" width="1100" height="500">
                <div class="carousel-caption">
                    <h3>CET</h3>
                    <p>Portal for Result List</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
    <%-- slider end --%>
    <br>
    <%-- Department & Subject Name --%>
    <div class="display-4 text-center"><h1>Portal for CET's Students Result</h1></div><br>
    <div class="container">
        <%-- List --%>
        <div class="jumbotron">
            <div class="row">
                <div class="col-8">
                    <div class="list-group" id="list-tab" role="tablist">
                        <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list"
                            href="#list-home" role="tab" aria-controls="home">Department Name</a>
                    </div>
                </div>
                <div class="col-4">
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
                            <div class="text-center">
                                <h3>Subject Name</h3>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">This is
                            first</div>
                        <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">...</div>
                        <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">...</div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <br>

    <div class="container">
        <div class="row">
            <div class="col-sm text-center">
                <button class="button" onclick="window.location.href = 'studentLogin.jsp';"><span style="vertical-align:middle"><i class="fas fa-user-graduate"></i> Login as Student</span></button>
            </div>
            <div class="col-sm text-center">
                <button class="button" onclick="window.location.href = 'adminLogin.jsp';"><span style="vertical-align:middle"><i class="fas fa-users-cog"></i> Login as Administrator</span></button>
            </div>
        </div>
    </div>
    <br><br>


   
        <jsp:include page="footer.jsp"></jsp:include>

    <%-- Optional JavaScript --%>
    <%-- jQuery first, then Popper.js, then Bootstrap JS --%>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>