package com.ITP.Model;

import java.util.Date;

public class Loan {
	
	private int loanID;
	private int loanPeriod;
	private double monthlyAmt;
	private Date startDate;
	private String LoanStatus;
	private int empID;
	private double loanAmt;
	private double amtLeft;
	
	
	/**
	 *Getter for loanAmt
	 *@return the loanAmt
	 */
	public double getLoanAmt() {
		return loanAmt;
	}




	/**
	 *Setter for loanAmt
	 * @param loanAmt the loanAmt to set
	 */
	public void setLoanAmt(double loanAmt) {
		this.loanAmt = loanAmt;
	}




	/**
	 *Constructor for Loan.java
	 * @param loanID
	 * @param loanPeriod
	 * @param monthlyAmt
	 * @param startDate
	 * @param loanStatus
	 * @param empID
	 */
	public Loan(int loanID, int loanPeriod, double monthlyAmt, Date startDate, String loanStatus, int empID) {
		super();
		this.loanID = loanID;
		this.loanPeriod = loanPeriod;
		this.monthlyAmt = monthlyAmt;
		this.startDate = startDate;
		LoanStatus = loanStatus;
		this.empID = empID;
	}
	
	


	/**
	 *Constructor for Loan.java
	 */
	public Loan() {
		super();
	}




	/**
	 *Constructor for Loan.java
	 * @param loanPeriod
	 * @param monthlyAmt
	 * @param startDate
	 * @param loanStatus
	 * @param empID
	 */
	public Loan(int loanPeriod, double monthlyAmt, Date startDate, String loanStatus, int empID) {
		super();
		this.loanPeriod = loanPeriod;
		this.monthlyAmt = monthlyAmt;
		this.startDate = startDate;
		LoanStatus = loanStatus;
		this.empID = empID;
	}


	/**
	 *Getter for loanID
	 *@return the loanID
	 */
	public int getLoanID() {
		return loanID;
	}


	/**
	 *Setter for loanID
	 * @param loanID the loanID to set
	 */
	public void setLoanID(int loanID) {
		this.loanID = loanID;
	}


	/**
	 *Getter for loanPeriod
	 *@return the loanPeriod
	 */
	public int getLoanPeriod() {
		return loanPeriod;
	}


	/**
	 *Setter for loanPeriod
	 * @param loanPeriod the loanPeriod to set
	 */
	public void setLoanPeriod(int loanPeriod) {
		this.loanPeriod = loanPeriod;
	}


	/**
	 *Getter for monthlyAmt
	 *@return the monthlyAmt
	 */
	public double getMonthlyAmt() {
		return monthlyAmt;
	}


	/**
	 *Setter for monthlyAmt
	 * @param monthlyAmt the monthlyAmt to set
	 */
	public void setMonthlyAmt(double monthlyAmt) {
		this.monthlyAmt = monthlyAmt;
	}


	/**
	 *Getter for startDate
	 *@return the startDate
	 */
	public Date getStartDate() {
		return startDate;
	}


	/**
	 *Setter for startDate
	 * @param startDate the startDate to set
	 */
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	/**
	 *Getter for loanStatus
	 *@return the loanStatus
	 */
	public String getLoanStatus() {
		return LoanStatus;
	}


	/**
	 *Setter for loanStatus
	 * @param loanStatus the loanStatus to set
	 */
	public void setLoanStatus(String loanStatus) {
		LoanStatus = loanStatus;
	}


	/**
	 *Getter for empID
	 *@return the empID
	 */
	public int getEmpID() {
		return empID;
	}


	/**
	 *Setter for empID
	 * @param empID the empID to set
	 */
	public void setEmpID(int empID) {
		this.empID = empID;
	}




	/**
	 *Getter for amtLeft
	 *@return the amtLeft
	 */
	public double getAmtLeft() {
		return amtLeft;
	}




	/**
	 *Setter for amtLeft
	 * @param amtLeft the amtLeft to set
	 */
	public void setAmtLeft(double amtLeft) {
		this.amtLeft = amtLeft;
	}
	
	
	
	
	
	

}
