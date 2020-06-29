<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*;"%> 
<%@ page import = "javax.mail.*;"%>
<%@ page import = "javax.mail.internet.*;"%>
<%@ page import = "javax.mail.internet.InternetAddress;"%>
<%@ page import = "javax.mail.Message;"%>
<%@ page import = "javax.mail.Session;"%>
<%@ page import = "javax.mail.PasswordAuthentication;"%>
<%@ page import = "javax.mail.internet.MimeMessage;"%>
<%@ page import = "javax.mail.Transport,extra.test"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %> 
<html>
    <head>
        <title>BBB</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Exo|Galada|Quicksand" rel="stylesheet">

        <style type="text/css">
            a {
                color: white;
            }	
            .ha:hover {
                background-color: lemonchiffon;
            }
            p {
                font-size: 1em;
                font-family: 'Quicksand', sans-serif;

            }
            .change {

                background-color:khaki;
                font-family: 'Quicksand', sans-serif;
            }

            .pre 
            {
                font-family: Galada;
                letter-spacing: 1px;
                color: gray;
            }
            .prep {

                font-family: Galada;
                letter-spacing: 1px;
                color: brown;
            }
            footer
            {

                position: fixed;
                bottom: 0;
                left: 0;
                width: 100%;   
                background-color:khaki;
                font-family: 'Quicksand', sans-serif;
            }
            .centered
            {
                text-align: center;
                position:absolute;
                top:20%;
                transform: translate(-50%, -50%);
                left:50%; 
                color: white;
                margin-bottom: 30%;
                padding-top: 17%;
                font-family: 'Quicksand', sans-serif;
                text-shadow: 1px 3px 7px #f1f1f1;
                letter-spacing: 2px;
                font-size: 50px
            }

            .overlay {
                position: absolute;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
                height: 100%;
                width: 100%;
                opacity: 0;
                transition: .5s ease;
                background-color: #008CBA;
            }

            .container:hover .overlay {
                opacity: 1;
            }

            .affix
            {

                top:0;
                width:100%;
                z-index:9999 !important;
            }
            .space
            {
                padding-left: 50px;

            }
            .logo{
                margin-top: 6%;
                width: 70px;
                height: 50px;
                margin-bottom: 6%;
            }
            .text {
                color: white;
                font-size: 20px;
                position: absolute;
                top: 50%;
                left: 50%;
                -webkit-transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);
                text-align: center;
            }
            .edits 
            {
                text-align: left;
                position:absolute;
                top:50%;
                transform: translate(-50%, -50%);
                left:20%; 
                color: white;
                margin-bottom: 30%;
                padding-top: 17%;
                font-family: 'Quicksand', sans-serif;
                text-shadow: 1px 3px 7px #f1f1f1;
                letter-spacing: 2px;
                font-size: 45px; 

            }

            img {
                height: 300px;
                width: 300px;
            }
            .thumbnail{

            }
        </style>

    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <nav class="navbar navbar-default" data-spy="affix" data-offset-top="197">
            <div class="change">
                <div class="container">
                    <div class="navbar-header pre">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <div class="navbar navbar-brand">
                            <a href="homepage.jsp"><img src="${pageContext.request.contextPath}/img/logo.png" width=50 height=50 class="logo"></a>
                        </div>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                        <ul class="nav navbar-nav">
                            <li class="ha"><a href="viewresults.jsp">Results</a></li>
                            <li class="ha"><a href="viewannounce.jsp">Dates & Announcements</a></li>

                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="ha"><a href="AboutUs.jsp">About Us</a></li>
                            <li class="ha"><a href="signup.jsp">Sign Up</a></li>
                            <li class="ha"><a href="login.jsp">Login</a></li>
                        </ul>
                    </div>
                </div>
        </nav>
        <script
        src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <div class="container">
            <div class="container" >
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators --> 
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                        <li data-target="#myCarousel" data-slide-to="4"></li>
                        <li data-target="#myCarousel" data-slide-to="5"></li>
                        <li data-target="#myCarousel" data-slide-to="6"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="${pageContext.request.contextPath}/img/22.jpg" alt="Los Angeles" style="width:100%; height:500px;">
                            <div class="centered">BANASTHALI BULLETIN BOARD</div>
                        </div>

                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/art_works_at_west_side_ymca_545b25bc5d617.jpeg" alt="Chicago" style="width:100%; height:500px;">
                            <div class="edits">Visual Arts</div>
                        </div>

                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/chemmm.png" alt="New york" style="width:100%; height:500px;">
                            <div class="edits">Experiments</div>
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/images.png" alt="New york" style="width:100%; height:500px;">
                            <div class="edits">Performing arts</div>
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/chem.jpg" alt="New york" style="width:100%; height:500px;">
                            <div class="edits">Science</div>
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/stack.png" alt="New york" style="width:100%; height:500px;">
                            <div class="edits">Coding</div>
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/write.jpeg" alt="New york" style="width:100%; height:500px;">
                            <div class="edits">Poetry</div>
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="content">
                <br><br><br>

                <%
                    if (true) {
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc", "root", "root");
                            PreparedStatement stmt = con.prepareStatement("Select * from event where eindex=1 ORDER BY e_sdate DESC;");
                            ResultSet rs = stmt.executeQuery();
                            int r = 1;
                            while (rs.next()) {

                %>
                <div class="col-lg-4">
                    <div class="thumbnail">
                        <div style="height:250px; width:345px; " ><img src="<%=rs.getString(10)%>" style="height:100%;width:100%;border-radius: 5%;"></div>
                        <a href="each.jsp?ka=<%=rs.getString(2)%>" <%=rs.getString(2)%>>
                            <h1 align="center" class="prep"><%=rs.getString(2)%></h1></a>
                        <p align="center"><b>Date:</b><%=rs.getString(5)%> </p>
                        <p align="center"><b>Venue:</b><%=rs.getString(3)%></p>
                        <p align="center"><b>Time:</b><%=rs.getTime(4)%></p>
                        <p align="center">
                            <button class="btn btn-info btn-md" name="reg"><a href=" login.jsp">Register Now</a></button>
                            <button class="btn btn-danger btn-md" name="sub"><a href=" login.jsp">Subscribe</a></button> 
                        </p>
                    </div>
                </div>
                <% }
                        } catch (Exception ex) {
                            out.print("exception occurs");
                        }
                    }

                %> 
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <p>.</p>
    <footer class="page-footer font-small stylish-color-dark pt-4">
        <hr>

        <div class="footer-copyright text-center py-3">© 2018 Copyright:
            <a href="https://banasthali.org/banasthali/wcms/en/home/">Banasthali.org</a>
        </div>
    </footer>
</body>
</html>

