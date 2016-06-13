<%-- 
    Document   : navbar
    Created on : May 17, 2016, 10:24:49 AM
    Author     : jesperlim
--%>

<%@page import="entity.User"%>
<!-- style css -->
<%@include file="/includes/all_style_css.jsp" %>


<!-- Navigation -->
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">Khoo Teck Puat Hospital</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="index.jsp">Home</a>
                </li>
                <li>
                    <a href="shop.jsp">Shop</a>
                </li>
                <li>
                    <a href="sell.jsp">Sell</a>
                </li>
                <li class="nav-divider"></li>

                <%
                    if (session.getAttribute("user") == null) {
                %>
                <li>
                    <a href="login.jsp">Login</a>
                </li>
                <li>
                    <a href="register.jsp">Register</a>
                </li>
                <%                } else {
                %>
                <li>
                    <a href="myItem.jsp">My Items</a>
                </li>
                <li>
                    <a href="myMessage.jsp">Inbox</a>
                </li>
                <%
                    User user = (User) session.getAttribute("user");
                    if (user.getUsername().equals("jesper")) {
                        out.println("<li><a href='admin.jsp'>Admin</a></li>");
                    }
                %>
                <li>
                    <a href="logout.jsp">Logout</a>
                </li>
                <%}%>
                }
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>