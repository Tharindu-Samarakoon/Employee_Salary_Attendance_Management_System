package com.ITP.Services;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;

import com.ITP.Model.Loan;
import com.ITP.Utility.DBConnection;

public class LoanServicesImpl {
	
	public void addNewRequest(Loan l) {
		
		Connection con;
		PreparedStatement ps;
		int previousID = 0;
		LocalDate d  = LocalDate.now();
		ZoneId defaultZoneId = ZoneId.systemDefault();

        Date date = Date.from(d.atStartOfDay(defaultZoneId).toInstant());
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        
        double monthAmt = l.getLoanAmt()/l.getLoanPeriod();
		
		
		try {
			
			con = DBConnection.getConnection();
			
			ps = con.prepareStatement("SELECT * FROM loan ORDER BY Loan_ID DESC LIMIT 1");
			
			ResultSet rs = ps.executeQuery();
			
			
			if(rs != null) {
				while(rs.next()) {
					previousID = rs.getInt("Loan_ID");
				}
				previousID++;
			} else {
				System.out.println("RS is null");
				previousID = 1;
			}
			
			ps= con.prepareStatement("insert into loan values(?,?,?,?,?,?,?,?)");
			ps.setInt(1, l.getEmpID());
			ps.setInt(2, previousID);
			ps.setInt(3, l.getLoanPeriod());
			ps.setDouble(4, monthAmt);
			ps.setDate(5, sqlDate);
			ps.setString(6, l.getLoanStatus());
			ps.setDouble(7, l.getLoanAmt());
			ps.setDouble(8, l.getLoanAmt());
			
			
			
			ps.executeUpdate();
			con.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public ArrayList<Loan> getRequestedLoanDetails() {
		
		ArrayList<Loan> loanList = new ArrayList<Loan>();
		
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		
		try {
			
			con = DBConnection.getConnection();
			ps = con.prepareStatement("Select * from loan where Loan_Status = ?");
			ps.setString(1, "Requested");
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Loan l = new Loan();
				
				l.setEmpID(rs.getInt("Emp_id"));
				l.setLoanID(rs.getInt("Loan_ID"));
				l.setLoanPeriod(rs.getInt("Loan_Period"));
				l.setLoanAmt(rs.getInt("amount"));
				l.setStartDate(rs.getDate("Start_Date"));
				l.setMonthlyAmt(rs.getDouble("Monthly_amt"));
				l.setLoanStatus(rs.getString("Loan_Status"));
				
				loanList.add(l);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return loanList;
	}
	
	
public ArrayList<Loan> getEmpRequestedLoanDetails(int empID) {
		
		ArrayList<Loan> loanList = new ArrayList<Loan>();
		
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		
		try {
			
			con = DBConnection.getConnection();
			ps = con.prepareStatement("Select * from loan where Emp_id = ?");
			ps.setInt(1, empID);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Loan l = new Loan();
				
				l.setEmpID(rs.getInt("Emp_id"));
				l.setLoanID(rs.getInt("Loan_ID"));
				l.setLoanPeriod(rs.getInt("Loan_Period"));
				l.setLoanAmt(rs.getInt("amount"));
				l.setStartDate(rs.getDate("Start_Date"));
				l.setMonthlyAmt(rs.getDouble("Monthly_amt"));
				l.setLoanStatus(rs.getString("Loan_Status"));
				l.setAmtLeft(rs.getDouble("amount_to_pay"));
				
				loanList.add(l);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return loanList;
	}

	public void UpdateLoanStatus (int loanID, int status) {
		
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		
		try {
			
			con = DBConnection.getConnection();
			ps = con.prepareStatement("Select * from loan where Loan_ID = ?");
			ps.setInt(1, loanID);
			
			
			
			if(status == 1) {
				
				ps = con.prepareStatement("UPDATE loan SET Loan_Status = 'Active' where Loan_ID = ?");
				ps.setInt(1, loanID);
				ps.executeUpdate();
				
			} else {
				
				ps = con.prepareStatement("UPDATE loan SET Loan_Status = 'Failed' where Loan_ID = ?");
				ps.setInt(1, loanID);
				ps.executeUpdate();
				
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public Double getLoanDeductions(int empID) {
		
		Connection con;
		PreparedStatement ps, ps2, ps3;
		ResultSet rs;
		Double totalLoanDeduction = 0.0;
		
		try {
			
			con = DBConnection.getConnection();
			ps = con.prepareStatement("Select * from loan where Emp_id = ? and Loan_Status = 'Active'");
			ps.setInt(1, empID);
			ps2 = con.prepareStatement("UPDATE loan SET Loan_Status = 'Finished' WHERE Loan_ID = ?");
			ps3 = con.prepareStatement("Update loan SET amount_to_pay = ? where loan_ID = ?");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Double amt = rs.getDouble("Monthly_amt");
				System.out.println(amt);
				
				if(rs.getDouble("amount_to_pay") < 1 ) {
					
					ps2.setInt(1, rs.getInt("Loan_ID"));
					ps2.executeUpdate();
					
				} else if((amt+1.0) >= rs.getDouble("amount_to_pay")) {
					
					totalLoanDeduction = totalLoanDeduction + amt;
					ps3.setDouble(1, 0.0);
					ps3.setDouble(2, rs.getInt("Loan_ID"));
					ps2.setInt(1, rs.getInt("Loan_ID"));
					ps2.executeUpdate();
					ps3.executeUpdate();
					
					
					
				} else {
					
					totalLoanDeduction = totalLoanDeduction + amt;
					ps3.setDouble(1, (rs.getDouble("amount_to_pay") - amt));
					ps3.setDouble(2, rs.getInt("Loan_ID"));
					ps3.executeUpdate();
					
				}
				
				
				
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return totalLoanDeduction;
		
	}

}
