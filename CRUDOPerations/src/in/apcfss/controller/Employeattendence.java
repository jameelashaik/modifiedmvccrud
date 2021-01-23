package in.apcfss.controller;

import in.apcfss.dto.Employee;
import in.apcfss.service.CRUDOPerations;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Employeattendence extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String status=null;
		PrintWriter pw = null; 
		List<Employee> employeesList = null;
		try{
			pw = res.getWriter();
			pw.println("checking...");
			
			status = CRUDOPerations. AddEmployee(req, res);
			employeesList=CRUDOPerations.slipEmployee(req,res);
//			RequestDispatcher rd = req.getRequestDispatcher("/payslipemp.jsp");
//			rd.forward(req, res);
//			for(Employee e:employeesList)
//			{
//				pw.println("<a href='employepayslip?id="+e.getId()+"'>payslip</a>");
//			}
			if("success...".equals(status)){
				pw.println("sucessfullyy attendence added");
			}
			else{
				pw.println("failed adding attendence");
			}
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("exception cathedc for  employee attendence");
		}
		finally{
			pw.close();
		}
	}
}
