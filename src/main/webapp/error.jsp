<!DOCTYPE html>
<%@ page isErrorPage="true" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error - Employee Management System</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

body{
    margin:0;
    padding:0;
    font-family: Arial, Helvetica, sans-serif;
    background: linear-gradient(135deg,#7f1d1d,#991b1b);
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

/* ERROR CARD */
.error-container{
    background:white;
    width:500px;
    padding:30px;
    border-radius:12px;
    box-shadow:0 10px 25px rgba(0,0,0,0.4);
    text-align:center;
    animation: fadeIn 0.4s ease-in-out;
}

@keyframes fadeIn{
    from{ opacity:0; transform:translateY(-10px);}
    to{ opacity:1; transform:translateY(0);}
}

/* ICON */
.error-icon{
    font-size:50px;
    color:#dc2626;
    margin-bottom:15px;
}

/* HEADING */
.error-title{
    font-size:22px;
    font-weight:800;
    color:#b91c1c;
    margin-bottom:15px;
}

/* MESSAGE */
.error-message{
    font-size:14px;
    color:#111827;
    margin:10px 0;
    word-wrap:break-word;
}

</style>
</head>

<body>

<%
String msg = (String)request.getAttribute("excepmsg");
Throwable cause = (Throwable)request.getAttribute("excepcause");
exception = (Throwable)request.getAttribute("excep");
%>

<div class="error-container">

<div class="error-icon">
    <i class="fa-solid fa-triangle-exclamation"></i>
</div>

<div class="error-title">
    Oops! Something Went Wrong
</div>

<div class="error-message">
    <strong>Error Message:</strong><br>
    <%= msg %>
</div>

<div class="error-message">
    <strong>Cause:</strong><br>
    <%= cause %>
</div>

<div class="error-message">
    <strong>Exception:</strong><br>
    <%= exception %>
</div>

</div>

</body>
</html>