package com.ITP.Services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import com.ITP.Model.Employee;
import com.ITP.Model.Salary;
import com.ITP.Model.SalaryChanges;
import com.ITP.Utility.DBConnection;

public class SalaryServicesImpl {
	
	public Salary CalculateSalary(Employee E) {
		
		Connection con;
		PreparedStatement ps;
		SalaryChangesServicesImpl SCImpl = new SalaryChangesServicesImpl();
		Salary S = new Salary();
		LocalDate L = LocalDate.now();
		
		
		int month = L.getMonthValue();
		int year = L.getYear();
		
		Double NetSalary;
		Double TotalDeductions = 0.0;
		Double GrossSalary = (double) E.getBasicSalary();
		
		ArrayList<SalaryChanges> SClist = new ArrayList<SalaryChanges>();
		
		SClist = SCImpl.getChanges(E.getDepartment());
		
		for(SalaryChanges SC : SClist) {
			
			if(SC.getStatus().equals("Active")) {
			
			double Change = 0;
			
			if(SC.getHour_per().equals("percentage")) {
				
				Change = E.getBasicSalary()*SC.getRate()/100;
					
				
			}
			System.out.println(SC.getType());
			
			if(SC.getType().equals("bonus")) {
				
				System.out.println("Bonus LoOP is this printing");
				
				GrossSalary = GrossSalary + Change;
				
			} else {
				
				
				TotalDeductions = TotalDeductions + Change;
				
				}
			
			}
			
			
		}
		

		
		
		
		
		
		
		NetSalary = GrossSalary - TotalDeductions; 
		
		
		S.setEmpID(E.getEid());
		S.setGrossAmt(GrossSalary);
		S.setNetAmt(NetSalary);
		S.setSalaryMonth(month);
		S.setYear(year);
		
		
		
		return S;
		
	}
	
	public void InsertSalary(Salary S) {
		
		
		Connection con;
		PreparedStatement ps;
		int previousID = 0;

		try {
			con = DBConnection.getConnection();
		
		
		ps = con.prepareStatement("SELECT * FROM salary ORDER BY Salary_ID DESC LIMIT 1");
		
		ResultSet rs = ps.executeQuery();
		
		System.out.println("Stuff is happening");
		
		
		if(rs != null) {
			while(rs.next()) {
				previousID = rs.getInt("Salary_ID");
			}
			previousID++;
		} else {
			System.out.println("RS is null");
			previousID = 1;
		}
		
		ps = con.prepareStatement("Insert into Salary(Net_amt, Gross_amt, Salary_Month, Emp_id, year, salary_id, Loan_Deduction, OTbonus) values(?, ?, ?, ?, ?, ?,?,?)");
		ps.setDouble(1, S.getNetAmt());
		ps.setDouble(2, S.getGrossAmt());
		ps.setInt(3, S.getSalaryMonth());
		ps.setInt(4, S.getEmpID());
		ps.setInt(5, S.getYear());
		ps.setInt(6, previousID);
		ps.setDouble(7, S.getLoanDeductable());
		ps.setDouble(8, S.getOTbonus());
		
		int i = ps.executeUpdate();
		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
	public ArrayList<Salary> getPrevSalaries(Employee E) {
		
		ArrayList<Salary> salList = new ArrayList<Salary>();
		Connection con;
		PreparedStatement ps;
		int previousID = 0;

			try {
				con = DBConnection.getConnection();
			
		
		
		ps = con.prepareStatement("SELECT * FROM salary where emp_id = ? Order by Year, Salary_month");
		ps.setInt(1, E.getEid());
		
		ResultSet rs = ps.executeQuery();
		
		System.out.println("Stuff is happening");
		
		while(rs.next()) {
			
			Salary S = new Salary();
			
			S.setSalaryID(rs.getInt("Salary_ID"));
			S.setEmpID(E.getEid());
			S.setGrossAmt(rs.getDouble("gross_amt"));
			S.setNetAmt(rs.getDouble("Net_amt"));
			S.setLoanDeductable(rs.getDouble("Loan_Deduction"));
			S.setSalaryMonth(rs.getInt("Salary_Month"));
			S.setYear(rs.getInt("year"));
			S.setLoanDeductable(rs.getDouble("Loan_Deduction"));
			S.setOTbonus(rs.getDouble("OTbonus"));
			
			salList.add(S);
			
			
			
		}
		
		
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		

		
	
		
		return salList;
		
		
	}
	
	public Salary getEmpSalary(int empID, int year, int month) {
		
		Salary S = new Salary();
		Connection con;
		PreparedStatement ps;

			try {
				con = DBConnection.getConnection();
			
		
		
		ps = con.prepareStatement("SELECT * FROM salary where emp_id = ? and year = ? and Salary_Month = ?");
		ps.setInt(1, empID);
		ps.setInt(2, year);
		ps.setInt(3, month);
		
		ResultSet rs = ps.executeQuery();
		
		System.out.println("Stuff is happening");
		
		while(rs.next()) {
			
			S.setSalaryID(rs.getInt("Salary_ID"));
			S.setEmpID(rs.getInt("Emp_id"));
			S.setGrossAmt(rs.getDouble("gross_amt"));
			S.setNetAmt(rs.getDouble("Net_amt"));
			S.setLoanDeductable(rs.getDouble("Loan_Deduction"));
			S.setSalaryMonth(rs.getInt("Salary_Month"));
			S.setYear(rs.getInt("year"));
			S.setOTbonus(rs.getDouble("OTbonus"));
			
		}
		
		
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		

		
	
		
		return S;
		
		
	}
	
	

}
