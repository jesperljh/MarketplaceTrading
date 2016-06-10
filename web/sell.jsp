<%-- 
    Document   : sell
    Created on : May 18, 2016, 3:21:51 PM
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
        <%
            if(session.getAttribute("user") == null){
                response.sendRedirect("login.jsp");
                return;
            }
            %>
        <%@include file="/includes/navbar.jsp" %>
        <style>
            .img-caption{
                text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
            }
        </style>

        <!-- Page Content -->
        <div class="container">

            <!-- Jumbotron Header -->
            <header class="jumbotron hero-spacer" style="background-image: url('http://www.prashantchauhan.com/wp-content/uploads/2015/08/e-commerce-banner.jpg'); background-size: cover; color: lightcyan">
                <h1>A Warm Welcome!</h1>
                <div class="img-caption">
                    <p>Khoo Teck Puat Hospital (KTPH) offers a comprehensive range of medical services, 
                        as well as a full suite of medical specialties. 
                        Combining medical expertise with the very best in personalized care in a healing environment, 
                        KTPH truly embodies the essence of holistic healthcare.</p>
                </div>
                <p><a class="btn btn-success btn-large">VIEW SERVICES!</a>
                </p>
            </header>

            <hr>

            <form id="my-awesome-dropzone" action="SellProductServlet" enctype="multipart/form-data" method="post">
                <div class="form-group row">
                    <label class="col-xs-3 control-label">Product Image</label>
                    <div class="col-xs-8">
                        <div class="fallback">
                            <input name="file" type="file"/>
                        </div>
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-xs-3 control-label">Product name</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="productName" />
                    </div>
                </div>
        
                <div class="form-group row">
                    <label class="col-xs-3 control-label">Description</label>
                    <div class="col-xs-8">
                        <textarea name="description" class="form-control" rows="5"></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-xs-3 control-label">Price</label>
                    <div class="col-xs-3 inputGroupContainer">
                        <div class="input-group">
                            <input type="text" class="form-control" name="price" />
                            <span class="input-group-addon">$</span>
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-xs-3 control-label">Size</label>
                    <div class="col-xs-5 selectContainer">
                        <select class="form-control" name="size">
                            <option value="">Choose a size</option>
                            <option value="s">Small (S)</option>
                            <option value="m">Medium (M)</option>
                            <option value="l">Large (L)</option>
                            <option value="xl">Extra large (XL)</option>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-xs-3 control-label">Category</label>
                    <div class="col-xs-5 selectContainer">
                        <select class="form-control" name="category">
                            <option value="">Choose a Category</option>
                            <option value="1">Cat 1</option>
                            <option value="2">Cat 2</option>
                            <option value="3">Cat 3</option>
                            <option value="4">Cat 4</option>
                            <option value="5">Cat 5</option>
                        </select>
                    </div>
                </div>

                <!-- #messages is where the messages are placed inside -->
                <div class="form-group row">
                    <div class="col-md-9 col-md-offset-3">
                        <div id="messages"></div>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-xs-5 col-xs-offset-3">
                        <button type="submit" class="btn btn-primary">Sell Product</button>
                    </div>
                </div>
            </form>
        </div>


        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; KTPH 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- all scripts -->
    <%@include file="/includes/all_script.jsp" %>
</body>
</html>
