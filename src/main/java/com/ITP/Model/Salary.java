package com.ITP.Model;

import java.util.Date;

public class Salary {
	
	private int SalaryID;
	private double loanDeductable;
	private double netAmt;
	private double grossAmt;
	private int empID;
	private int salaryMonth;
	private int year;
	private double OTbonus;
	
	
	/**
	 * Constructor for Salary.java
	 * @param salaryID
	 * @param loanDeductable
	 * @param netAmt
	 * @param grossAmt
	 * @param empID
	 * @param salaryMonth
	 */
	public Salary(int salaryID, double loanDeductable, double netAmt, double grossAmt, int empID, int salaryMonth) {
		super();
		SalaryID = salaryID;
		this.loanDeductable = loanDeductable;
		this.netAmt = netAmt;
		this.grossAmt = grossAmt;
		this.empID = empID;
		this.salaryMonth = salaryMonth;
	}


	/**
	 *Constructor for Salary.java
	 * @param loanDeductable
	 * @param netAmt
	 * @param grossAmt
	 * @param empID
	 * @param salaryMonth
	 */
	public Salary(double loanDeductable, double netAmt, double grossAmt, int empID, int salaryMonth) {
		super();
		this.loanDeductable = loanDeductable;
		this.netAmt = netAmt;
		this.grossAmt = grossAmt;
		this.empID = empID;
		this.salaryMonth = salaryMonth;
	}
	
	


	/**
	 *Constructor for Salary.java
	 */
	public Salary() {
		super();
	}


	/**
	 *Getter for salaryID
	 *@return the salaryID
	 */
	public int getSalaryID() {
		return SalaryID;
	}


	/**
	 *Setter for salaryID
	 * @param salaryID the salaryID to set
	 */
	public void setSalaryID(int salaryID) {
		SalaryID = salaryID;
	}


	/**
	 *Getter for loanDeductable
	 *@return the loanDeductable
	 */
	public double getLoanDeductable() {
		return loanDeductable;
	}


	/**
	 *Setter for loanDeductable
	 * @param loanDeductable the loanDeductable to set
	 */
	public void setLoanDeductable(double loanDeductable) {
		this.loanDeductable = loanDeductable;
	}


	/**
	 *Getter for netAmt
	 *@return the netAmt
	 */
	public double getNetAmt() {
		return netAmt;
	}


	/**
	 *Setter for netAmt
	 * @param netAmt the netAmt to set
	 */
	public void setNetAmt(double netAmt) {
		this.netAmt = netAmt;
	}


	/**
	 *Getter for grossAmt
	 *@return the grossAmt
	 */
	public double getGrossAmt() {
		return grossAmt;
	}


	/**
	 *Setter for grossAmt
	 * @param grossAmt the grossAmt to set
	 */
	public void setGrossAmt(double grossAmt) {
		this.grossAmt = grossAmt;
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
	 *Getter for salaryMonth
	 *@return the salaryMonth
	 */
	public int getSalaryMonth() {
		return salaryMonth;
	}


	/**
	 *Setter for salaryMonth
	 * @param salaryMonth the salaryMonth to set
	 */
	public void setSalaryMonth(int salaryMonth) {
		this.salaryMonth = salaryMonth;
	}


	/**
	 *Getter for year
	 *@return the year
	 */
	public int getYear() {
		return year;
	}


	/**
	 *Setter for year
	 * @param year the year to set
	 */
	public void setYear(int year) {
		this.year = year;
	}


	/**
	 *Getter for oTbonus
	 *@return the oTbonus
	 */
	public double getOTbonus() {
		return OTbonus;
	}


	/**
	 *Setter for oTbonus
	 * @param oTbonus the oTbonus to set
	 */
	public void setOTbonus(double oTbonus) {
		OTbonus = oTbonus;
	}
	
	
	
	
	
	

}
