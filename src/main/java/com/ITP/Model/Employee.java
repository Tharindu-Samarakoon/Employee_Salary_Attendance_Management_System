package com.ITP.Model;

public class Employee {
	
		   
		private int eid;
	    private String username;
	    private String fName;
	    private String lName;
	    private String password;
	    private String NIC ;
	    private String emailID ;
	    private int basicSalary ;
	    private String employeeRole ;
	    private String designation ;
	    private String department ;
	 
	    public Employee() {}

	    public Employee(int eid, String username , String fName , String lName , String password ,String NIC,
	    		String emailID , int basicSalary , String employeeRole , String designation, String department){
	    	this.eid = eid ;
	    	this.username = username ;
	    	this.fName = fName ;
	    	this.lName = lName ;
	    	this.password = password ;
	    	this.NIC = NIC ;
	    	this.emailID = emailID ;
	    	this.basicSalary = basicSalary ;
	    	this.employeeRole = employeeRole ;
	    	this.designation = designation ;
	    	this.department = department ;
	    
	    	
	    }
	    
	    
	    
	    public String getDepartment() {
			return department;
		}

		public void setDepartment(String department) {
			this.department = department;
		}

		public int getEid() {
	        return eid;
	    }

	    public void setEid(int eid) {
	        this.eid = eid;
	    }

	    public String getUsername() {
	        return username;
	    }

	    public void setUsername(String username) {
	        this.username = username;
	    }

	    public String getfName() {
	        return fName;
	    }

	    public void setfName(String fName) {
	        this.fName = fName;
	    }

	    public String getlName() {
	        return lName;
	    }

	    public void setlName(String lName) {
	        this.lName = lName;
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }

	    public String getNIC() {
	        return NIC;
	    }

	    public void setNIC(String NIC) {
	        this.NIC = NIC;
	    }

	    public String getEmailID() {
	        return emailID;
	    }

	    public void setEmailID(String emailID) {
	        this.emailID = emailID;
	    }

	    public int getBasicSalary() {
	        return basicSalary;
	    }

	    public void setBasicSalary(int basicSalary) {
	        this.basicSalary = basicSalary;
	    }

	    public String getEmployeeRole() {
	        return employeeRole;
	    }

	    public void setEmployeeRole(String employeeRole) {
	        this.employeeRole = employeeRole;
	    }

	    public String getDesignation() {
	        return designation;
	    }

	    public void setDesignation(String designation) {
	        this.designation = designation;
	    }


}	
