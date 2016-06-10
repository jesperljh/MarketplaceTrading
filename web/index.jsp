<%-- 
    Document   : index
    Created on : May 17, 2016, 10:28:03 AM
    Author     : jesperlim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="KTPH project">
        <meta name="author" content="Jesper Lim">

        <title>KTPH</title>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp" %>
        <%@include file="/includes/carousel.jsp" %>
        <style>
            .img-caption{
                color: yellow;
                text-shadow: -2px 0 black, 0 1px black, 2px 0 black, 0 -2px black;
            }
        </style>

        <!-- Page Content -->
        <div class="container">

            <!-- Marketing Icons Section -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Welcome to KTPH Market Trading
                    </h1>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default" style="border-color: #337ab7">
                        <div class="panel-heading" style="background-color: #337ab7; color: #fff; ">
                            <h4><i class="fa fa-fw fa-check"></i>Explore KTPH</h4>
                        </div>
                        <div class="panel-body">
                            <p>Khoo Teck Puat Hospital</p>
                            <p>90 Yishun Central</p>
                            <p>Singapore 768828 </p>
                            <a href="#" class="btn btn-default btn-primary">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default" style="border-color: #5cb85c">
                        <div class="panel-heading" style="background-color: #5cb85c; color:#fff; ">
                            <h4><i class="fa fa-fw fa-gift"></i>About Us</h4>
                        </div>
                        <div class="panel-body">
                            <p>Khoo Teck Puat Hospital (KTPH), a 590-bed general and acute care hospital, opened in June 2010. KTPH combines medical expertise with high standards of personalised care, set within a healing environment, to provide care that is good enough for our own loved ones. From intuitive wayfinding to logical clustering of services, KTPH's design is focused on providing a hassle-free experience for patients.</p>
                            <a href="#" class="btn btn-default btn-success">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default" style="border-color: #f0ad4e">
                        <div class="panel-heading" style="background-color: #f0ad4e; color: #fff; ">
                            <h4><i class="fa fa-fw fa-compass"></i>Specialities & Services</h4>
                        </div>
                        <div class="panel-body">
                            <p>Khoo Teck Puat Hospital (KTPH) offers a comprehensive range of medical services, as well as a full suite of medical specialties. Combining medical expertise with the very best in personalized care in a healing environment, KTPH truly embodies the essence of holistic healthcare.</p>
                            <a href="#" class="btn btn-default btn-warning">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->

            <!-- Portfolio Section -->
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Consultation / Appointment</h2>
                </div>
                <div class="col-md-4 col-sm-6">

                    <a href="portfolio-item.html">
                        <img class="img-responsive img-portfolio img-hover" src="https://morinomachi.asia/en/images/General_Consultation.png" alt="">
                        <div class="carousel-caption img-caption" style="color: white; font-size: 30px">
                            General Consultation
                        </div>
                    </a>
                </div>
                <div class="col-md-4 col-sm-6">
                    <a href="portfolio-item.html">
                        <img class="img-responsive img-portfolio img-hover" style="width: 100%; height: auto" src="https://www.thefono.org/media/25965/consult.png" alt="">
                        <div class="carousel-caption img-caption" style="color: white; font-size: 30px">
                            Dental Consultation
                        </div>
                    </a>
                </div>
                <div class="col-md-4 col-sm-6">
                    <a href="portfolio-item.html">
                        <img class="img-responsive img-portfolio img-hover" style="width: 100%; height: auto" src="http://images.clipartpanda.com/calendar-clipart-Calendar-clipart-home-free-nutrition-and-healthy-food-clipart.png" alt="">
                        <div class="carousel-caption img-caption" style="color: white; font-size: 30px">
                            Book/Change Appointment
                        </div>
                    </a>
                </div>
            </div>
            <!-- /.row -->

            <!-- Features Section -->
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Caregiver Feedback</h2>
                </div>
                <div class="col-md-6">
                    <p>The KTPH Market Trading connect people together which includes:</p>
                    <ul>
                        <li><strong>Caregivers</strong>
                        </li>
                        <li>Doctors</li>
                        <li>Nurses</li>
                        <li>Patients</li>
                        <li>Family Members</li>
                    </ul>
                    <p>A platform for people to share and trade medical related equipments. Constitute in caring and sharing community! </p>
                </div>
                <div class="col-md-6">
                    <img class="img-responsive" src="https://walkwithcaregivers.files.wordpress.com/2012/01/fyp-logo5.png" style="width:450px; height: auto" alt="">
                </div>
            </div>
            <!-- /.row -->

            <hr>

            <!-- Call to Action Section -->
            <div class="well">
                <div class="row">
                    <div class="col-md-8">
                        <p>Feedback on the website and let us serve you better!</p>
                    </div>
                    <div class="col-md-4">
                        <a class="btn btn-lg btn-default btn-block btn-info" href="#">Information Sharing!</a>
                    </div>
                </div>
            </div>

            <hr>

            <!-- Footer -->
            <footer>
                <div class="row">
                    <div class="col-lg-12">
                        <p>Copyright &copy; KTPH 2016</p>
                    </div>
                </div>
            </footer>

        </div>
        <!-- /.container -->

        <!-- all scripts -->
        <%@include file="/includes/all_script.jsp" %>
    </body>
</html>
