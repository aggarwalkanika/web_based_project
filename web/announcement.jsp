

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%! int counter;%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add announcements</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Exo|Galada|Quicksand|Lobster" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
        <style type="text/css">


            form {

                font-family: Garamond;
                padding: 20px;
                font-size: 1.2em;
            }

            .jumbotron {

                background-color: white;
            }

            .cent {

                text-align: center;
            }

            .ss {

                font-family:'Quicksand',sans-serif;
                text-align: center; 
                font-size:350%;
            }

            .dh {
                background-color: khaki;
                font-family: 'Quicksand',sans-serif;
                background-attachment: fixed;

            }
            .navbar
            {
                position: fixed;
                width: 100%;

            }

            .pre {

                font-family: Galada;
            }
            .container {
                padding: 16px;
            }

            .spac{
                border-collapse: separate;
                border-spacing:50px 15px; 

            }

            /* The Close Button */
            .close {
                color: white;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            img{
                margin-top: 6%;
                width: 70px;
                height: 50px;
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
            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .modal-header {
                padding: 2px 16px;
                background-color: khaki;
                color: white;
            }

            .modal-body {padding: 2px 16px;
                         font-family: Garamond;
                         text-align: center; 
            }

            .modal-footer {
                padding: 2px 16px;
                background-color: khaki;
                color: white;
            }
        </style>
    </head>
    <body>
        <nav>
            <div class="navbar navbar-default dh">
                <div class="container">
                    <div class="navbar-header pre">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                            <ul class="nav navbar-nav">

                                <li> <img src="${pageContext.request.contextPath}/img/logo.png"></li>
                                <li><a href="adminpage.jsp">
                                        <span class="glyphicon glyphicon-home"></span>
                                    </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <br>
        <br>
        <script
        src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <div class="jumbotron">
            <form style="border:6px solid #ccc">
                <div class="ss"> Add an Announcement </div>

                <div class="container">
                    <div class="cent">	
                        <table align="center" class="spac">
                            <tbody>
                                <tr>
                                    <td align="right">
                                        <strong>Announcement Heading:</strong>
                                    </td>
                                    <td>
                                        <input type="text" name="evname" required>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="right">
                                        <strong>Description:</strong>
                                    </td>
                                    <td>
                                        <input type="text" name="edes" required>
                                    </td>
                                </tr>


                                <tr>
                                    <td align="right">
                                        <button id="myBtn" class="btn btn-success btn-md" name="btns">SUBMIT</button>
                                    </td>
                                    <td align="left">
                                        <button class="btn btn-danger btn-md" type="reset">CANCEL</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>
        <%
            try {
                String evn = request.getParameter("evname");
                String des = request.getParameter("edes");
                if (request.getParameter("btns") != null) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?zeroDateTimeBehavior=convertToNull", "root", "root");
                        PreparedStatement psmt = con.prepareStatement("insert into announcement values(?,?,?)");
                        ResultSet r = psmt.executeQuery("SELECT COUNT(*) AS rowcount FROM announcement");
                        r.next();
                        counter = r.getInt("rowcount");
                        psmt.setString(1, evn);
                        psmt.setInt(2, ++counter);
                        psmt.setString(3, des);
                        int x = psmt.executeUpdate();
                        if (x > 0) {%>

        <div class="container">
            <div class="alert alert-success" align="center">
                <strong>The announcement has been added to the database successfully!</strong>   <a href="adminpage.jsp" class="alert-link">Click here.</a>.
            </div>
        </div>
        <%
        } else {
        %>
        <div class="container">
            <div class="alert alert-danger">
                <strong>The data could not be added.</strong> <a href="#" class="alert-link">Click here.</a>.
            </div>
        </div>
        <%
            }
        } catch (Exception ex) {

        %>
        <div class="container">
            <div class="alert alert-info" align="center"> 
                <%        out.print(ex.getMessage());
                %>
                <a href="#" class="alert-link">Click here.</a>.
            </div>
        </div>
        <%
                }
            }
        } catch (Exception ex) {

        %>
        <div class="container">
            <div class="alert alert-info" align="center"> 
                <%        out.print(ex.getMessage());
                %>
                <a href="#" class="alert-link">click here.</a>.
            </div>
        </div>
        <%
            }
        %>
        <footer class="page-footer font-small stylish-color-dark pt-4">
            <hr>

            <div class="footer-copyright text-center py-3">© 2018 Copyright:
                <a href="https://mdbootstrap.com/education/bootstrap/">Banasthali.org</a>
            </div>
        </footer>
    </body>
</html>
