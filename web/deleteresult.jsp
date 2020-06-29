<%@page import="java.io.FileInputStream"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Remove events</title>
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
            .navbar
            {
                position: fixed;
                width:100%;
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
                                <li><img src="${pageContext.request.contextPath}/img/logo.png" width=50 height=50></li>
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
                <div class="ss"> Delete Results</div>

                <div class="container">
                    <div class="cent">	
                        <table align="center" class="spac">
                            <tbody> 

                                <tr>
                                    <td align="right">
                                        <strong>Event name:</strong>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="evname" required>
                                    </td>
                                </tr>


                                <tr>
                                    <td align="right">
                                        <button class="btn btn-success btn-md" name="btsn">REMOVE</button>
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
                String name = request.getParameter("evname");
                if (request.getParameter("btsn") != null) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc", "root", "root");
                        PreparedStatement st = con.prepareStatement("DELETE FROM winners WHERE e_name=?");
                        st.setString(1, name);
                        int x = st.executeUpdate();
                        if (x > 0) {
        %>
        <div class="container">
            <div class="alert alert-success" align="center">
                <strong>  <strong>Success!</strong>The Result Record has been deleted from the database successfully!</strong>   <a href="adminpage.jsp" class="alert-link">Click here.</a>.
            </div>
        </div>
        <%
        } else {
        %>
        <div class="container">
            <div class="alert alert-success" align="center">
                <strong>Error!! Add correct details</strong> 
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
                <a href="www.banastali.org">Banasthali.org</a>
            </div>
        </footer>

    </body>
</html>

