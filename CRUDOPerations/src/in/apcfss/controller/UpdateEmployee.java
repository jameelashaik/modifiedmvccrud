package in.apcfss.controller;

import in.apcfss.dto.Employee;


import in.apcfss.service.CRUDOPerations;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateEmployee extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	
		PrintWriter pw = null; 
		res.setContentType("text/html"); 
		try{
			pw = res.getWriter();

			RequestDispatcher rd = req.getRequestDispatcher("/updateEmp.jsp");
			rd.forward(req, res);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("doget employee update..exception");
		}
		finally{
			pw.close();
		}

	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String status=null;
		PrintWriter pw = null;

		try{

			pw = res.getWriter(); 
			System.out.println("trychecking..");


			status = CRUDOPerations.updateEmployee(req,res);
			System.out.println(status);
			if("update".equals(status)){
				pw.println("sucess update");
			}
			else{
				pw.println("failed update");
			}
		}
		catch(NumberFormatException ev){
			ev.printStackTrace();
			System.out.println("number exception");
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("exception cathedc for update employee dopost");
		}
		
		    
	}

}
