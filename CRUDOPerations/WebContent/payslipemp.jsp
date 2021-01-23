<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'payslipemp.jsp' starting page</title>
    
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
  <%List<Employee> employeesList = null; %>
  <%@ page import="in.apcfss.service.CRUDOPerations" %>
  <%@ page import="in.apcfss.dto.Employee" %>
  <%@ page import="java.io.PrintWriter "%>
  <%employeesList=CRUDOPerations.slipEmployee(request,response); %>

  <%float totaldays=30; %>
  <% float basic_sal=0; 
  	int pid=0;
  	String pname=null;
  	String ppancard=null;
  	int pdayspresent=0;
  	
  %>
  <%PrintWriter pw = null;
  response.setContentType("text/html"); 
  	for (Employee e : employeesList) {
  		basic_sal = e.getSalary();
  		pid =e.getId();
  		pname = e.getName();
  		ppancard = e.getPancard();
  		pdayspresent = e.getDayspresent();
  	}
  	System.out.println("checking salary in payslip jsp file:"
  			+ basic_sal);
  	float basic_pay = 0;
  	float da = 0;
  	float hra = 0;
  	float pf = 0;
  	float pt = 0;
  	float net_salary = 0;
  	float gross_total =0;
  	gross_total = ((basic_sal/totaldays)*(pdayspresent));
  	basic_pay = (int) ((0.4) * (gross_total));
  	da = (int) ((0.3) * (gross_total));
  	hra = (int) ((0.3) * (gross_total));
  	pf = (int) ((0.125) * (gross_total));
  	if (gross_total < 15000) {
  		pt = 150;
  	} else {
  		pt = 200;
  	}
  	net_salary = ((gross_total) - (pf + pt));
  %>
	<h1>Employees payslip List</h1>
	<table border='1' width='100%'>
		<tr>
		<th>EmpId</th><th>Name</th><th>Pancard</th><th>grosstotal</th>
		<th>dayspresent</th><th>basicpay</th><th>DA</th><th>HRA</th><th>PF</th><th>PT</th><th>NETSALARY</th> 
		</tr>
		
		<tr>
		<td><%=pid %></td>
		<td><%=pname %></td>
		<td><%=ppancard %></td>
		<td><%=gross_total %></td>
		<td><%=pdayspresent %></td>
		<td><%=basic_pay %></td>
		<td><%=da %></td>
		<td><%=hra %></td>
		<td><%=pf %></td>
		<td><%=pt %></td>
		<td><%=net_salary %></td>
		</tr>
	</table>   
	   		
  </body>
</html>
