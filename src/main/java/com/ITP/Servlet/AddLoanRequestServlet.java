package com.ITP.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITP.Model.Employee;
import com.ITP.Model.Loan;
import com.ITP.Services.LoanServicesImpl;

/**
 * Servlet implementation class AddLoanRequestServlet
 */
@WebServlet("/AddLoanRequestServlet")
public class AddLoanRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLoanRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Loan loan = new Loan();
		HttpSession session = request.getSession();
		
		Employee emp = (Employee)session.getAttribute("empD");
		
		loan.setEmpID(emp.getEid());
		loan.setLoanPeriod(Integer.parseInt(request.getParameter("loanPeriod")));
		loan.setLoanAmt(Double.parseDouble(request.getParameter("loanAmt")));
		loan.setLoanStatus("Requested");
		
		LoanServicesImpl lImpl = new LoanServicesImpl();
		lImpl.addNewRequest(loan);
		request.getRequestDispatcher("Emp_loan_request.jsp").forward(request, response);
		
		
	}

}
