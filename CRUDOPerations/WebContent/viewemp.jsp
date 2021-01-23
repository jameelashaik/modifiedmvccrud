<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'viewemp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%@ page import="in.apcfss.service.CRUDOPerations" %>
  <%@ page import="in.apcfss.dto.Employee" %>
  <%@ page import="java.io.PrintWriter" %>
  <%response.setContentType("text/html"); 

  %>
  <h1>Employees List</h1>
  <%List<Employee> employeesList = null; %>
  <%employeesList = CRUDOPerations.viewEmployee(request, response); %>

  <table border='1' width='100%'>
  <tr><th>Id</th><th>Name</th><th>qualification</th><th>gender</th><th>doj</th>
  <th>Pancard</th><th>dob</th><th>salary</th><th>attendenceform</th>
	   <th>Edit</th><th>Delete</th><th>payslip</th></tr>
		<%
			for (Employee e : employeesList) {

					 out.print("<tr><td>"+e.getId()+"</td><td>"+e.getName()+"</td><td>"+e.getQualification()+"</td> " +
				 		"<td>"+e.getGender()+"</td><td>"+e.getDoj()+"</td><td>"+e.getPancard()+"</td><td>"+e.getDob()+"</td><td>"+e.getSalary()+"</td><td><a href='save_add?id="+e.getId()+"'>attendenceform</a></td><td><a href='updateemp?id="+e.getId()+"'>edit</a></td>" +
				 				"<td><a href='deleteEmployee?id="+e.getId()+"'>delete</a></td><td><a href='employepayslip?id="+e.getId()+"'>payslip</a></td></tr>");  
			
			}
		%>

		</tr>
	</table>
  </body>
</html>
