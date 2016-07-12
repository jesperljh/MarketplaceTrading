<%-- 
    Document   : newThread
    Created on : Jul 11, 2016, 3:21:39 PM
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
        <%@include file="/includes/all_style_css.jsp" %>
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
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
                    <h1 class="page-header">Information Sharing
                        <small>Creating new thread</small>
                    </h1>

                </div>
            </div>
            <!-- /.row -->

            <form id="myForm" name="myForm" action='postThreadServlet'>
                <label style="padding-top: 30px" class="col-sm-12" for="inputBody">Title</label>
                <input type="text" class="form-control" id="title" name="title">
                <input type = "hidden" value ="<%= user.getUsername()%>" name="username" name='username'>
                <div class="form-group">
                    <label style="padding-top: 30px" class="col-sm-12" for="inputBody">Message</label>
                    <div class="col-sm-12"><textarea class="form-control" name="information_string" rows="18"></textarea></div>
                </div>
                <div class="modal-footer">
                    <a href="myMessage.jsp" type="button" style="margin-top:10px" class="btn btn-default pull-left" data-dismiss="modal">Cancel</a> 
                    <button id="reply" type="submit" style="margin-top:10px" class="btn btn-primary">Post Thread <i class="fa fa-arrow-circle-right fa-lg"></i></button>
                </div>
            </form>

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
