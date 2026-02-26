<!DOCTYPE html>
<%@ page isErrorPage="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mvc_crud_app</title>
</head>
<body>

    <%
    String msg = (String)request.getAttribute("errmsg");
    Throwable cause = (Throwable)request.getAttribute("errcause");
    exception = (Throwable)request.getAttribute("errexception");
    %>

    <p><%= msg %></p>
    <p><%= cause %></p>
    <p><%= exception %></p>

</body>
</html>