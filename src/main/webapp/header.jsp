<%@page import="com.myproject.crudapp.model.entity.User"%>

<%
User user = (User)session.getAttribute("user");
%>

<style>
    .header{
        background: white;
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-family: Arial, Helvetica, sans-serif;
        border-bottom: 2px solid #e0e0e0;
    }

    .welcome-text{
        color: black;
        font-size: 16px;
        font-weight: bold;
    }

    .logout-btn{
        text-decoration: none;
        background: #d32f2f;
        color: white;
        padding: 6px 14px;
        border-radius: 5px;
        font-size: 14px;
        font-weight: bold;
        transition: 0.3s;
    }

    .logout-btn:hover{
        background: #b71c1c;
    }
</style>

<%
if(user!=null){%>
<div class="header">
    <div class="welcome-text">
        Welcome <%=user.getUsername()%>
    </div>
    <div>
        <a href="user?action=logout" class="logout-btn">Logout</a>
    </div>
</div>
<%}%>