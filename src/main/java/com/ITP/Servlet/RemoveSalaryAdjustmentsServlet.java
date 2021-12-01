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
 * Servlet implementation class RemoveSalaryAdjustments
 */
@WebServlet("/RemoveSalaryAdjustmentsServlet")
public class RemoveSalaryAdjustmentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveSalaryAdjustmentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SalaryChangesServicesImpl SCImpl = new SalaryChangesServicesImpl();
		int sdID = Integer.parseInt(request.getParameter("ChangeID"));
		
		SCImpl.RemoveChange(sdID);
		request.getRequestDispatcher("addBonus.jsp").forward(request, response);
		
	}

}
