<%-- 
    Document   : signup
    Created on : 13 Feb, 2019, 10:55:14 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign up</title>
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
                text-align: center;
                font-family: 'Quicksand', sans-serif;
                text-shadow: 1px 3px 7px #f1f1f1;
                letter-spacing: 2px;
                font-size: 50px;
                margin-left: 10%;
                margin-right: 10%;
            }

            .dh {
                background-color:khaki;
                font-family: 'Quicksand', sans-serif;

            }

            .container {
                padding: 16px;
            }
            img{
                margin-top: 6%;
                width: 70px;
                height: 50px;
            }

            .spac{
                border-collapse: separate;
                border-spacing:50px 15px; 
                margin-left: 20%;
                margin-right: 10%;
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
            img{
                margin-top:4%;
                width: 70px;
                height: 50px;
            }

        </style>
    </head>
    <body>
        <nav>
            <div class="navbar navbar-default dh">
                <div class="container">
                    <div class="navbar-header pre">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2" >
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                            <ul class="nav navbar-nav">

                                <li> <img src="${pageContext.request.contextPath}/img/logo.png"></li>
                                <li><a href="homepage.jsp">
                                        <span class="glyphicon glyphicon-home"></span>
                                    </a></li>
                                <li><a href="login.jsp">Log In</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <script
        src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <div class="jumbotron">
            <form style="border:6px solid #ccc">
                <div class="ss"> Sign up </div>

                <div class="container">
                    <div class="cent">	
                        <table class="spac">
                            <tbody>
                                <tr>
                                    <td align="right">
                                        <strong>ID:</strong>
                                    </td>
                                    <td>
                                        <input type="text" name="id" placeholder="BTBT..." required>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <strong>   Name:</strong>
                                    </td>
                                    <td>
                                        <input type="text" name="name" placeholder=" John Smith" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <label for="username">Email :</label>
                                    </td>
                                    <td>
                                        <input id="username" type="Email" required name="Email" placeholder="your email">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <label for="password">Password:</label>
                                    </td>
                                    <td>
                                        <input id="password" type="password" required name="pword" placeholder="your password">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <label for="cnfpassword">Confirm Password:</label>
                                    </td>
                                    <td>
                                        <input id="cnfpassword" type="password" required name="cpword" placeholder="your password">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="check">I agree to the terms and conditions:</label>
                                    </td>
                                    <td align="left">
                                        <input type="checkbox" name="tandc" id="check" required>
                                    </td>
                                <tr>
                                    <td align="right">
                                        <button class="btn btn-success btn-md" name="btsn">SUBMIT</button>
                                    </td>
                                    <td align="left">
                                        <button class="btn btn-danger btn-md" type="reset">CANCEL</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
        <%
            try {
                String pid = request.getParameter("id");
                String pname = request.getParameter("name");
                String email = request.getParameter("Email");
                String pass = request.getParameter("pword");
                String cpass = request.getParameter("cpword");
                if (request.getParameter("btsn") != null) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?zeroDateTimeBehavior=convertToNull", "root", "root");
                        Statement st = con.createStatement();
                        if (pass.equals(cpass)) {
                            int rs = st.executeUpdate("insert into participant values('" + pid + "','" + pname + "','" + pass + "','" + email + "')");
                            if (rs > 0) {
        %>
        <div class="container">
            <div class="alert alert-success" align="center">
                <strong>You have been registered successfully!</strong>   <a href="adminpage.jsp" class="alert-link">Click here.</a>.
            </div>
        </div>
        <%
        } else {
        %>
        <div class="container">
            <div class="alert alert-success" align="center">
                <strong>sign up again!</strong>   <a href="adminpage.jsp" class="alert-link">Click here.</a>.
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="container">
            <div class="alert alert-success" align="center">
                <strong>Enter the details correctly!</strong>   <a href="homepage.jsp" class="alert-link">Click here.</a>.
            </div>
        </div>
        <%
            }
            con.close();
        } catch (Exception ex) {
        %>
        <div class="container">
            <div class="alert alert-info" align="center"> 
                <%
                    out.print(ex.getMessage());
                %>
                <a href="#" class="alert-link">click here.</a>.
            </div>
        </div>
        <%
                }
            }
        } catch (Exception ex) {
        %>
        <div class="container">
            <div class="alert alert-info" align="center"> 
                <%
                    out.print(ex.getMessage());
                %>
                <a href="#" class="alert-link">click here.</a>
            </div>
        </div>
        <%
            }
        %> 
        <br>
        <br>
        <br>
        <br>
        <br>
        <footer class="page-footer font-small stylish-color-dark pt-4">
            <hr>

            <div class="footer-copyright text-center py-3">© 2018 Copyright:
                <a href="https://mdbootstrap.com/education/bootstrap/">Banasthali.org</a>
            </div>
        </footer>
    </body>
</html>
