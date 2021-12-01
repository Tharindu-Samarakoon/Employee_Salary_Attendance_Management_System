package com.ITP.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITP.Model.Employee;
import com.ITP.Services.AttendenceServicesImpl;

/**
 * @author Tharindu
 * Servlet implementation class MarkAttendenceServlet
 */
@WebServlet("/MarkAttendanceServlet")
public class MarkAttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarkAttendanceServlet() {
        super();
        // TODO Auto-generated constructor stub
        
        
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AttendenceServicesImpl attImp = new AttendenceServicesImpl();
		
		ArrayList<Employee> emplist = attImp.getEmployees();
		
		HttpSession session  =   request.getSession() ;
    	session.setAttribute("emplist", emplist);
    	
    	request.getRequestDispatcher("Admin_Emp_attendence.jsp").forward(request, response);
		
		
	}

}
