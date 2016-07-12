<%-- 
    Document   : informationSharing
    Created on : Jul 11, 2016, 1:20:51 PM
    Author     : jesperlim
--%>

<%@page import="entity.Information"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.InformationDAO"%>
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
        <%@include file="/includes/all_style_css.jsp" %>
        <style>
            .agenda {  }

            /* Dates */
            .agenda .agenda-date { width: 170px; }
            .agenda .agenda-date .dayofmonth {
                width: 40px;
                font-size: 36px;
                line-height: 36px;
                float: left;
                text-align: right;
                margin-right: 10px; 
            }
            .agenda .agenda-date .shortdate {
                font-size: 0.75em; 
            }


            /* Times */
            .agenda .agenda-time { width: 140px; } 


            /* Events */
            .agenda .agenda-events {  } 
            .agenda .agenda-events .agenda-event {  } 

            @media (max-width: 767px) {

            }
        </style>

        <!-- Page Content -->
        <div class="container">

            <!-- Page Header -->
            <div class="row">
                <div class="col-lg-12">
                    <%
                        String id = request.getParameter("id");
                        User user = (User) session.getAttribute("user");
                        if(user == null){
                            response.sendRedirect("login.jsp");
                            return;
                        }
                        if (id != null) {
                            int info_id = Integer.parseInt(id);
                            ArrayList<Information> info_list = InformationDAO.retrieveInformationById(info_id);
                    %>
                    <h1 class="page-header"> <%= info_list.get(0).getTitle()%>
                        <!--<small>all my items</small>-->
                    </h1>
                    <% } else { %>
                    <h1 class="page-header">Information Sharing
                        <!--<small>all my items</small>-->
                        <a href="newThread.jsp" type="button" class = "btn btn-primary btn-lg pull-right">
                            <span class = "glyphicon glyphicon-comment"></span>
                            Create New Thread 
                        </a>
                    </h1>
                    <% } %>

                </div>
            </div>
            <!-- /.row -->

            <div class="container">
                <div class="row">   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <table class="table table-striped">
                            <%
                                //String id = request.getParameter("id");
                                if (id != null) {
                                    int info_id = Integer.parseInt(id);
                                    ArrayList<Information> info_list = InformationDAO.retrieveInformationById(info_id);
                            %>
                            <thead>
                                <tr>
                                    <th>Information Trading Title</th>
                                    <th>Last Post</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int i = 0; i < info_list.size(); i++) {
                                        if (i % 2 == 0) {
                                %>
                                <tr>
                                    <td><strong><%= info_list.get(i).getUsername()%></strong><br/>Posted date: <%= info_list.get(i).getPost_date()%></td>
                                    <td><%= info_list.get(i).getInformation_string()%></td>
                                </tr>
                                <%
                                } else {
                                %>
                                <tr>
                                    <td class="active"><strong><%= info_list.get(i).getUsername()%></strong><br/>Posted date: <%= info_list.get(i).getPost_date()%></td>
                                    <td class="active"><%= info_list.get(i).getInformation_string()%></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                            <form action="postThreadServlet">
                                <input type="hidden" class="form-control" id="title" name="title" value="<%= info_list.get(0).getTitle()%>">
                                <input type = "hidden" value ="<%= user.getUsername()%>" name="username" name='username'>
                                <input type="hidden" id="id" name="id" value="<%= info_list.get(0).getId() %>">
                                <div class="form-group">
                                    <label style="padding-top: 30px" class="col-sm-12" for="inputBody">Message</label>
                                    <div class="col-sm-12"><textarea class="form-control" name="information_string" rows="5"></textarea></div>
                                </div>
                                <button id="reply" type="submit" style="margin-top:10px" class="btn btn-primary pull-right">Reply Thread <i class="fa fa-arrow-circle-right fa-lg"></i></button>
                            </form>
                            <%
                            } else {
                            %>
                            <thead>
                                <tr>
                                    <th>Information Trading Title</th>
                                    <th>Last Post</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<Information> infoList = InformationDAO.retrieveInformation();

                                    for (int i = 0; i < infoList.size(); i++) {
                                        ArrayList<Information> list = InformationDAO.retrieveInformationById(infoList.get(i).getId());
                                        if (i % 2 == 0) {
                                %>
                                <tr>
                                    <td><a href="informationSharing.jsp?id=<%= infoList.get(i).getId()%>"><strong><%= infoList.get(i).getTitle()%></strong></a><br/>Posted by: <%= infoList.get(i).getUsername()%></td>
                                    <td><%= list.get(0).getPost_date()%></td>
                                </tr>
                                <%
                                } else {
                                %>
                                <tr>
                                    <td class="active"><a href="informationSharing.jsp?id=<%= infoList.get(i).getId()%>"><strong><%= infoList.get(i).getTitle()%></strong></a><br/>Posted by: <%= infoList.get(i).getUsername()%></td>
                                    <td class="active"><%= list.get(0).getPost_date()%></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                                <!--<tr>
                                    <td><a href="#"><strong>Washington DC</strong></a><br/>Posted by: Jesper</td>
                                    <td>July 9, 2016</td>
                                </tr>-->
                                <!--<tr class="active">    
                                    <td><strong>NSTP Annual Federal Tax Refresher Course</strong><br/><a href="https://aws.passkey.com/g/42238120" target="_blank">Gaylord National Hotel Convention Center</a><br/><i class="fa fa-map-marker"></i> 201 Waterfront Street<br/>National Harbor, MD 20745</td>
                                    <td><strong>AFTR Date & Registration</strong><br/>July 10, 2015<br/><br/><a class="btn btn-hot btn-block " href="/course/2015-Annual-Federal-Tax-Refresher-Course---National-Harbor%2C-MD" target="_blank"><i class="fa fa-hand-o-right"></i> Register Here</a></td>
                                </tr>           
                                <!--Denbver-->
                                <!--<tr>
                                    <td>Denver , CO <br/><a href="https://aws.passkey.com/g/34249128"target="_blank">Hyatt Regency Denver at Colorado Convention Center</a><br/><i class="fa fa-map-marker"></i> 650 15th Street<br/>Denver, CO 80202</td>
                                    <td>July 28 - 30, 2015</td>
                                </tr>
                                <tr class="active">       
                                    <td><strong>NSTP Annual Federal Tax Refresher Course</strong> <br/><a href="http://embassysuites3.hilton.com/en/hotels/colorado/embassy-suites-denver-downtown-convention-center-DENESES/index.html"target="_blank">Embassy Suites Denver</a><br/><i class="fa fa-map-marker"></i> 1420 Stout St<br/>Denver, CO 80202</td>
                                    <td><strong>AFTR Date & Registration</strong><br/>July 31, 2015<br/><br/><a class="btn btn-hot btn-block " href="/course/2015-Annual-Federal-Tax-Refresher-Course---Denver%2C-CO" target="_blank"><i class="fa fa-hand-o-right"></i> Register Here</a></td>
                                </tr>
                                <!--Denver-->
                                <!--<tr>
                                    <td>San Diego, CA <br/><a href="https://aws.passkey.com/g/42502120"target="_blank">San Diego Town & Country</a><br/><i class="fa fa-map-marker"></i> 500 Hotel Circle North <br/>San Diego, CA , 92108</td>
                                    <td>August 11 - 13, 2015</td>
                                </tr>
                                <tr class="active">
                                    <td><strong>NSTP Annual Federal Tax Refresher Course</strong> <br/><a href="https://aws.passkey.com/g/42502120"target="_blank">San Diego Town & Country</a><br/><i class="fa fa-map-marker"></i> 500 Hotel Circle North <br/>San Diego, CA , 92108</td>
                                    <td><strong>AFTR Date & Registration</strong><br/>August 14, 2015<br/><br/><a class="btn btn-hot btn-block " href="/course/2015-Annual-Federal-Tax-Refresher-Course---San-Diego%2C-CA" target="_blank"><i class="fa fa-hand-o-right"></i> Register Here</a></td>
                                </tr>
                                <!--washington-->
                                <!--<tr>
                                    <td>Atlanta, GA <br/><a href="https://aws.passkey.com/event/13001814/owner/321/home"target="_blank">Atlanta Marriott Marquis</a><br/><i class="fa fa-map-marker"></i> 265 Peachtree Center Avenue <br/>Atlanta, GA , 30303</td>
                                    <td>August 25 - 27, 2015</td>
                                </tr>
                                <tr class="active">   
                                    <td><strong>NSTP Annual Federal Tax Refresher Course</strong><br/><a href="https://aws.passkey.com/event/13001814/owner/321/home"target="_blank">Atlanta Marriott Marquis</a><br/><i class="fa fa-map-marker"></i> 265 Peachtree Center Avenue  <br/>Atlanta, GA , 30303</td>
                                    <td><strong>AFTR Date & Registration</strong><br/>August 28, 2015<br/><br/><a class="btn btn-hot btn-block " href="/course/2015-Annual-Federal-Tax-Refresher-Course---Atlanta%2C-GA" target="_blank"><i class="fa fa-hand-o-right"></i> Register Here</a></td>
                                </tr>
                                <!--washington-->
                                <!--<tr>
                                    <td>Orlando, FL<br/><a href="https://aws.passkey.com/g/30187120"target="_blank">Hyatt Regency Orlando</a><br/><i class="fa fa-map-marker"></i> 9801 International Drive <br/>Orlando, FL , 32819</td>
                                    <td>September 1 - 3, 2015</td>
                                </tr>
                                <tr class="active">
                                    <td><strong>NSTP Annual Federal Tax Refresher Course</strong><br/><a href="https://aws.passkey.com/g/30187120"target="_blank">Hyatt Regency Orlando</a><br/><i class="fa fa-map-marker"></i> 9801 International Drive <br/>Orlando, FL , 32819</td>
                                    <td><strong>AFTR Date & Registration</strong><br/>September 4, 2015<br/><br/><a class="btn btn-hot btn-block " href="/course/2015-Annual-Federal-Tax-Refresher-Course---Orlando%2C-FL" target="_blank"><i class="fa fa-hand-o-right"></i> Register Here</a></td>
                                </tr>
                                <!--washington-->
                            </tbody>
                            <% }%>
                        </table>
                    </div>

                </div>

            </div>

            <!--</div> pagination-->
            <div class="span6">
                <div class="pagination">
                    <ul class="pager"></ul>
                </div> 
            </div> 
            <!-- /.row -->

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
        <script>
            var listElement = $('#pageStuff');
            var perPage = 6;
            var numItems = listElement.children().size(); //listElement.children().length;
            var numPages = Math.ceil(numItems / perPage);

            $('.pager').data("curr", 0);

            var curr = 0;
            while (numPages > curr) {
                $('<li><a href="#" class="page_link">' + (curr + 1) + '</a></li>').appendTo('.pager');
                curr++;
            }

            $('.pager .page_link:first').addClass('active');

            listElement.children().css('display', 'none');
            listElement.children().slice(0, perPage).css('display', 'block');

            $('.pager li a').click(function () {
                var clickedPage = $(this).html().valueOf() - 1;
                goTo(clickedPage, perPage);
            });

            function previous() {
                var goToPage = parseInt($('.pager').data("curr")) - 1;
                if ($('.active').prev('.page_link').length == true) {
                    goTo(goToPage);
                }
            }

            function next() {
                goToPage = parseInt($('.pager').data("curr")) + 1;
                if ($('.active_page').next('.page_link').length == true) {
                    goTo(goToPage);
                }
            }

            function goTo(page) {
                var startAt = page * perPage,
                        endOn = startAt + perPage;

                listElement.children().css('display', 'none').slice(startAt, endOn).css('display', 'block');
                $('.pager').attr("curr", page);
            }
        </script>
    </body>
</html>
