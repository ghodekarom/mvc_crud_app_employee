<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>.</title>
</head>
<body>
    <h4>Login</h4>
    <%
    String msg1 = (String)request.getParameter("msg1");
    if(msg1!=null){
    %>
    <p style="color:green"><%= msg1%></p>
    <%}%>

    <%
    String msg2 = (String)request.getParameter("msg2");
    if(msg2!=null){
    %>
    <p style="color:green"><%= msg2%></p>
    <%}%>

    <form action="auth?action=doLogin" method="post">

        <label>enter username:</label>
        <input type="text" name="username"  pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}$" title="Enter valid username e.g-omghodekar13@gmail.com"><br>
        <label>enter userpassword:</label>
        <input type="password" name="userpassword" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$" title="Password must be at least 8 characters with uppercase, lowercase, number and special character"><br>
        <input type="submit" value="login"><br>
        Don't have an account <a href="auth?action=register">register</a>
    </form>
</body>
</html>