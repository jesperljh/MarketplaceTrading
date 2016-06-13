<%-- 
    Document   : itemDetail
    Created on : May 18, 2016, 4:20:15 PM
    Author     : jesperlim
--%>

<%@page import="entity.Comment"%>
<%@page import="dao.CommentDAO"%>
<%@page import="java.text.DecimalFormat"%>
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


        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <div class="col-md-3">
                    <p class="lead">Categories</p>
                    <div class="list-group">
                        <a href="#" class="list-group-item active">Category 1</a>
                        <a href="#" class="list-group-item">Category 2</a>
                        <a href="#" class="list-group-item">Category 3</a>
                    </div>
                </div>
                <%
                    User user = (User) session.getAttribute("user");
                    ProductDAO productDAO = new ProductDAO();
                    int id = Integer.parseInt(request.getParameter("id"));
                    Product p = productDAO.getProductDetail(id);
                    DecimalFormat df = new DecimalFormat("#.00");
                    ArrayList<Comment> comments = CommentDAO.retrieveComments(id);
                %>
                <div class="col-md-9">

                    <div class="thumbnail">
                        <div class="report" id="<%= p.getProductID()%>">
                            <%
                                if (p.isReport()) {
                                    out.println("<button type='button' disabled class='btn btn-danger pull-right' style='margin-top: 10px; margin-right: 5px'>Reported!</button>");
                                } else {
                                    out.println("<button type='button' class='btn btn-danger pull-right' style='margin-top: 10px; margin-right: 5px'>Report!</button>");
                                }
                            %>
                        </div>
                        <img class="img-responsive" src="ImageServlet?id=<%= p.getProductID()%>" style="width: auto; height: 450px" alt="">
                        <div class="caption-full">
                            <h4 class="pull-right"><i class="fa fa-usd" aria-hidden="true"></i><%= df.format(p.getPrice())%></h4>
                            <h4><a href="#"></a>
                            </h4>
                            <p><%=p.getDescription()%></p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right"><%= comments.size()%> comments</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                                4.0 stars
                            </p>
                        </div>
                    </div>

                    <div class="well">

                        <h2>Comments</h2>
                        <hr>

                        <form action='CommentServlet'>



                            <div class="row">
                                <div class="col-md-12">
                                    <input type='hidden' name='product_id' value=<%=id%> />
                                    <%
                                        if (user != null) {
                                    %>
                                    <input type='hidden' name='comment_by' value='<%= user.getUsername()%>'/>                                       
                                    <textarea name="comment" class="form-control" rows="5"></textarea>
                                    <p></p>
                                    <div class="text-right">
                                        <input type='submit' id="submit" value="Leave a comment" class="btn btn-success">
                                    </div>
                                    <%
                                    } else {
                                    %>
                                    <textarea disabled name="comment" class="form-control" rows="5"></textarea>
                                    <p></p>
                                    <div class="text-right">
                                        <a href="login.jsp" class="btn btn-success">Log in to comment</a>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>

                        </form>

                        <hr>

                        <div id="comments">
                            <%
                                for (int i = 0; i < comments.size(); i++) {
                                    Comment comment = comments.get(i);

                            %>
                            <div class="row">
                                <div class="col-md-12">
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                    <%= comment.getComment_by()%>
                                    <span class="pull-right"><%= comment.getComment_date()%></span>
                                    <p><%= comment.getComment_string()%></p>
                                </div>
                            </div>

                            <hr>
                            <%
                                }
                            %>
                            <!--<div class="row">
                                <div class="col-md-12">
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                    Anonymous
                                    <span class="pull-right">12 days ago</span>
                                    <p>I've alredy ordered another one!</p>
                                </div>
                            </div>

                            <hr>

                            <div class="row">
                                <div class="col-md-12">
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                    Anonymous
                                    <span class="pull-right">15 days ago</span>
                                    <p>I've seen some better than this, but not at this price. I definitely recommend this item.</p>
                                </div>
                            </div>-->

                        </div>

                    </div>

                </div>

            </div>

        </div>
        <!-- /.container -->

        <<div class="container">
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
            /*$(document).ready(function () {
             $submit.click(function (event)) {
             var comment = $('#comment').val();
             //var comment_by = $('comment_by').val();
             //var product_id = $('product_id').val();
             $.get('CommentServlet', {comm: comment}, function (responseText) {
             $('#comments').text(responseText);
             });
             });
             });*/
        </script>
    </body>
</html>
