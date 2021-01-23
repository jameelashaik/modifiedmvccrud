<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateEmp.jsp' starting page</title>
    
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
 <%
 String sid=request.getParameter("id"); 
int id=Integer.parseInt(sid);
Employee e=CRUDOPerations.getEmployeeById(id); 
 System.out.println("checking getname:"+e.getName());
 System.out.println("using java code in jsp"); 
%>
	<form action="updateemp" method="post" align="center">
	<input type='hidden' name='id' value='<%= e.getId()%>'>
		Name:<input type="text" name="user" value='<%=e.getName() %>'
		pattern="[A-Za-z]{4,12}"
			title="name must be between 4 and 12 charecters length and contains only letters and numbers"
			required><br> <br>
		dob:<input type="date"  value='<%=e.getDob() %>'
			name="dob" max="2000-12-31" min="1970-01-01"
			title="DOB should not be greater than 50 years of age with current date"
			required><br> <br>
		 Qualification:<select
			name="qualification"  value='<%=e.getQualification() %>' required>
			<option value="" name="qualification">Select</option>
			<option value="B.Tech" name="qualification">btech</option>
			<option value="B.com" name="qualification">bcom</option>
			<option value="bsc" name="qualification">bsc</option>
			<option value="other" name="qualification">other</option>
			</select><br> <br>
		 Gender: <input type="radio" id="male" name="gender"
			value="male" required>
			 <label for="male">Male</label><br><br>
		<input type="radio" id="female" name="gender" value="female" required>
		<label for="female">Female</label><br><br> 
		<input type="radio" id="other" name="gender" value="other" required> <label  for="other">Other</label><br><br>
			
		 Date of joining: <input
			type="date" min="1970-01-01" name="joiningdate"  value='<%=e.getDoj() %>'
			title="DOJ should not be less than 50 years of age with current date"
			required> <br><br>
		Pancard :<input type="text" name="pancard"  value='<%=e.getPancard() %>'
			pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}" title="incorrect pan card number" required><br><br>	
					
	  	Salary :<input type="text" name="salary"  value='<%=e.getSalary() %>'
			pattern="[0-9]{1,20}" title="salary must be numeric" required><br><br>
			<input type='hidden' name='dayspresent'  value='<%=e.getDayspresent() %>'>
		<input type="submit" value="submit">
	</form>
  </body>
</html>
