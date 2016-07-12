<%-- 
    Document   : myDraftMessage
    Created on : Jun 21, 2016, 4:44:50 PM
    Author     : jesperlim
--%>

<%@page import="dao.MessageDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.Message"%>
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
            body{ margin-top:0px;}
            .nav-tabs .glyphicon:not(.no-margin) { margin-right:10px; }
            .tab-pane .list-group-item:first-child {border-top-right-radius: 0px;border-top-left-radius: 0px;}
            .tab-pane .list-group-item:last-child {border-bottom-right-radius: 0px;border-bottom-left-radius: 0px;}
            .tab-pane .list-group .checkbox { display: inline-block;margin: 0px; }
            .tab-pane .list-group input[type="checkbox"]{ margin-top: 2px; }
            .tab-pane .list-group .glyphicon { margin-right:5px; }
            .tab-pane .list-group .glyphicon:hover { color:#FFBC00; }
            a.list-group-item.read { color: #222;background-color: #F3F3F3; }
            hr { margin-top: 5px;margin-bottom: 10px; }
            .nav-pills>li>a {padding: 5px 10px;}

            .ad { padding: 5px;background: #F5F5F5;color: #222;font-size: 80%;border: 1px solid #E5E5E5; }
            .ad a.title {color: #15C;text-decoration: none;font-weight: bold;font-size: 110%;}
            .ad a.url {color: #093;text-decoration: none;}
        </style>
        
        <script>
            function reply_message() {
                alert("reply message");
                document.getElementById('status').value = "true";
                document.myForm.submit();
            }
            function reply_draft_message() {
                alert("reply draft message");
                document.getElementById('status').value = "false";
                document.myForm.submit();
            }
        </script>

        <div class="container">
            <%
                User user = (User) session.getAttribute("user");
                ArrayList<Message> messageList = MessageDAO.retrieveDraftMessage(user.getUsername());

            %>
            <div class="row">
                <div class="col-sm-3 col-md-2">

                    <h4>Welcome, <%= user.getUsername()%>! </h4>
                </div>
                <div class="col-sm-9 col-md-10">
                    <div class='col-sm-9 col-md-10'>
                        <form>
                            <div class="input-group">
                                <div class="form-group has-feedback">
                                    <input type="text" class="form-control" name="search" id="search" placeholder="Search">
                                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                </div>
                                <span class="input-group-btn" style="padding-left:10px; padding-right: 10px">
                                    <button class="btn btn-primary" type="submit">Search!</button>
                                </span>
                            </div>
                        </form>
                    </div>
                    <div class="pull-right">
                        <span class="text-muted"><b>1</b>–<b><%= messageList.size() > 50 ? 50 : messageList.size()%></b> of <b><%= messageList.size()%></b></span>
                        <div class="btn-group btn-group-sm">
                            <button type="button" class="btn btn-default">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </button>
                            <button type="button" class="btn btn-default" <%= messageList.size() > 50 ? "" : "disabled"%> >
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-sm-3 col-md-2">
                    <a href="#" class="btn btn-danger btn-sm btn-block" data-toggle="modal" data-target="#modalCompose" role="button">COMPOSE</a>
                    <hr />
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="myMessage.jsp">
                                <!--<span class="badge pull-right">42</span>--> 
                                Inbox </a>
                        </li>
                        <!--<li><a href="#">Sent Mail</a></li>-->
                        <li class="active"><a href="myDraftMessage.jsp">
                                <!--<span class="badge pull-right">3</span>-->
                                Drafts</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9 col-md-10">
                    <%
                        String id = request.getParameter("id");
                        if (id == null) {
                    %>
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab"><span class="glyphicon glyphicon-inbox">
                                </span>Primary</a></li>
                        <!--<li><a href="#profile" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>
                                Social</a></li>
                        <li><a href="#messages" data-toggle="tab"><span class="glyphicon glyphicon-tags"></span>
                                Promotions</a></li>-->
                        <li><a href="#settings" data-toggle="tab"><span class="glyphicon glyphicon-plus no-margin">
                                </span></a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="home">
                            <div class="list-group">
                                <%
                                    for (int i = 0; i < messageList.size(); i++) {
                                        Message m = messageList.get(i);
                                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-hh.mm.ss");
                                %>
                                <a href="myDraftMessage.jsp?id=<%= m.getMessage_id()%>" class="list-group-item">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">
                                        </label>
                                    </div>
                                    <!--<span class="glyphicon glyphicon-star-empty"></span>-->
                                    <span class="name" style="min-width: 120px; display: inline-block;"><%= m.getSender().equals(user.getUsername()) ? m.getReceiver() : m.getSender()%></span> 
                                    <span class=""><%= m.getTitle()%></span>
                                    <span class="text-muted" style="font-size: 11px;">- <%= m.getMessage()%></span> 
                                    <span class="badge"><%= formatter.format(m.getMessage_date().getTime())%></span> 
                                    <!--<span class="pull-right">
                                        <span class="glyphicon glyphicon-paperclip"></span>
                                    </span>-->
                                </a>
                                <%}%>
                            </div>
                        </div>
                        <div class="tab-pane fade in" id="settings">
                            This tab is empty.</div>
                    </div>
                    <%
                    } else {
                        Message message = MessageDAO.retrieveMessageTitle(user.getUsername(), Integer.parseInt(id));
                        Message m = MessageDAO.retrieveDraftMessageByTitle(user.getUsername(), message.getTitle());
                    %>
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header"><%= message.getTitle()%>
                            </h1>
                        </div>
                    </div>
                    <%
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-hh.mm.ss");
                    %>
                    <form id="myForm" name="myForm" action='UpdateMessageServlet'>
                        <input type = "hidden" value ="<%= user.getUsername()%>" name='user'>
                        <h4 style="padding-top: 30px" class="col-sm-12" for="inputBody">Send to : <b><%= m.getSender().equals(user.getUsername()) ? m.getReceiver() : m.getSender()%></b></h4>
                        <input type="hidden" class="form-control" name="to" value="<%= m.getSender().equals(user.getUsername()) ? m.getReceiver() : m.getSender()%>">    
                        <input type="hidden" class="form-control" name="subject" value="<%= message.getTitle()%>">
                        <input type="hidden" class="form-control" name="id" value="<%= id %>">
                        <input type="hidden" class="form-control" name="status" id="status">
                        <div class="form-group">
                            <label style="padding-top: 30px" class="col-sm-12" for="inputBody">Message</label>
                            <div class="col-sm-12"><textarea class="form-control" name="body" rows="18"><%= m.getMessage()%></textarea></div>
                        </div>
                        <div class="modal-footer">
                            <a href="myMessage.jsp" type="button" style="margin-top:10px" class="btn btn-default pull-left" data-dismiss="modal">Cancel</a> 
                            <button onclick="javascript: reply_draft_message();" type="button" style="margin-top:10px" class="btn btn-warning pull-left">Save Draft</button>
                            <button onclick="javascript: reply_message();" type="button" style="margin-top:10px" class="btn btn-primary">Reply <i class="fa fa-arrow-circle-right fa-lg"></i></button>
                        </div>
                    </form>
                    <%
                        }
                    %>

                </div>
            </div>
        </div>

        <!-- /.modal compose message -->
        <div class="modal" id="modalCompose">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Compose Message</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" action='SendMessageServlet' class="form-horizontal">
                            <input type="hidden" value="<%= user.getUsername()%>" name='user'>
                            <div class="form-group">
                                <label class="col-sm-2" for="inputTo">To</label>
                                <div class="col-sm-10"><input type="text" class="form-control" name="to" placeholder="comma separated list of recipients"></div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2" for="inputSubject">Subject</label>
                                <div class="col-sm-10"><input type="text" class="form-control" name="subject" placeholder="subject"></div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12" for="inputBody">Message</label>
                                <div class="col-sm-12"><textarea class="form-control" name="body" rows="18"></textarea></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button> 
                                <button type="button" class="btn btn-warning pull-left">Save Draft</button>
                                <button type="submit" class="btn btn-primary">Send <i class="fa fa-arrow-circle-right fa-lg"></i></button>
                            </div>
                        </form>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal compose message -->


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
