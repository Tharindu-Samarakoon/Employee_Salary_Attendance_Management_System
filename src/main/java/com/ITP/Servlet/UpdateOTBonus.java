package com.ITP.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITP.Model.OTbonus;
import com.ITP.Services.SalaryChangesServicesImpl;

/**
 * Servlet implementation class UpdateOTBonus
 */
@WebServlet("/UpdateOTBonus")
public class UpdateOTBonus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOTBonus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SalaryChangesServicesImpl Impl = new SalaryChangesServicesImpl();
		OTbonus OT = new OTbonus();
		
		Double rate = Double.parseDouble(request.getParameter("Rate"));
		OT.setRate(rate);
		
		Impl.updateOTbonus(OT);
		
		request.getRequestDispatcher("addBonus.jsp").forward(request, response);
		
		
	}

}
