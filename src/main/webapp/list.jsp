<%@page import="java.util.*,com.myproject.crudapp.model.entity.Employee"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee List</title>

    <!-- Font Awesome Icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body{
            margin:0;
            font-family: Arial, Helvetica, sans-serif;
            background:linear-gradient(to right,#eef2f7,#f8fafc);
        }

        .content{
            width:88%;
            margin:40px auto;
        }

        h2{
            text-align:center;
            margin-bottom:25px;
            color:#1e293b;
            font-weight:800;
            letter-spacing:0.5px;
        }

        .add-btn{
            display:inline-block;
            margin-bottom:20px;
            padding:10px 18px;
            background:#16a34a;
            color:white;
            text-decoration:none;
            border-radius:6px;
            font-weight:bold;
            transition:0.3s ease;
        }

        .add-btn i{
            margin-right:6px;
        }

        .add-btn:hover{
            background:#15803d;
            transform:translateY(-2px);
            box-shadow:0 4px 8px rgba(0,0,0,0.15);
        }

        table{
            width:100%;
            border-collapse:collapse;
            background:white;
            border-radius:10px;
            overflow:hidden;
            box-shadow:0 8px 20px rgba(0,0,0,0.08);
        }

        th, td{
            padding:14px;
            text-align:center;
            border-bottom:1px solid #e5e7eb;
            font-size:14px;
        }

        th{
            background:#0f172a;
            color:white;
            font-size:14px;
            text-transform:uppercase;
            letter-spacing:0.5px;
        }

        tr:nth-child(even){
            background:#f9fafb;
        }

        tr:hover{
            background:#e2e8f0;
            transition:0.2s ease-in-out;
        }

        .action-link{
            text-decoration:none;
            padding:7px 14px;
            border-radius:5px;
            font-size:13px;
            font-weight:bold;
            margin:0 4px;
            display:inline-block;
            transition:0.3s ease;
        }

        .action-link i{
            margin-right:5px;
        }

        .edit{
            background:#0284c7;
            color:white;
        }

        .delete{
            background:#dc2626;
            color:white;
        }

        .edit:hover{
            background:#0369a1;
            transform:scale(1.05);
        }

        .delete:hover{
            background:#b91c1c;
            transform:scale(1.05);
        }

        .no-data{
            text-align:center;
            padding:25px;
            font-weight:bold;
            color:#64748b;
            font-size:15px;
        }
    </style>

    <!-- Delete Confirmation Script -->
    <script>
        function confirmDelete(){
            return confirm("Are you sure you want to delete this employee?");
        }
    </script>

</head>
<body>

<!-- Include Header -->
<jsp:include page="header.jsp" />

<div class="content">

    <h2><i class="fa-solid fa-users"></i> Employee Management System</h2>

    <%
    String msg1 = (String)request.getParameter("msg1");
    if(msg1!=null){
    %>
    <p style="color:red"><%= msg1%></p>
    <%}%>

    <%
    String msg2 = (String)request.getParameter("msg2");
    if(msg2!=null){
    %>
    <p style="color:green"><%= msg2%></p>
    <%}%>

    <%
    String msg3 = (String)request.getParameter("msg3");
    if(msg3!=null){
    %>
    <p style="color:green"><%= msg3%></p>
    <%}%>

    <a href="employee?action=add" class="add-btn">
        <i class="fa-solid fa-user-plus"></i> Add Employee
    </a>


    <%
        int cnt=1;
        List<Employee> list = (List<Employee>)request.getAttribute("list");
        if(list!=null && !list.isEmpty()){
    %>

    <table>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Email</th>
            <th>Department</th>
            <th>Designation</th>
            <th>Salary</th>
            <th>Actions</th>
        </tr>

        <%
            for(Employee e : list){
        %>
        <tr>
            <td><%=cnt++%></td>
            <td><%=e.getName()%></td>
            <td><%=e.getEmail()%></td>
            <td><%=e.getDepartment()%></td>
            <td><%=e.getDesignation()%></td>
            <td><%=e.getSalary()%></td>
            <td>
                <a href="employee?action=edit&id=<%=e.getId()%>" class="action-link edit">
                    <i class="fa-solid fa-pen-to-square"></i> Edit
                </a>

                <a href="employee?action=delete&id=<%=e.getId()%>"
                   class="action-link delete"
                   onclick="return confirmDelete()">
                    <i class="fa-solid fa-trash"></i> Delete
                </a>
            </td>
        </tr>
        <%
            }
        %>

    </table>

    <%
        }else{
    %>
        <div class="no-data">
            <i class="fa-solid fa-circle-info"></i> No employees found.
        </div>
    <%
        }
    %>

</div>

</body>
</html>