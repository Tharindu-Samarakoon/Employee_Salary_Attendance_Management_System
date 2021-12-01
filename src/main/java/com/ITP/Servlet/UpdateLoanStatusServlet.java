package com.ITP.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITP.Model.SalaryChanges;
import com.ITP.Services.LoanServicesImpl;
import com.ITP.Services.SalaryChangesServicesImpl;

/**
 * Servlet implementation class UpdateLoanStatusServlet
 */
@WebServlet("/UpdateLoanStatusServlet")
public class UpdateLoanStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLoanStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int loanId, Status;
		LoanServicesImpl loanImpl = new LoanServicesImpl();
		
		loanId = Integer.parseInt(request.getParameter("LoanID"));
		Status = Integer.parseInt(request.getParameter("status"));
			
		loanImpl.UpdateLoanStatus(loanId, Status);
		
		request.getRequestDispatcher("Admin_View_loans.jsp").forward(request, response);
		
	}

}
