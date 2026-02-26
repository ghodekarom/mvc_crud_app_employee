<%@page import="java.util.*,com.myproject.crudapp.model.entity.Employee"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <h2>Employee Management System</h2>

        <%
        Employee e = (Employee)request.getAttribute("emp");
        boolean flag = (e!=null);
        if(flag){
        %>
        <p>Update Record</p>
        <%}else{%>
        <p>Insert Record</p>
        <%}%>

    <br>
    <form action="employee?action=<%=(flag)?"update":"insert"%>" method="post">

        <%
        if(flag){
        %>
        <input type="hidden" name="id" value="<%=e.getId()%>">
        <%}%>

        <label>Enter Name:</label>
        <input type="text" name="name" value=" <%= (request.getParameter("name")!=null)? request.getParameter("name") : (flag)?e.getName():""%>"><br>
        <%
        String nameerror = (String)request.getAttribute("nameerror");
        if(nameerror!=null){
        %>
        <p style="color:red"><%=nameerror%></p>
        <%}%>

        <label>Enter Email:</label>
        <input type="text" name="email" value="<%= (request.getParameter("email")!=null)? request.getParameter("email") :  (flag)?e.getEmail():""%>" ><br>
        <%
        String emailerror = (String)request.getAttribute("emailerror");
        if(emailerror!=null){
        %>
        <p style="color:red"><%= emailerror%></p>
        <%}%>

        <label>Enter Department:</label>
        <input type="text" name="department" value="<%= (request.getParameter("department")!=null)? request.getParameter("department") : (flag)?e.getDepartment():""%>" ><br>
        <%
        String departmenterror = (String)request.getAttribute("departmenterror");
        if(departmenterror!=null){
        %>
        <p style="color:red"><%=departmenterror%></p>
        <%}%>

        <label>Enter Designation:</label>
        <input type="text" name="designation" value="<%=  (request.getParameter("designation")!=null)? request.getParameter("designation") : (flag)?e.getDesignation():""%>" ><br>
        <%
        String designationerror = (String)request.getAttribute("designationerror");
        if(designationerror!=null){
        %>
        <p style="color:red"><%=designationerror%></p>
        <%}%>

        <label>Enter Salary:</label>
        <input type="text" name="salary" value="<%= (request.getParameter("salary")!=null)? request.getParameter("salary") : (flag)?e.getSalary():""%>" ><br>
        <%
        String salaryerror = (String)request.getAttribute("salaryerror");
        if(salaryerror!=null){
        %>
        <p style="color:red"><%=salaryerror%></p>
        <%}%>

         <input type="submit" value="Save">
         <a href="employee?action=cancel">Cancel</a>
    </form>

</body>
</html>