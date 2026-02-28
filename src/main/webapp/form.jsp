<%@page import="java.util.*,com.myproject.crudapp.model.entity.Employee"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Employee Form</title>

<style>
body{
    margin:0;
    font-family: Arial, Helvetica, sans-serif;
    background:#eef2f7;
}

.wrapper{
    width:100%;
    display:flex;
    justify-content:center;
    margin-top:50px;
}

.form-card{
    background:white;
    width:450px;
    padding:30px;
    border-radius:10px;
    box-shadow:0 8px 20px rgba(0,0,0,0.08);
}

.main-title{
    text-align:center;
    font-size:22px;
    font-weight:800;
    color:#1f2937;
    margin-bottom:10px;
}

.sub-title{
    text-align:center;
    font-size:15px;
    font-weight:bold;
    color:#2563eb;
    margin-bottom:20px;
}

.form-group{
    margin-bottom:15px;
    display:flex;
    flex-direction:column;
}

label{
    font-weight:600;
    margin-bottom:5px;
    font-size:14px;
}

input[type="text"]{
    padding:8px;
    border:1px solid #d1d5db;
    border-radius:6px;
    transition:0.3s;
}

input[type="text"]:focus{
    border-color:#2563eb;
    outline:none;
    box-shadow:0 0 6px rgba(37,99,235,0.3);
}

.error{
    color:#dc2626;
    font-size:13px;
    margin-top:4px;
}

.button-group{
    display:flex;
    justify-content:space-between;
    margin-top:20px;
}

input[type="submit"]{
    background:#2563eb;
    color:white;
    border:none;
    padding:8px 18px;
    border-radius:6px;
    cursor:pointer;
    font-weight:bold;
}

input[type="submit"]:hover{
    background:#1e40af;
}

.cancel-btn{
    text-decoration:none;
    background:#6b7280;
    color:white;
    padding:8px 18px;
    border-radius:6px;
}

.cancel-btn:hover{
    background:#4b5563;
}
</style>
</head>

<body>

<jsp:include page="header.jsp" />

<div class="wrapper">
<div class="form-card">

<div class="main-title">Employee Management System</div>

<%
Employee e = (Employee)request.getAttribute("emp");
boolean flag = (e!=null);
if(flag){
%>
<div class="sub-title">Update Record</div>
<%}else{%>
<div class="sub-title">Insert Record</div>
<%}%>

<form action="employee?action=<%=(flag)?"update":"insert"%>" method="post">

<% if(flag){ %>
<input type="hidden" name="id" value="<%=e.getId()%>">
<% } %>

<div class="form-group">
<label>Name</label>
<input type="text" name="name"
value="<%= (request.getParameter("name")!=null)? request.getParameter("name") : (flag)?e.getName():""%>"
pattern="^[A-Za-z ]{2,50}$" required>
<%
String nameerror = (String)request.getAttribute("nameerror");
if(nameerror!=null){
%>
<div class="error"><%=nameerror%></div>
<%}%>
</div>

<div class="form-group">
<label>Email</label>
<input type="text" name="email"
value="<%= (request.getParameter("email")!=null)? request.getParameter("email") : (flag)?e.getEmail():""%>"
pattern="^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$" required>
<%
String emailerror = (String)request.getAttribute("emailerror");
if(emailerror!=null){
%>
<div class="error"><%= emailerror%></div>
<%}%>
</div>

<div class="form-group">
<label>Department</label>
<input type="text" name="department"
value="<%= (request.getParameter("department")!=null)? request.getParameter("department") : (flag)?e.getDepartment():""%>"
pattern="^[A-Za-z ]{2,50}$" required>
<%
String departmenterror = (String)request.getAttribute("departmenterror");
if(departmenterror!=null){
%>
<div class="error"><%=departmenterror%></div>
<%}%>
</div>

<div class="form-group">
<label>Designation</label>
<input type="text" name="designation"
value="<%= (request.getParameter("designation")!=null)? request.getParameter("designation") : (flag)?e.getDesignation():""%>"
pattern="^[A-Za-z ]{2,50}$" required>
<%
String designationerror = (String)request.getAttribute("designationerror");
if(designationerror!=null){
%>
<div class="error"><%=designationerror%></div>
<%}%>
</div>

<div class="form-group">
<label>Salary</label>
<input type="text" name="salary"
value="<%= (request.getParameter("salary")!=null)? request.getParameter("salary") : (flag)?e.getSalary():""%>"
pattern="^[0-9]{1,10}$" required>
<%
String salaryerror = (String)request.getAttribute("salaryerror");
if(salaryerror!=null){
%>
<div class="error"><%=salaryerror%></div>
<%}%>
</div>

<div class="button-group">
<input type="submit" value="Save">
<a href="employee?action=cancel" class="cancel-btn">Cancel</a>
</div>

</form>
</div>
</div>

</body>
</html>