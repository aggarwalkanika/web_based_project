<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <title>Forms generation</title>
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
                text-shadow: 1px 3px 7px #f7f7f7;
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

            .spac{
                border-collapse: separate;
                border-spacing:50px 15px; 
                margin-left: 35%;
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
                margin-top: 6%;
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
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
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
                                <li><a href="signup.jsp">Sign Up</a></li>
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
                <div class="ss"> Login </div>

                <div class="container">
                    <div class="cent">	
                        <table align="center" class="spac">
                            <tbody>

                                <tr>
                                    <td align="right">
                                        <label for="username">ID :</label>
                                    </td>
                                    <td>
                                        <input id="id" type="text" required name="id" placeholder="your ID">
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
                                        <label>Admin</label>
                                        <input type="radio" name="tt" value="Admin" id="Admin">
                                    </td>
                                    <td align="left">
                                        <label>Participant</label>
                                        <input type="radio" name="tt" value="Participant" id="Participant" checked>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <button class="btn btn-success btn-md" name="btns">LOGIN</button>
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
                String pid = request.getParameter("id");
                String pass = request.getParameter("pword");
                if (request.getParameter("btns") != null) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?zeroDateTimeBehavior=convertToNull", "root", "root");
                        Statement st = con.createStatement();
                        String ra1 = request.getParameter("tt");
                        if (ra1.equals("Admin")) {
                            ResultSet rs = st.executeQuery("select * from admin where a_id='" + pid + "' and a_pass='" + pass + "' ");
                            boolean b = rs.next();
                            if (b) {
                                session.setAttribute("user", pid);
                                response.sendRedirect("adminpage.jsp");

                                String j = rs.getString("a_name");
                                application.setAttribute("name", j);
                            } else {
        %>
        <div class="container">
            <div class="alert alert-success" align="center">
                <strong>Login again!</strong>
            </div>
        </div>
        <%
            }
        } else if (ra1.equals("Participant")) {
            ResultSet rs = st.executeQuery("select * from participant where p_id='" + pid + "' and p_pass='" + pass + "' ");
            boolean b = rs.next();
            if (b) {
                session.setAttribute("user", pid);
                response.sendRedirect("userpage.jsp");

                String n = rs.getString("p_name");
                application.setAttribute("pname", n);
                String n1 = rs.getString("p_email");
                application.setAttribute("pemail", n1);
            } else {
        %>
        <div class="container">
            <div class="alert alert-success" align="center">
                <strong>Login again!</strong>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="container">
            <div class="alert alert-success" align="center">
                <strong>Fill the correct details</strong>
            </div>
        </div>
        <%
                        }
                        con.close();
                    } catch (Exception ex) {
                        out.println(ex);
                    }
                }
            } catch (Exception ex) {
                out.println(ex);
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

