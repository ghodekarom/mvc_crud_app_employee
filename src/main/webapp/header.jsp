<%@page import="com.myproject.crudapp.model.entity.User"%>

<%
User user = (User)session.getAttribute("user");
%>

<%
if(user!=null){%>
Welcome<%=user.getUsername()%><a href="user?action=logout">logout</a>
<%}%>