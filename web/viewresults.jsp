<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>View Results</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="https://fonts.googleapis.com/css?family=Exo|Galada|Quicksand" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style type="text/css">
            a {
                color: white;
            }	

            p {
                font-size: 4em;
            }
            .change {

                background-color:khaki;
                font-family: 'Quicksand', sans-serif;
            }

            .pre {

                font-family: Galada;
                letter-spacing: 1px;
                color: gray;
            }

            .space
            {
                padding-left: 50px;

            }
            .btn {
                background-color: khaki;
                border: none; 
                color: white;
                padding: 12px 16px; 
                font-size: 20px; 
                cursor: pointer;
            }
            .title{
                text-align: center;
                font-size: 25px;
                font-family: Galada; 
            }
            table{
                margin-top: 3%;
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
                        <div class="navbar navbar-brand">
                        </div>
                    </div>

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                        <ul class="nav navbar-nav">

                            <li> <img src="${pageContext.request.contextPath}/img/logo.png"></li>
                            <li><a href="homepage.jsp">
                                    <span class="glyphicon glyphicon-home"></span>
                                </a></li>
                        </ul>
                    </div>
                </div>
        </nav>
        <div class="title">
            RESULTS
        </div>

        <% try {
                String ename = request.getParameter("e_name");
                String pname = request.getParameter("p_name");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?zeroDateTimeBehavior=convertToNull", "root", "root");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from winners");
        %>
        <table class="table table-striped" align="center">
            <tr>
                <th><b>Event Name</b></th>
                <th><b>Participant Name</b></th>
            </tr><%
                while (rs.next()) {
            %>

            <tr>
                <td><%
                    out.print(rs.getString(1));
                    %>
                </td><td>
                    <%
                            out.print(rs.getString(2));
                        }
                    %>
                </td></tr>
        </table>
        <%
                con.close();
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

