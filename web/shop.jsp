<%-- 
    Document   : shopItem
    Created on : May 16, 2016, 3:08:44 PM
    Author     : jesperlim
--%>

<%@page import="dao.CommentDAO"%>
<%@page import="entity.Comment"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@page import="org.apache.tomcat.util.codec.binary.StringUtils"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
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
        <%
            ArrayList<String> categories = new ArrayList<String>();
            categories.add("Adult Diapers and Incontinence Care");
            categories.add("Bath and Toilet");
            categories.add("Catheters, Tubes and Aids");
            categories.add("Dental Care");
            categories.add("Guards and Supports");
            categories.add("Healthy Food and Supplements");
            categories.add("Hospital Beds and Accessories");
            categories.add("Independent Living Aids");
            categories.add("Medical Equipments and Accessories");
            categories.add("Minor Ailment");
            categories.add("Nutritional Feeds");
            categories.add("Pain Relief");
            categories.add("Pressure Relief");
            categories.add("Skin and Body Care");
            categories.add("Sports and Exercise");
            categories.add("Walking Aids");
            categories.add("Wheelchairs and Accessories");
            categories.add("Wound Care");
        %>
        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <div class="col-md-3">
                    <p class="lead">Categories</p>
                    <div class="list-group">
                        <%
                            for (int i = 0; i < categories.size(); i++) {
                                String c = categories.get(i);
                        %>
                           <% if (Integer.parseInt(request.getParameter("cat")) == i) {
                                   out.print("<a href='shop.jsp?cat=" + i + "' class='list-group-item active'>" + c + "</a>");
                           }else{
                               out.print("<a href='shop.jsp?cat=" + i + "' class='list-group-item'>" + c + "</a>");
                           }
                           %>
                        <% }%>
                    </div>
                </div>

                <div class="col-md-9">

                    <div class="row carousel-holder">

                        <div class="col-md-12">
                            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <img class="slide-image" src="https://c1.staticflickr.com/5/4095/4804019724_0619c7dda7_b.jpg" style="width: 100%; height: 300px;" alt="">
                                    </div>
                                    <div class="item">
                                        <img class="slide-image" src="https://www.ktph.com.sg/uploads/13438958580146.jpg" style="width: 100%; height: 300px;" alt="">
                                    </div>
                                    <div class="item">
                                        <img class="slide-image" src="http://cdn.mothership.sg/wp-content/uploads/2015/06/Khoo-Teck-Puat-Hospital.jpg" style="width: 100%; height: 300px;" alt="">
                                    </div>
                                </div>
                                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                </a>
                            </div>
                        </div>

                    </div>


                    <div class="row" style="padding-bottom: 20px">
                        <form>
                            <div class="input-group">
                                <div class="form-group has-feedback">
                                    <input type="text" class="form-control" name="search" id="search" placeholder="Search">
                                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                </div>
                                <span class="input-group-btn" style="padding-left:10px; padding-right: 10px">
                                    <button class="btn btn-primary" type="submit">Search!</button>
                                </span>
                                <select class="form-control" >
                                    <option value="productName">Product Name</option>
                                    <option value="Price">Price</option>
                                    <option value="Seller">Seller</option>
                                </select>
                            </div>
                        </form>
                    </div>


                    <div class="row" id="pageStuff">

                        <%
                            ProductDAO productDAO = new ProductDAO();
                            int cat = Integer.parseInt(request.getParameter("cat"));
                            ArrayList<Product> productList = productDAO.getShopProduct(cat);
                            String search = request.getParameter("search");
                            if (search != null && !search.equals("")) {
                                productList = productDAO.getShopProductByName(search);
                            }
                            for (int i = 0; i < productList.size(); i++) {
                                Product p = productList.get(i);
                                DecimalFormat df = new DecimalFormat("#.00");
                                ArrayList<Comment> comments = CommentDAO.retrieveComments(p.getProductID());
                        %>

                        <div class="col-sm-4 col-lg-4 col-md-4">
                            <div class="thumbnail" style="border-radius: 25px; border-color: #00aced">
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
                        <%}%>

                    </div>

                    <div class="span6">
                        <div class="pagination">
                            <ul class="pager"></ul>
                        </div> 
                    </div> 
                </div>
            </div>

        </div>
        <!-- /.container -->

        <div class="container">
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
            var perPage = 9;
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
