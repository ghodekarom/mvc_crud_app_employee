<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>.</title>
</head>
<body>
    <h4>REGISTER</h4>
    <%
    String msg1 = (String)request.getParameter("msg1");
    if(msg1!=null){
    %>
    <p style="color:red"><%= msg1%></p>
    <%}%>

    <form action="auth?action=doRegister" method="post">
       <label>Enter name:</label>
       <input type="text" name="name" pattern="^[A-Za-z ]{2,50}$" title="Name should contain only letters and spaces (2-50 characters)" required><br>
       <label>Enter username:</label>
       <input type="text" name="username" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}$" title="Enter a valid username e.g-omghodekar13@gmail.com" required><br>
       <label>Enter userpassword:</label>
       <input type="password" name="userpassword" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" title="Password must be at least 8 characters with uppercase, lowercase, number and special character" required><br>
       <input type="submit" value="register"><br>
       Already have an account<a href="auth?action=login">login</a>
    </form>
</body>
</html>