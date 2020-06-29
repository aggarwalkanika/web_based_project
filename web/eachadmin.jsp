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
            .navbar
            {
                position: fixed;
                width:100%;
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
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                            <ul class="nav navbar-nav navbar-right">
                                <li><img src="${pageContext.request.contextPath}/img/logo.png" width=50 height=50></li>
                                <li><a href="adminpage.jsp">
                                        <span class="glyphicon glyphicon-home"></span>
                                    </a></li>

                            </ul>
                        </div>
                    </div>
                </div>
        </nav>
        <br>
        <br>
        <br>
        <br>
        <script
        src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <%
            if (true) {
                String param1 = request.getParameter("ka");
                session.removeAttribute("param1");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc", "root", "root");
                    PreparedStatement stmt = con.prepareStatement("Select * from event where e_name=?");
                    stmt.setString(1, param1);
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
        %>
       <div class="container">
            <img src="<%=rs.getString(10)%>" style="width:1150px; height:300px;">
            <div class="centered"><%=rs.getString(2)%></div>
            <br><br><br>
            <p align="center"><b>Event ID:  </b><%=rs.getString(1)%></p>
            <br>
            <p align="center"><b>Start Date:  </b><%=rs.getString(5)%> </p>
            <br>
            <p align="center"><b>End Date: </b><%=rs.getString(6)%></p>
            <br>
            <p align="center"><b>Venue: </b><%=rs.getString(3)%></p>
            <br>
            <p align="center"><b>Time: </b><%=rs.getTime(4)%></p>
            <br>
            <p align="center"><b>Type:  </b><%=rs.getString(7)%></p>
            <br>
            <p align="center"><b>Description:  </b><%=rs.getString(8)%></p>
            <br>
        </div>
        <% }
                } catch (Exception ex) {
                    out.print("exception occurs");
                }
            }
        %> 
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

    </body>
</html>

