<%-- 
    Document   : winners
    Created on : 25 Feb, 2019, 10:59:10 PM
    Author     : Kanika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Winners list</title>
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

            .navbar
            {
                position: fixed;
                width: 100%;
            }
            img{
                margin-top: 6%;
                width: 70px;
                height: 50px;
            }

            .ss {

                font-family:'Quicksand',sans-serif;
                text-align: center; 
                font-size:350%;
            }

            .dh {
                background-color: khaki;
                font-family: 'Quicksand',sans-serif;
                background-position: fixed;

            }

            .pre {

                font-family: Galada;
            }
            .container {
                padding: 16px;
                background-attachment: fixed;
            }

            .spac{
                border-collapse: separate;
                border-spacing:50px 15px; 

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

        </style>

        <script>
            function myFunction() {
                var txt;
                confirm("Winner added successfully");
            }
        </script>
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
                            <ul class="nav navbar-nav navbar-right">
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
            <form style="border:6px solid #ccc" method="post">
                <div class="ss"> Results </div>

                <div class="container">
                    <div class="cent">	
                        <table align="center" class="spac">
                            <tbody>
                                <tr>
                                    <td align="right">
                                        <strong>Event id:</strong>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="wid" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <strong>Event name:</strong>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="wev" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <strong>Winner:</strong>
                                    </td>
                                    <td align="left">
                                        <textarea rows="4" cols="20" name="wlist"></textarea>
                                    </td>
                                </tr>



                                <tr>
                                    <td align="right">
                                        <button class="btn btn-success btn-md" name="btns">SUBMIT</button>
                                    </td>
                                    <td align="left">
                                        <button class="btn btn-danger btn-md">CANCEL</button>              
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>
        <% try {
                String eventid = request.getParameter("wid");
                String eventname = request.getParameter("wev");
                String content = request.getParameter("wlist");
                if (request.getParameter("btns") != null) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?zeroDateTimeBehavior=convertToNull", "root", "root");
                        PreparedStatement psmt = con.prepareStatement("insert into winners values(?,?,?)");
                        psmt.setString(1, eventid);
                        psmt.setString(2, eventname);
                        psmt.setString(3, content);
                        int x = 0;
                        PreparedStatement psmt1 = con.prepareStatement("SELECT * FROM event e where e_id=? and e_name=?;");
                        psmt1.setString(1, eventid);
                        psmt1.setString(2, eventname);
                        ResultSet r1 = psmt1.executeQuery();
                        if (r1.next()) {
                            x = psmt.executeUpdate();
                        }
                        if (x > 0) {
        %>

        <div class="container">
            <div class="alert alert-success" align="center">
                <strong>The Result has been added to the database successfully!</strong>   <a href="adminpage.jsp" class="alert-link">Click here.</a>.
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
            con.close();
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
                <a href="#" class="alert-link">Click here.</a>.
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
