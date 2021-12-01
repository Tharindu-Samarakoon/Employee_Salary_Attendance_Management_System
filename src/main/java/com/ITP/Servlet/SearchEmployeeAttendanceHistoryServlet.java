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
 * Servlet implementation class SearchEmployeeAttendanceHistoryServlet
 */
@WebServlet("/SearchEmployeeAttendanceHistoryServlet")
public class SearchEmployeeAttendanceHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchEmployeeAttendanceHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int year = Integer.parseInt(request.getParameter("Year"));
		int month = Integer.parseInt(request.getParameter("Month"));
		int empID = Integer.parseInt(request.getParameter("Empid"));
		
		
		ArrayList<Attendence> attlist = new ArrayList<>();
		
		AttendenceServicesImpl attImpl = new AttendenceServicesImpl();
		
		
		attlist = attImpl.getOneEmployeeAttendanceFrom(month, year, empID);
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("list", attlist);
		
		request.getRequestDispatcher("EmployeeAttendanceHistory2.jsp").forward(request, response);
		
		
	}

}
