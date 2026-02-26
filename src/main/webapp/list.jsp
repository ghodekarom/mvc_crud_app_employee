<%@ page import="java.util.*,com.myproject.crudapp.model.entity.Employee"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mvc_crud_app</title>
</head>
<body>
    <h3>Employee Management System</h3>

    <a href="employee?action=add">add</a>
    <table border=1>
        <thead>
            <tr>
                <td>ID</td>
                <td>NAME</td>
                <td>EMAIL</td>
                <td>DEPARTMENT</td>
                <td>DESINGATION</td>
                <td>SALARY</td>
                <td>ACTION</td>
            </tr>
        </thead>
        <tbody>

           <%
           String msg1 = request.getParameter("msg1");
           if(msg1!=null){
           %>
           <p style="color:red"><%= msg1%></p>
           <%}%>

          <%
           String msg2 = request.getParameter("msg2");
           if(msg2!=null){
           %>
           <p style="color:green"><%= msg2%></p>
           <%}%>

           <%
           String msg3 = request.getParameter("msg3");
           if(msg3!=null){
           %>
           <p style="color:green"><%= msg3%></p>
           <%}%>

            <%
            int cnt = 1;
            List<Employee> elist = (List<Employee>)request.getAttribute("list");
            if(elist!=null && !elist.isEmpty()){
              for(Employee emp : elist){
            %>
            <tr>
                <td><%= cnt++%></td>
                <td><%= emp.getName()%></td>
                <td><%= emp.getEmail()%></td>
                <td><%= emp.getDepartment()%></td>
                <td><%= emp.getDesignation()%></td>
                <td><%= emp.getSalary()%></td>
                <td>
                    <a href="employee?action=edit&id=<%= emp.getId()%>">update</a>
                    <a href="employee?action=delete&id=<%= emp.getId()%>" onclick="return confirm('delete record') ">delete</a>
                </td>
            </tr>
            <%}
            }else{%>
            <tr>
               <td colspan="7">
                  <p>no records found</p>
               </td>
            </tr>
            <%}%>
        </tbody>
    </table>
</body>
</html>