package com.ITP.Servlet;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITP.Model.Attendence;
import com.ITP.Model.Employee;
import com.ITP.Services.AttendenceServicesImpl;

/**
 * Servlet implementation class InputAttendanceServlet
 */
@WebServlet("/InputAttendanceServlet")
public class InputAttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InputAttendanceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public static java.sql.Time convert(java.util.Date date) {
        return new java.sql.Time(date.getTime());
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<Employee> emplist = (ArrayList<Employee>) request.getSession(false).getAttribute("emplist");
		LocalDate d  = LocalDate.now();
		
		ZoneId defaultZoneId = ZoneId.systemDefault();

        Date date = Date.from(d.atStartOfDay(defaultZoneId).toInstant());
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		for(Employee e : emplist) {
			
			System.out.println(e.getfName() +" "+ e.getlName());
			int value = 0;
			
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm", Locale.ENGLISH);
			//surround below line with try catch block as below code throws checked exception
			
			String StartDateStr = request.getParameter(e.getEid()+"ArrivalTime");
			String DepDateStr = request.getParameter(e.getEid()+"DepTime");
			
			if(StartDateStr != "" && DepDateStr != "") {
				LocalTime time1 = LocalTime.parse(StartDateStr);
				LocalTime time2 = LocalTime.parse(DepDateStr);
	  
				// apply compareTo()
	        	value = time2.compareTo(time1);
			}
			
			
			if(StartDateStr != "" && DepDateStr != "" && value > 0) {
			
			System.out.println(StartDateStr);
			System.out.println(DepDateStr);
			
			Attendence at = new Attendence();
			AttendenceServicesImpl Aimpl = new AttendenceServicesImpl();
			
			try {
				Date startDate = sdf.parse(StartDateStr);
				Date DepDate = sdf.parse(DepDateStr);
				
				Time arrivalTime = convert(startDate);
				Time depDatTime = convert(DepDate);
				
				at.setEmpID(e.getEid());
				at.setAttDate(sqlDate);
				at.setArrTime(arrivalTime);
				at.setDepTime(depDatTime);
				
				
				
				
				
				Aimpl.addEmpAttendance(at);
				
				
				System.out.println(arrivalTime);
				System.out.println(depDatTime);
				
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			System.out.println();
			
			
		}
			
			
			
		 
			java.util.Date utilDate = new java.util.Date();
	        System.out.println("java.util.Date : " + utilDate);
	 
	        java.sql.Time sqlTime = convert(utilDate);
	        System.out.println("java.sql.Time : " + sqlTime);
	        
	        
			
		
		
	}
		
		request.getRequestDispatcher("MarkAttendanceServlet").forward(request, response);
	}

}
