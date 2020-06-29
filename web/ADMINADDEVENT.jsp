<%-- 
    Document   : linkadd
    Created on : 30 Mar, 2019, 7:45:03 PM
    Author     : Kanika
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="com.oreilly.servlet.MultipartRequest"%>

<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Add events</title>
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
        <script
        src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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



        <div class="jumbotron">

            <form style="border:6px solid #ccc" method="post">
                <br>

                <div class="ss"> Add an event </div>

                <div class="container">

                    <div class="cent">	
                        <div class="content">
                            <table align="center" class="spac">
                                <tbody>
                                    <tr>
                                        <td align="right">
                                            <strong>Event Id:</strong>
                                        </td>
                                        <td align="left">
                                            <input type="text" name="eid" placeholder="A123" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <strong>Event name:</strong>
                                        </td>
                                        <td align="left">
                                            <input type="text" name="evname" placeholder="Poetry Competition" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <strong>Venue:</strong>
                                        </td>
                                        <td align="left">
                                            <input type="text" name="vname" placeholder="Kala Mandir" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <strong>Event Time:</strong>
                                        </td>
                                        <td align="left">
                                            <input type="Time" name="etime" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <strong>Event Start Date:</strong>
                                        </td>
                                        <td align="left">
                                            <input type="Date" name="sdate" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <strong>Event End Date:</strong>
                                        </td>
                                        <td align="left">
                                            <input type="Date" name="edate" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <strong>Event Type:</strong>
                                        </td>
                                        <td align="left">
                                            <select name="selt">
                                                <option value="Select" hidden>Select</option>
                                                <option value="dance">Dance</option>
                                                <option value="music">Music</option>
                                                <option value="art">Art</option>
                                                <option value="drama">Drama</option>
                                                <option value="workshop">Workshop</option>
                                                <option value="physics">Physics</option>
                                                <option value="chemistry">Chemistry</option>
                                                <option value="boi">Biology</option>
                                                <option value="poetry&oration">Poetry & Oration</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <strong>Event Description:</strong>
                                        </td>
                                        <td align="left">
                                            <input type="text" name="edes" placeholder="This event is----" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <strong>Image URL:</strong>
                                        </td>
                                        <td align="left">
                                            <input type="text" name="image" required>
                                        </td>
                                    </tr>
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
                </div>
            </form>
        </div>
        <%
            try {
                String eid = request.getParameter("eid");
                String name = request.getParameter("evname");
                String venue = request.getParameter("vname");
                String time = request.getParameter("etime");
                String sdate = request.getParameter("sdate");
                String edate = request.getParameter("edate");
                String type = request.getParameter("selt");
                String desc = request.getParameter("edes");
                String imgurl = request.getParameter("image");
                if (request.getParameter("btsn") != null) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?zeroDateTimeBehavior=convertToNull", "root", "root");
                        PreparedStatement pre = con.prepareStatement("insert into event values(?,?,?,?,?,?,?,?,1,?)");

                        pre.setString(1, eid);
                        pre.setString(2, name);
                        pre.setString(3, venue);
                        pre.setString(4, time);
                        pre.setString(5, sdate);
                        pre.setString(6, edate);
                        pre.setString(7, type);
                        pre.setString(8, desc);
                        pre.setString(9, imgurl);

                        int x = pre.executeUpdate();
                        if (x > 0) {
        %>
        <div class="container">
            <div class="alert alert-success" align="center">
                <strong>You have added the event successfully!</strong>   <a href="adminpage.jsp" class="alert-link">Click here.</a>.
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

            pre.close();
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
                <a href="adminpage.jsp" class="alert-link">click here.</a>
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


