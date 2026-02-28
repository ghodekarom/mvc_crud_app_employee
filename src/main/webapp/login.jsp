<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body{
            margin:0;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
        }

        .container{
            background:white;
            padding:35px 40px;
            border-radius:12px;
            box-shadow:0 15px 30px rgba(0,0,0,0.3);
            width:360px;
        }

        h4{
            text-align:center;
            color:#203a43;
            margin-bottom:20px;
            font-size:22px;
            letter-spacing:1px;
        }

        label{
            font-weight:bold;
            font-size:14px;
            display:block;
            margin-top:5px;
        }

        input[type="text"],
        input[type="password"]{
            width:100%;
            padding:10px;
            margin:6px 0 15px 0;
            border-radius:6px;
            border:1px solid #ccc;
            transition:0.3s;
            font-size:14px;
        }

        input[type="text"]:focus,
        input[type="password"]:focus{
            border-color:#2c5364;
            outline:none;
            box-shadow:0 0 6px rgba(44,83,100,0.5);
        }

        input[type="submit"]{
            width:100%;
            padding:10px;
            background:#203a43;
            color:white;
            border:none;
            border-radius:6px;
            font-weight:bold;
            cursor:pointer;
            transition:0.3s;
            font-size:15px;
        }

        input[type="submit"]:hover{
            background:#2c5364;
        }

        /* MESSAGE DESIGN */
        .message{
            padding:10px 12px;
            border-radius:6px;
            margin-bottom:15px;
            font-size:14px;
            font-weight:500;
            display:flex;
            align-items:center;
            gap:8px;
        }

        .success{
            background:#e6f9f0;
            color:#15803d;
            border-left:5px solid #16a34a;
        }

        .error{
            background:#fee2e2;
            color:#b91c1c;
            border-left:5px solid #dc2626;
        }

        .register-link{
            display:block;
            text-align:center;
            margin-top:15px;
            font-size:14px;
        }

        .register-link a{
            text-decoration:none;
            color:#203a43;
            font-weight:bold;
        }

        .register-link a:hover{
            text-decoration:underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h4><i class="fa-solid fa-user-lock"></i> Login</h4>

    <%
    String msg1 = (String)request.getParameter("msg1");
    if(msg1!=null){
    %>
    <div class="message success">
        <i class="fa-solid fa-circle-check"></i>
        <span><%= msg1%></span>
    </div>
    <%}%>

    <%
    String msg2 = (String)request.getParameter("msg2");
    if(msg2!=null){
    %>
    <div class="message error">
        <i class="fa-solid fa-triangle-exclamation"></i>
        <span><%= msg2%></span>
    </div>
    <%}%>

    <form action="auth?action=doLogin" method="post">

        <label>enter username:</label>
        <input type="text" name="username"
        pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}$"
        title="Enter valid username e.g-omghodekar13@gmail.com">

        <label>enter userpassword:</label>
        <input type="password" name="userpassword"
        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$"
        title="Password must be at least 8 characters with uppercase, lowercase, number and special character">

        <input type="submit" value="Login">

        <div class="register-link">
            Don't have an account? <a href="auth?action=register">Register</a>
        </div>
    </form>
</div>

</body>
</html>