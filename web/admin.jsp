<%-- 
    Document   : admin
    Created on : Jun 8, 2016, 4:58:13 PM
    Author     : jesperlim
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
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
        <%
            if(session.getAttribute("user") != null){
                User user = (User)session.getAttribute("user");
                if(!user.getUsername().equals("jesper")){
                    response.sendRedirect("index.jsp");
                }
            }else{
                response.sendRedirect("login.jsp");
            }
            %>
        <%@include file="/includes/navbar.jsp" %>

        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Admin Panel
                        <small>Reported Products</small>
                    </h1>
                </div>
            </div>
            <!-- /.row -->

            <div class="row" id="pageStuff">
                <!-- Products -->
                <%
                    ProductDAO productDAO = new ProductDAO();
                    ArrayList<Product> productList = productDAO.getReportedProduct();
                    for (int i = 0; i < productList.size(); i++) {
                        Product p = productList.get(i);
                %>
                <div class="row">
                    <div class="col-md-7">
                        <div class="thumbnail" style="border-radius: 25px; border-color: #00aced">
                            <a href="#">
                                <img class="img-responsive" src="ImageServlet?id=<%= p.getProductID()%>" style="height:300px; width: auto; border-radius: 25px" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-5" style="position:relative">
                        <h3>Product Name : <%= p.getProductName()%></h3>
                        <h4>Seller : <%= p.getSeller()%></h4>
                        <p><%= p.getDescription()%></p>
                        <div style="position: absolute; top: 250px">
                            <a class="btn btn-danger" href="UpdateReportStatusServlet?id=<%= p.getProductID() %>&service=delete">Delete Post <span class="glyphicon glyphicon-chevron-right"></span></a>
                            <a class="btn btn-primary" href="UpdateReportStatusServlet?id=<%= p.getProductID() %>&service=ignore">Ignore <span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <hr>
                <%                }
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
