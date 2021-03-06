<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Events</title>
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

            }

            .container {
                padding: 16px;
            }

            .spac{
                border-collapse: separate;
                border-spacing:50px 15px; 

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
                                <li><a href="adminpage.jsp">
                                        <span class="glyphicon glyphicon-home"></span>
                                    </a></li>
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
                <div class="ss"> Update Event </div>

                <div class="container">
                    <div class="cent">	
                        <table align="center" class="spac">
                            <tbody>
                                <tr>
                                    <td align="right">
                                        <strong>Field to update:</strong>
                                    </td>
                                    <td>
                                        <select name="select">
                                            <option value="select" hidden>select field</option>
                                            <option name="name" value="name">Event Name</option>
                                            <option name="vname" value="vname">Venue</option>
                                            <option name="time" value="time">Event Time</option>
                                            <option name="date" value="date">Event Date</option>
                                            <option name="edes" value="edes">Description</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Event ID:
                                    </td>
                                    <td>
                                        <input type="text" name="eid">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Enter changes:  
                                    </td>
                                    <td>
                                        <input type="text" name="content">
                                    </td>
                                </tr>

                                <tr>
                                    <td align="right">
                                        <button class="btn btn-success btn-md" name="btsn">SUBMIT</button>
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
        <%
            try {
                int x = 0, f = 0;
                String slt = request.getParameter("select");
                String ei = request.getParameter("eid");
                String cont = request.getParameter("content");
                if (request.getParameter("btsn") != null) {

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?zeroDateTimeBehavior=convertToNull", "root", "root");
                        Statement st = con.createStatement();
                        if (slt.equals("name")) {
                            x = st.executeUpdate("update event set e_name='" + cont + "' where e_id='" + ei + "'");
                            f = 1;
                        }

                        if (slt.equals("vname")) {
                            x = st.executeUpdate("update event set e_venue='" + cont + "' where e_id='" + ei + "'");
                            f = 1;
                        }
                        if (slt.equals("time")) {
                            x = st.executeUpdate("update event set e_time='" + cont + "' where e_id='" + ei + "'");
                            f = 1;
                        }
                        if (slt.equals("date")) {
                            x = st.executeUpdate("update event set e_sdate='" + cont + "' where e_id='" + ei + "'");
                            f = 1;
                        }
                        if (slt.equals("edes")) {
                            x = st.executeUpdate("update event set description='" + cont + "' where e_id='" + ei + "'");
                            f = 1;
                        }
                        if (f > 0) {
        %>
        <div class="container">
            <div class="alert alert-success" align="center">
                <strong>The data has been updated in the database successfully!</strong> <a href="adminpage.jsp" class="alert-link">Click here.</a>.
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
        <br>
        <br>
        <br>
        <br>
        <br>
        <p>.</p>
        <footer class="page-footer font-small stylish-color-dark pt-4">
            <hr>

            <div class="footer-copyright text-center py-3">© 2018 Copyright:
                <a href="https://mdbootstrap.com/education/bootstrap/">Banasthali.org</a>
            </div>
        </footer>
    </body>
</html>
