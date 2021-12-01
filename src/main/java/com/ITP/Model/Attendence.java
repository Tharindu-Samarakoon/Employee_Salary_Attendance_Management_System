package com.ITP.Model;

import java.sql.Time;
import java.util.Date;

public class Attendence {
	
	private int empID;
	private java.sql.Date attDate;
	private Time arrTime;
	private Time depTime;
	private double OThours;
	
	
	/**
	 *Constructor for Attendence.java
	 * @param empID
	 * @param attDate
	 * @param arrTime
	 * @param depTime
	 * @param oThours
	 */
	public Attendence(int empID, java.sql.Date attDate, Time arrTime, Time depTime, double oThours) {
		super();
		this.empID = empID;
		this.attDate = attDate;
		this.arrTime = arrTime;
		this.depTime = depTime;
		OThours = oThours;
	}
	
	


	/**
	 *Constructor for Attendence.java
	 */
	public Attendence() {
		super();
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
	 *Getter for attDate
	 *@return the attDate
	 */
	public java.sql.Date getAttDate() {
		return attDate;
	}


	/**
	 *Setter for attDate
	 * @param attDate the attDate to set
	 */
	public void setAttDate(java.sql.Date attDate) {
		this.attDate = attDate;
	}


	/**
	 *Getter for arrTime
	 *@return the arrTime
	 */
	public Time getArrTime() {
		return arrTime;
	}


	/**
	 *Setter for arrTime
	 * @param arrTime the arrTime to set
	 */
	public void setArrTime(Time arrTime) {
		this.arrTime = arrTime;
	}


	/**
	 *Getter for depTime
	 *@return the depTime
	 */
	public Time getDepTime() {
		return depTime;
	}


	/**
	 *Setter for depTime
	 * @param depTime the depTime to set
	 */
	public void setDepTime(Time depTime) {
		this.depTime = depTime;
	}


	/**
	 *Getter for oThours
	 *@return the oThours
	 */
	public double getOThours() {
		return OThours;
	}


	/**
	 *Setter for oThours
	 * @param oThours the oThours to set
	 */
	public void setOThours(double oThours) {
		OThours = oThours;
	}
	

}
