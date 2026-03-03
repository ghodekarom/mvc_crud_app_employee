<%@page import="java.util.*,com.myproject.crudapp.model.entity.Employee"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Employee List</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
rel="stylesheet">

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
}

.add-btn:hover{
    background:#15803d;
}

table{
    width:100%;
    background:white;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 8px 20px rgba(0,0,0,0.08);
}

th, td{
    padding:14px;
    text-align:center;
    border-bottom:1px solid #e5e7eb;
}

th{
    background:#0f172a;
    color:white;
    text-transform:uppercase;
}

tr:nth-child(even){
    background:#f9fafb;
}

tr:hover{
    background:#e2e8f0;
}

.action-link{
    text-decoration:none;
    padding:6px 12px;
    border-radius:5px;
    font-size:13px;
    font-weight:bold;
    margin:0 3px;
}

.edit{ background:#0284c7; color:white; }
.delete{ background:#dc2626; color:white; }

.no-data{
    text-align:center;
    padding:25px;
    font-weight:bold;
    color:#64748b;
}

/* Pagination Box */
.pagination-box{
    background:white;
    margin-top:30px;
    padding:25px;
    border-radius:12px;
    box-shadow:0 6px 18px rgba(0,0,0,0.06);
}

.pagination .page-link{
    transition:0.2s ease;
    font-weight:500;
}

.pagination .page-link:hover{
    background:#0f172a;
    color:white;
}
</style>

<script>
function confirmDelete(){
    return confirm("Are you sure you want to delete this employee?");
}
</script>

</head>
<body>

<jsp:include page="header.jsp" />

<div class="content">

<h2><i class="fa-solid fa-users"></i> Employee Management System</h2>

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

<% for(Employee e : list){ %>
<tr>
<td><%=cnt++%></td>
<td><%=e.getName()%></td>
<td><%=e.getEmail()%></td>
<td><%=e.getDepartment()%></td>
<td><%=e.getDesignation()%></td>
<td><%=e.getSalary()%></td>
<td>
<a href="employee?action=edit&id=<%=e.getId()%>" class="action-link edit">
<i class="fa-solid fa-pen-to-square"></i>
</a>

<a href="employee?action=delete&id=<%=e.getId()%>"
class="action-link delete"
onclick="return confirmDelete()">
<i class="fa-solid fa-trash"></i>
</a>
</td>
</tr>
<% } %>
</table>

<% } else { %>
<div class="no-data">
<i class="fa-solid fa-circle-info"></i> No employees found.
</div>
<% } %>

<!-- ================= PAGINATION MODULE ================= -->

<%
int totalpages = (int)request.getAttribute("totalpages");
int currentpage = (int)request.getAttribute("currentpage");
int currentpagesize = (int)request.getAttribute("currentpagesize");
int totalrecords = (int)request.getAttribute("totalrecords");
int start = ((currentpage-1)*currentpagesize)+1;
int end = Math.min((start + currentpagesize-1),totalrecords);
%>

<% if(totalrecords>0){ %>

<div class="pagination-box">

<!-- TOP INFO ROW -->
<div class="d-flex justify-content-between align-items-center flex-wrap mb-4">

<div>
<strong>Showing <%=start%> to <%=end%> of <%= totalrecords%> entries</strong>
</div>

<!-- SHOW ENTRIES + GO TO (ADJACENT) -->
<div class="d-flex align-items-center gap-4">

<form action="employee" class="d-flex align-items-center">
Show&nbsp;
<select name="pagesize"
class="form-select form-select-sm"
style="width:90px;"
onchange="this.form.submit()">
<option></option>
<option value="5" <%=(currentpagesize==5)?"selected":"" %>>5</option>
<option value="10" <%=(currentpagesize==10)?"selected":"" %>>10</option>
<option value="20" <%=(currentpagesize==20)?"selected":"" %>>20</option>
<option value="50" <%=(currentpagesize==50)?"selected":"" %>>50</option>
<option value="100" <%=(currentpagesize==100)?"selected":"" %>>100</option>
<option value="200" <%=(currentpagesize==200)?"selected":"" %>>200</option>
</select>
&nbsp;entries
</form>

<form action="employee" method="post"
class="d-flex align-items-center">
<input type="hidden" name="pagesize"
value="<%= currentpagesize%>">

<input type="number" name="page"
class="form-control form-control-sm me-2"
style="width:90px;"
min=1 max=<%= totalpages%>
placeholder="Page">

<button type="submit"
class="btn btn-sm btn-dark">
<i class="fa-solid fa-arrow-right"></i>
</button>
</form>

</div>
</div>

<!-- PAGINATION NAVIGATION -->
<% if(totalpages>1){ %>

<nav class="d-flex justify-content-center">
<ul class="pagination mb-0">

<li class="page-item <%= (currentpage==1)?"disabled":""%>">
<a class="page-link"
href="employee?page=1&pagesize=<%=currentpagesize%>">
<i class="fa-solid fa-angles-left"></i>
</a>
</li>

<li class="page-item <%= (currentpage==1)?"disabled":"" %>">
<a class="page-link"
href="employee?page=<%=currentpage-1%>&pagesize=<%= currentpagesize%>">
<i class="fa-solid fa-angle-left"></i>
</a>
</li>

<% for(int i=1;i<=totalpages;i++){%>
<li class="page-item <%= (i==currentpage)?"active":""%>">
<a class="page-link"
href="employee?page=<%= i%>&pagesize=<%= currentpagesize%>"><%=i%></a>
</li>
<%}%>

<li class="page-item <%= (currentpage==totalpages)?"disabled":""%>">
<a class="page-link"
href="employee?page=<%=currentpage+1%>&pagesize=<%= currentpagesize%>">
<i class="fa-solid fa-angle-right"></i>
</a>
</li>

<li class="page-item <%= (currentpage==totalpages)?"disabled":""%>">
<a class="page-link"
href="employee?page=<%=totalpages%>&pagesize=<%= currentpagesize%>">
<i class="fa-solid fa-angles-right"></i>
</a>
</li>

</ul>
</nav>

<% } %>

</div>

<% } %>

</div>
</body>
</html>