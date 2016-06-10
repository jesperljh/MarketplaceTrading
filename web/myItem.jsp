<%-- 
    Document   : myItem
    Created on : May 27, 2016, 3:57:43 PM
    Author     : jesperlim
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.CommentDAO"%>
<%@page import="entity.Comment"%>
<%@page import="entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
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
            .thumbnail img 
            { 
                /*** min-height:150px; height:150px; ***/
                height: 150px;
                width: auto;
            }
            .pager li>a:focus, .pager li>a:hover
            {
                text-decoration: none;
                background-color: #fff;
            }

            .pager li>a, .pager li>span{
                display: inline-block;
                padding: 5px 14px;
                background-color: #428bca;
                border: 1px solid #ddd;
                border-radius: 15px;
            }
            li>a {
                color: #fff;
                text-decoration: none;
            }
        </style>

        <!-- Page Content -->
        <div class="container">

            <!-- Page Header -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">My Items
                        <!--<small>all my items</small>-->
                    </h1>
                </div>
            </div>
            <!-- /.row -->

            <%
                User user = (User) session.getAttribute("user");
                String username = user.getUsername();
                ProductDAO productDAO = new ProductDAO();
                ArrayList<Product> productList = productDAO.getMyProduct(username);

            %>
            <!-- Projects Row -->
            <div class="row" id="pageStuff">
                <%                    for (int i = 1; i < productList.size() + 1; i++) {
                        Product p = productList.get(i - 1);
                        DecimalFormat df = new DecimalFormat("#.00");
                        ArrayList<Comment> comments = CommentDAO.retrieveComments(p.getProductID());
                %>
                <!--<div class="col-md-4 portfolio-item">
                    <a href="#">
                        <img class="img-responsive" style="height: 205.703px; width:auto" src="ImageServlet?id=<%= p.getProductID()%>" alt="">
                    </a>
                    <h3>
                        <a href="#"><%=p.getProductName()%></a>
                    </h3>
                    <p><%=p.getDescription()%></p>
                </div>-->

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail" style="border-radius: 25px; border-color: #00aced">
                        <div class="ribbon" id="<%= p.getProductID() %>">
                            <span class="content"><%= p.isProductStatus() ? "Sold" : "Available"%></span>
                        </div>
                        <img src="ImageServlet?id=<%= p.getProductID()%>" style="border-radius: 25px" alt="">
                        <div class="caption">
                            <h4 class="pull-right"><i class="fa fa-usd" aria-hidden="true"></i><%= df.format(p.getPrice())%></h4>
                            <h4><a href="itemDetail.jsp?id=<%=p.getProductID()%>"><%= p.getProductName()%></a>
                            </h4>
                            <p><%= p.getDescription()%></p>
                        </div>
                        <div class="ratings" style="padding-bottom: 35px">
                            <a href="itemDetail.jsp?id=<%=p.getProductID()%>" class="btn btn-info btn-sm pull-right">View Details</a>
                            <p class="pull-left"><%= comments.size()%> comments</p>
                        </div>
                    </div>
                </div>

                <%
                    }
                %>

            </div>
            <!--</div>-->
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
