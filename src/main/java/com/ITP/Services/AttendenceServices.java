package com.ITP.Services;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

import com.ITP.Model.Attendence;
import com.ITP.Model.Employee;

public interface AttendenceServices {
	
	public ArrayList<Employee> getEmployees();
	
	public ArrayList<Employee> getEmployeesOn(Date d);
	
	public void addEmpAttendance(int EmpID, Date attDate, Time arrivalTime, Time DepTime);
	
	public void addEmpAttendance(Attendence at);
	
	public void addEmpAttendanceArrival(int EmpID, Time arrivalTime);
	
	public void addEmpAttendanceDep(int EmpID, Time DepTime);
	
	public int TotalOThours(int month, int year, int empID);
	
	public ArrayList<Attendence> getEmployeeAttendance(int empID);
	
	public ArrayList<Attendence> getAllEmployeeAttendance();
	
	public ArrayList<Attendence> getAllEmployeeAttendanceFrom(int month, int year);
	
	public ArrayList<Attendence> getOneEmployeeAttendanceFrom(int month, int year, int empID);

}
