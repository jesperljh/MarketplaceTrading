<%-- 
    Document   : logout
    Created on : May 17, 2016, 4:56:53 PM
    Author     : jesperlim
--%>

<%
  if(session.getAttribute("user") != null){
      session.invalidate();
      response.sendRedirect("index.jsp");
      return;
  }  
    response.sendRedirect("index.jsp");
%>
