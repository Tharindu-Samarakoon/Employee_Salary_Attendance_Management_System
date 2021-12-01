package com.ITP.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITP.Model.Employee;
import com.ITP.Model.OTbonus;
import com.ITP.Model.Salary;
import com.ITP.Model.SalaryChanges;
import com.ITP.Services.AttendenceServicesImpl;
import com.ITP.Services.LoanServicesImpl;
import com.ITP.Services.SalaryChangesServicesImpl;
import com.ITP.Services.SalaryServicesImpl;
import com.ITP.Utility.DBConnection;
import com.mysql.cj.Session;

/**
 * Servlet implementation class CalculateSalaryServlet
 */
@WebServlet("/CalculateSalaryServlet")
public class CalculateSalaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculateSalaryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		Employee E = new Employee();
		E = (Employee) session.getAttribute("empD");
		LocalDate L = LocalDate.now();
		ArrayList<Salary> salList = new ArrayList<Salary>();
		SalaryChangesServicesImpl impl = new SalaryChangesServicesImpl();
		int OTHours;
		OTbonus OT = new OTbonus();
		OT = impl.getOTbonus();
		
		Double OTRate = OT.getRate();
		Double OTBonus;
		AttendenceServicesImpl attImpl = new AttendenceServicesImpl();
		SalaryChangesServicesImpl sc = new SalaryChangesServicesImpl();
		LoanServicesImpl loanImpl = new LoanServicesImpl();
		
		int month = L.getMonthValue();
		int year = L.getYear();
		
		Salary S = new Salary();
		SalaryServicesImpl SInpl = new SalaryServicesImpl();
		
		System.out.println(E.getDepartment());
		
		OTHours = attImpl.TotalOThours(month, year, E.getEid());
		
		System.out.println(OTHours);
		
		OTBonus = OTHours*OTRate;
		
		System.out.println(OTBonus);
		
		
		Connection con;
		PreparedStatement ps;
		ResultSet rs = null;
		String status1 = "ok";
		String status2 = "nope";
		SalaryChangesServicesImpl SCImpl = new SalaryChangesServicesImpl();
		ArrayList<SalaryChanges> SClist = new ArrayList<SalaryChanges>();
		
		try {
			con = DBConnection.getConnection();
		
		ps = con.prepareStatement("Select * from Salary where emp_id = ? and year = ? and salary_month = ?");
		ps.setInt(1, E.getEid());
		ps.setInt(2, year);
		ps.setInt(3, month);
		
		
		
		
		
		rs = ps.executeQuery();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		try {
			if(rs.next() == false) {
				S = SInpl.CalculateSalary(E);
				Double loanAmt = loanImpl.getLoanDeductions(E.getEid());
				System.out.println(loanAmt);
				S.setNetAmt(S.getNetAmt() - loanAmt);
				S.setLoanDeductable(loanAmt);
				S.setGrossAmt(S.getGrossAmt() + OTBonus);
				S.setNetAmt(S.getNetAmt() + OTBonus);
				S.setOTbonus(OTBonus);
				
				
				SInpl.InsertSalary(S);
				SClist = SCImpl.getChanges(E.getDepartment());
				
				for(SalaryChanges SC : SClist) {
					
					if(SC.getStatus().equals("Active")) {
						//sc.addSalaryBonusRelation(S.getSalaryID(), SC.getID());
						System.out.println("Should Print Salary Bonus");
					}
					
				}
				
				session.setAttribute("Salary", S);
				session.setAttribute("status", status1);
				session.setAttribute("OT", OTBonus);
				System.out.println(OTBonus);
				
				
			} else {
				
				S = SInpl.getEmpSalary(E.getEid(), year, month);
				
				session.setAttribute("Salary", S);
				session.setAttribute("status", status1);
				session.setAttribute("OT", OTBonus);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		salList = SInpl.getPrevSalaries(E);
		session.setAttribute("prevSalaries", salList);
		
		
		
		request.getRequestDispatcher("EmployeeSalarySlip.jsp").forward(request, response);

	}

}
