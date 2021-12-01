package com.ITP.Servlet;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import javax.servlet.http.HttpSession;

import com.ITP.Model.Attendence;
import com.ITP.Model.Employee;
import com.ITP.Services.AttendenceServicesImpl;

/**
 * Servlet implementation class InputPreviousAttendance
 */
@WebServlet("/InputPreviousAttendance")
public class InputPreviousAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InputPreviousAttendance() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public static java.sql.Time convert(java.util.Date date) {
        return new java.sql.Time(date.getTime());
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<Employee> emplist = (ArrayList<Employee>) request.getSession(false).getAttribute("emplist");
		
		
		
		for(Employee e : emplist) {
			
			System.out.println(e.getfName() +" "+ e.getlName());
			HttpSession session  =   request.getSession();
			java.sql.Date date = (java.sql.Date) session.getAttribute("GivenDate");
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
				at.setAttDate(date);
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

}
		request.getRequestDispatcher("MarkAttendanceServlet").forward(request, response);
}
	
}
