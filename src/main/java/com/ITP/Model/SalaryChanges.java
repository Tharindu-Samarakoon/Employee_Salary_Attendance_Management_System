package com.ITP.Model;

public class SalaryChanges {
	
	private int ID;
	private String name;
	private Double rate;
	private String ChangeFor;
	private String Hour_per;
	private String Type;
	private String Status;

	/**
	 *Constructor for SalaryChanges.java
	 */
	public SalaryChanges() {
		super();
	}


	public SalaryChanges(int iD, String name, Double rate, String changeFor, String hour_per, String Status) {
		super();
		ID = iD;
		this.name = name;
		this.rate = rate;
		ChangeFor = changeFor;
		this.Type = Type;
		Hour_per = hour_per;
		this.Status = Status;
	}


	public SalaryChanges(String name, Double rate, String changeFor, String Type , String hour_per, String Status) {
		super();
		this.name = name;
		this.rate = rate;
		ChangeFor = changeFor;
		this.Type = Type;
		Hour_per = hour_per;
		this.Status = Status;
	}
	
	/**
	 *Getter for status
	 *@return the status
	 */
	public String getStatus() {
		return Status;
	}


	/**
	 *Setter for status
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		Status = status;
	}


	/**
	 *Getter for type
	 *@return the type
	 */
	public String getType() {
		return Type;
	}


	/**
	 *Setter for type
	 * @param type the type to set
	 */
	public void setType(String type) {
		Type = type;
	}


	/**
	 *Getter for iD
	 *@return the iD
	 */
	public int getID() {
		return ID;
	}


	/**
	 *Setter for iD
	 * @param iD the iD to set
	 */
	public void setID(int iD) {
		ID = iD;
	}


	/**
	 *Getter for name
	 *@return the name
	 */
	public String getName() {
		return name;
	}


	/**
	 *Setter for name
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}


	/**
	 *Getter for rate
	 *@return the rate
	 */
	public Double getRate() {
		return rate;
	}


	/**
	 *Setter for rate
	 * @param rate the rate to set
	 */
	public void setRate(Double rate) {
		this.rate = rate;
	}


	/**
	 *Getter for changeFor
	 *@return the changeFor
	 */
	public String getChangeFor() {
		return ChangeFor;
	}


	/**
	 *Setter for changeFor
	 * @param changeFor the changeFor to set
	 */
	public void setChangeFor(String changeFor) {
		ChangeFor = changeFor;
	}


	/**
	 *Getter for hour_per
	 *@return the hour_per
	 */
	public String getHour_per() {
		return Hour_per;
	}


	/**
	 *Setter for hour_per
	 * @param hour_per the hour_per to set
	 */
	public void setHour_per(String hour_per) {
		Hour_per = hour_per;
	}
	
	
	
	
	
	

}
