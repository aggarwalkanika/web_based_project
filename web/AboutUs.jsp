<%-- 
    Document   : newjsp
    Created on : 27 Feb, 2019, 11:06:25 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Exo|Galada|Quicksand|Lobster" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">

        <style>

            h3{

                font-size: 30px;
                font-family: 'Quicksand',sans-serif;
                text-align: center;
            }

            #info
            {
                font-family:'Quicksand',sans-serif;
                text-align: center; 
                font-size:20px;
            }
            .fixed-nav-bar {
                position: fixed;
                top: 0;
                left: 0;
                z-index: 9999;
                width: 100%;
                height: 50px;
                background-color: #00a087;
            }
            a {
                color: white;
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
            .prep {

                font-family: Galada;
                letter-spacing: 1px;
                color: brown;
            }

            .centered
            {
                text-align: center;
                position:absolute;
                top:35%;
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
            .container
            {
                align:center;
            }
            .container:hover
            .overlay {
                opacity: 1;
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

            .text {
                color: white;
                font-size: 20px;
                position: absolute;
                top: 50%;
                left: 50%;
                align:center;
                -webkit-transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);
                text-align: center;
            }
            p.solid {border-style: solid;}
            div.bb
            {
                text-align:center;
            }
            img{
                margin-top: 6%;
                width: 70px;
                height: 50px;
            }

            body{
                background-color: lemonchiffon;
            }
        </style>
    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <nav class="navbar navbar-default" data-spy="affix" data-offset-top="197">
            <div class="change">
                <div class="container">
                    <div class="navbar-header pre">

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
            </div>
        </nav>
        <div style="font-size: 30px; font-family: 'Quicksand',sans-serif; text-align: center">ABOUT US</div><br>
        <br>
        <br>
        <div class="container">
            <h3>Welcome to Banasthali Bulletin Board</h3>
            <p id="info">
                Banasthali Bulletin Board is a website that tries to automate the events and introduces the service at your desk. The participants can register in departmental events.
                The participant can subscribe to the events of their interest and know about them. With a number of opportunities that can come our way, it is totally dependent on how 
                we grab them and turn them into our goodwill and betterment.So this website is an information provider,
                rather an opportunity provider to the audience of Banasthali Vidyapith to excel in the fields of interest.
            </p>
            <br>
            <h3>Vision</h3>
            <p id="info">Our vision is to build a platform which creates the general awareness about all the events 
                so as to bridge a nurturing connectivity among the student community round the Vidyapith.
            </p>
            <br>
            <h3>Mission</h3>
            <p id="info">To reach out to all the students of Banasthali Vidyapith and to provide them with a space to explore 
                their talents by keeping them updated about what is happening there. This will save time and encourage more participation.
            </p>

        </div>
        <footer class="page-footer font-small stylish-color-dark pt-4">
            <hr>

            <div class="footer-copyright text-center py-3">© 2018 Copyright:
                <a href="https://mdbootstrap.com/education/bootstrap/">Banasthali.org</a>
            </div>
        </footer>
    </body>
</html>
