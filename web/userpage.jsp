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

        </style>
    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <script language="javascript">
            window.history.forward(-1);
        </script>
        <%
            String u = (String) session.getAttribute("user");
            if (u != null) {
        %>
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
                            <a href="userpage.jsp"><img src="${pageContext.request.contextPath}/img/logo.png" width=50 height=50 class="logo"></a>
                        </div>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                        <ul class="nav navbar-nav">
                            <li class="ha"><a href="viewresultuser.jsp">Results</a></li>
                            <li class="ha"><a href="viewannuser.jsp">Dates & Announcements</a></li>

                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="userpage.jsp">
                                    <span class="glyphicon glyphicon-user"></span>
                                </a>
                            </li>
                                <li style="padding-top: 15px;"><%String nm = (String) application.getAttribute("pname");
          out.print(nm);%></li>
                            <li class="ha"><a href="#">Help</a></li>
                            <li class="ha"><a href="homepage.jsp">Log out</a></li>
                        </ul>
                    </div>
                </div>
        </nav>
        <script
        src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <div class="container">
            <img src="${pageContext.request.contextPath}/img/22.jpg" alt="BANASTHALI BULLETIN BOARD" style="width:1150px; height:300px;">
            <div class="centered">BANASTHALI BULLETIN BOARD</div>
            <br><br><br>
            <%
                if (true) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc", "root", "root");
                        PreparedStatement stmt = con.prepareStatement("Select * from event where eindex=1 ORDER BY e_sdate DESC;");
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {

            %>
            <div class="col-lg-4">
                <div class="thumbnail">
                    <div style="height:250px; width:345px; " ><img src="<%=rs.getString(10)%>" style="height:100%;width:100%;border-radius: 5%;"></div>
                    <a href="eachuser.jsp?ka=<%=rs.getString(2)%>" <%=rs.getString(2)%>>
                        <h1 align="center" class="prep"><%=rs.getString(2)%></h1></a>
                    <p align="center"><b>Date:</b><%=rs.getString(5)%> </p>
                    <p align="center"><b>Venue:</b><%=rs.getString(3)%></p>
                    <p align="center"><b>Time:</b><%=rs.getTime(4)%></p>
                    <p align="center">
                        <button class="btn btn-info btn-md" name="reg"><a href="registration page.jsp">Register</a></button>
                        <input type="submit" class="btn btn-danger btn-md" name="subs"  value="Subscribe">
                    </p>
                </div>
            </div>
            <% }
                    } catch (Exception ex) {
                        out.print("exception occurs");
                    }
                }
                try {

                    String nm1 = (String) application.getAttribute("pemail");
                    test t = new test();
                    t.send(nm1);
                    if (request.getParameter("reg") != null) {
                        response.sendRedirect("registration page.jsp");
                    }
                } catch (Exception ex) {
                    System.out.println(ex);
                }

            %> 
        </div>
        <br>
        <br>
        <br><br><br><br><br><br>
        <br><br>
        <br>
        <br>
        <p>.</p>
        <footer class="page-footer font-small stylish-color-dark pt-4">
            <hr>

            <div class="footer-copyright text-center py-3">© 2018 Copyright:
                <a href="https://banasthali.org/banasthali/wcms/en/home/">Banasthali.org</a>
            </div>
        </footer>
        <%    } else
                response.sendRedirect("login.jsp");
        %>

    </body>
</html>

