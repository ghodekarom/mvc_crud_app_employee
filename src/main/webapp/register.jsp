<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>

    <!-- Font Awesome Icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body{
            margin:0;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
        }

        .container{
            background:white;
            padding:30px 40px;
            border-radius:12px;
            box-shadow:0 12px 30px rgba(0,0,0,0.25);
            width:360px;
        }

        h4{
            text-align:center;
            color:#1e3c72;
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
            border-color:#2a5298;
            outline:none;
            box-shadow:0 0 6px rgba(42,82,152,0.5);
        }

        input[type="submit"]{
            width:100%;
            padding:10px;
            background:#1e3c72;
            color:white;
            border:none;
            border-radius:6px;
            font-weight:bold;
            cursor:pointer;
            transition:0.3s;
            font-size:15px;
        }

        input[type="submit"]:hover{
            background:#2a5298;
        }

        /* ENHANCED ERROR / WARNING MESSAGE */
        .error-msg{
            display:flex;
            align-items:center;
            gap:8px;
            background:#fee2e2;
            color:#b91c1c;
            padding:10px 12px;
            border-radius:6px;
            border-left:5px solid #dc2626;
            font-size:14px;
            margin-bottom:15px;
            font-weight:500;
        }

        .error-msg i{
            font-size:15px;
        }

        .login-link{
            display:block;
            text-align:center;
            margin-top:15px;
            font-size:14px;
        }

        .login-link a{
            text-decoration:none;
            color:#1e3c72;
            font-weight:bold;
        }

        .login-link a:hover{
            text-decoration:underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h4><i class="fa-solid fa-user-plus"></i> REGISTER</h4>

    <%
    String msg1 = (String)request.getParameter("msg1");
    if(msg1!=null){
    %>
    <div class="error-msg">
        <i class="fa-solid fa-triangle-exclamation"></i>
        <span><%= msg1%></span>
    </div>
    <%}%>

    <form action="auth?action=doRegister" method="post">
       <label>Enter name:</label>
       <input type="text" name="name"
       pattern="^[A-Za-z ]{2,50}$"
       title="Name should contain only letters and spaces (2-50 characters)" required>

       <label>Enter username:</label>
       <input type="text" name="username"
       pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}$"
       title="Enter a valid username e.g-omghodekar13@gmail.com" required>

       <label>Enter userpassword:</label>
       <input type="password" name="userpassword"
       pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
       title="Password must be at least 8 characters with uppercase, lowercase, number and special character" required>

       <input type="submit" value="Register">

       <div class="login-link">
           Already have an account? <a href="auth?action=login">Login</a>
       </div>
    </form>
</div>

</body>
</html>