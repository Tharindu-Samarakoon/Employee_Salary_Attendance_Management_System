package com.ITP.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITP.Model.Attendence;
import com.ITP.Services.AttendenceServicesImpl;

/**
 * Servlet implementation class SearchAttendanceReportServlet
 */
@WebServlet("/SearchAttendanceReportServlet")
public class SearchAttendanceReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAttendanceReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AttendenceServicesImpl attImpl = new AttendenceServicesImpl();
		ArrayList<Attendence> attlist = new ArrayList<>();
		
		String department = request.getParameter("Department");
		String Type = request.getParameter("Type");
		int year = Integer.parseInt(request.getParameter("Year"));
		int month = Integer.parseInt(request.getParameter("Month"));
		
		attlist = attImpl.getAllEmployeeAttendanceFrom(month, year);
		
		request.setAttribute("attendance", attlist);
		request.setAttribute("department", department);
		request.setAttribute("type", Type);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		
		request.getRequestDispatcher("EmployeeAttendanceReport2.jsp").forward(request, response);
		
		
		
	}

}
