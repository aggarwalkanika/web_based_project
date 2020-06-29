<%-- 
    Document   : adminpage
    Created on : 16 Feb, 2019, 11:22:54 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<html>
    <head>
        <title>BBB</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Exo|Galada|Quicksand" rel="stylesheet">

        <style type="text/css">
            a {
                color: white;
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
                top:10%;
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

            .container:hover.overlay {
                opacity: 1;
            }
            .logo{
                margin-top: 6%;
                width: 70px;
                height: 50px;
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

            .ha:hover {
                background-color: lemonchiffon;
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

            .fixing
            {
                width: 350px;
                height: 300px;
            }
            #yourContainer {
                width: 350px;
                height: 300px;
            }

            #yourContainer img {
                max-width: 100%;
                max-height: 100%;
            }
        </style>
    </head>
    <body>
        <script language="javascript">
            window.history.forward();
        </script>
        <%
            String u = (String) session.getAttribute("user");
            if (u != null) {
        %>
        <nav class="navbar navbar-default navbar-fixed-top" data-spy="affix" data-offset-top="197">
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
                            <a href="#"><img src="${pageContext.request.contextPath}/img/logo.png" width=50 height=50 class="logo"></a>
                        </div>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Events
                                    <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li class="ha"><a href="ADMINADDEVENT.jsp">Add</a></li>
                                    <li class="ha"><a href="update event.jsp">Update</a></li>
                                    <li class="ha"><a href="delete event.jsp">Delete</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Announcements
                                    <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li class="ha"><a href="announcement.jsp">Add</a></li>
                                    <li class="ha"><a href="viewannadmin.jsp">View</a></li>
                                    <li class="ha"><a href="deleteann.jsp">Delete</a></li>  
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Results
                                    <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li class="ha"><a href="winners.jsp">Add</a></li>
                                    <li class="ha"><a href="viewresultadd.jsp">View</a></li>
                                    <li class="ha"><a href="deleteresult.jsp">Delete</a></li>

                                </ul>
                            </li>


                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#">
                                    <span class="glyphicon glyphicon-user"></span>
                                </a>
                                </li><li style="padding-top: 15px;"><%String nm = (String) application.getAttribute("name");
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
        <br><br><br>
        <br>
        <br>

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
                    <a href="eachadmin.jsp?ka=<%=rs.getString(2)%>" <%=rs.getString(2)%>>
                        <h1 align="center" class="prep"><%=rs.getString(2)%></h1></a>
                    <p align="center"><b>Date:</b><%=rs.getString(5)%> </p>
                    <p align="center"><b>Venue:</b><%=rs.getString(3)%></p>
                    <p align="center"><b>Time:</b><%=rs.getTime(4)%></p>
                </div>
            </div>
            <% }
                    } catch (Exception ex) {
                        out.print("exception occurs");
                    }
                }

            %> 
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <p> End of page </p>
        <footer class="page-footer font-small stylish-color-dark pt-4">
            <hr>

            <div class="footer-copyright text-center py-3">© 2018 Copyright:
                <a href="www.banastali.org">Banasthali.org</a>
            </div>
        </footer>
        <%    } else
                response.sendRedirect("login.jsp");
        %>
    </body>
</html>
