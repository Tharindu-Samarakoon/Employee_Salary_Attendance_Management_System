package com.ITP.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITP.Model.SalaryChanges;
import com.ITP.Services.SalaryChangesServicesImpl;

/**
 * @author Tharindu
 * Servlet implementation class UpdateSalaryAdjustments
 */
@WebServlet("/UpdateSalaryAdjustmentsServlet")
public class UpdateSalaryAdjustmentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSalaryAdjustmentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SalaryChanges SC = new SalaryChanges();
		SalaryChangesServicesImpl SCImpl = new SalaryChangesServicesImpl();
		
		SC.setName(request.getParameter("fname"));
		SC.setType(request.getParameter("Type"));
		SC.setChangeFor(request.getParameter("Department"));
		SC.setHour_per("percentage");
		SC.setRate(Double.parseDouble(request.getParameter("Rate")));
		SC.setID(Integer.parseInt(request.getParameter("ChangeID")));
		
		SCImpl.updateChange(SC);
		
		request.getRequestDispatcher("addBonus.jsp").forward(request, response);
		
		
		
	}

}
