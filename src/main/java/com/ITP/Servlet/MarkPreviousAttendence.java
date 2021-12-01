package com.ITP.Servlet;

import java.io.IOException;

import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITP.Model.Employee;
import com.ITP.Services.AttendenceServicesImpl;

/**
 * Servlet implementation class MarkPreviousAttendence
 */
@WebServlet("/MarkPreviousAttendence")
public class MarkPreviousAttendence extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarkPreviousAttendence() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ZoneId defaultZoneId = ZoneId.systemDefault();
		
		AttendenceServicesImpl attImp = new AttendenceServicesImpl();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH);
		ArrayList<Employee> emplist = new ArrayList<Employee>();
		
		String date = request.getParameter("date");
		
		System.out.println("date from form==========="+date);
		
			java.util.Date atDate = Date.valueOf(date);
			
			System.out.println("java.Data========"+atDate);
			
	        java.sql.Date sqlDate = new java.sql.Date(atDate.getTime());
	        
	        System.out.println("===================="+sqlDate);
			
			emplist = attImp.getEmployeesOn(sqlDate);
			
			HttpSession session  =   request.getSession() ;
	    	session.setAttribute("emplist", emplist);
	    	session.setAttribute("GivenDate", sqlDate);
			

		
		
    	
    	request.getRequestDispatcher("Admin_Emp_attendence2.jsp").forward(request, response);
		
		
		
		
		
	}

}
