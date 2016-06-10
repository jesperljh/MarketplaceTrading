<%-- 
    Document   : register
    Created on : May 18, 2016, 10:23:15 AM
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
        <style>
            .Absolute-Center {
                margin: auto;
                position: absolute;
                top: 0; left: 0; bottom: 0; right: 0;
            }
        </style>

        <div class="container">
            <div class="omb_login">
                <!--<div class="col-xs-4 col-sm-2">
                    <a href="#" class="btn btn-lg btn-block omb_btn-facebook">
                        <i class="fa fa-facebook visible-xs"></i>
                        <span class="hidden-xs">Facebook</span>
                    </a>
                </div>
                <div class="col-xs-4 col-sm-2">
                    <a href="#" class="btn btn-lg btn-block omb_btn-twitter">
                        <i class="fa fa-twitter visible-xs"></i>
                        <span class="hidden-xs">Twitter</span>
                    </a>
                </div>	
                <div class="col-xs-4 col-sm-2">
                    <a href="#" class="btn btn-lg btn-block omb_btn-google">
                        <i class="fa fa-google-plus visible-xs"></i>
                        <span class="hidden-xs">Google+</span>
                    </a>
                </div>	
            </div>-->

                <!--http://www.shri.org.sg/wp-content/uploads/AHSlogos_AlexandraHealthSystem-FC-300x164.png -->
                <div class="row omb_row-sm-offset-3 omb_loginOr">
                    <div class="col-xs-12 col-sm-6">
                        <center>
                            <img class="img-responsive img-portfolio img-hover" src="http://infographics.sg/wp-content/uploads/2013/07/KTPH-logo.png" alt="">
                        </center>
                    </div>
                </div>

                <div class="row omb_row-sm-offset-3 omb_loginOr">
                    <div class="col-xs-12 col-sm-6">
                        <hr class="omb_hrOr">
                        <span class="omb_spanOr" style="margin-left: -2.5em; width: 6em">REGISTER</span>
                    </div>
                </div>

                <div class="row omb_row-sm-offset-3">
                    <div class="col-xs-12 col-sm-6">	
                        <form class="omb_loginForm" action="RegisterServlet" method="POST">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user-md"></i></span>
                                <input type="text" class="form-control" name="name" placeholder="name">
                            </div>
                            <span class="help-block"></span>

                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                <input  type="text" class="form-control" name="email" placeholder="email">
                            </div>
                            <span class="help-block"></span>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" name="username" placeholder="Username">
                            </div>
                            <span class="help-block"></span>

                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input  type="password" class="form-control" name="password" placeholder="Password">
                            </div>
                            <span class="help-block"></span>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input  type="password" class="form-control" name="cpassword" placeholder="Confirm Password">
                            </div>
                            <span class="help-block"></span>
                            <div class="control-group">
                                <label class="control-label">Gender </label>
                                <i class="fa fa-male" aria-hidden="true"></i>
                                <i class="fa fa-female" aria-hidden="true"></i>
                                <div class="controls">
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-info">
                                            <input type="radio" name="gender" id="option2" value="m" autocomplete="off"> Male
                                        </label>
                                        <label class="btn btn-info">
                                            <input type="radio" name="gender" id="option3" value="f" autocomplete="off"> Female
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <span class="help-block">
                                <%= request.getAttribute("errorMsg") != null ? request.getAttribute("errorMsg") : ""%>;
                            </span>

                            <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
                        </form>
                    </div>
                </div>
                <!--<div class="row omb_row-sm-offset-3">
                    <div class="col-xs-12 col-sm-3">
                        <label class="checkbox">
                            <input type="checkbox" value="remember-me">Remember Me
                        </label>
                    </div>
                    <div class="col-xs-12 col-sm-3">
                        <p class="omb_forgotPwd">
                            <a href="#">Forgot password?</a>
                        </p>
                    </div>
                </div>	 -->   	
            </div>
        </div>

        <!-- all scripts -->
        <%@include file="/includes/all_script.jsp" %>
    </body>
</html>
