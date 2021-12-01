package com.ITP.Services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Locale;

import com.ITP.Model.Attendence;
import com.ITP.Model.Employee;
import com.ITP.Utility.DBConnection;

public class AttendenceServicesImpl implements AttendenceServices{
	
	static Connection con;
	static PreparedStatement ps;

	@Override
	public ArrayList<Employee> getEmployees() {
		// TODO Auto-generated method stub
		
		ArrayList<Employee> unmarkedEmp = new ArrayList<Employee>();
		long millis = System.currentTimeMillis();
		ResultSet rs;
		
		int emplist[] = null;
		
		try {
			con = DBConnection.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		try {
			
			java.sql.Date date=new java.sql.Date(millis);
			
			ps = con.prepareStatement("SELECT * FROM employee WHERE Eid NOT IN (SELECT Emp_id from Attendence WHERE Att_date = ?)");
			ps.setDate(1, date);
			rs = ps.executeQuery();
			
			while (rs.next()) {
			Employee emp = new Employee();
			
			emp.setEid(rs.getInt(1));
			emp.setfName(rs.getString(2));
			emp.setlName(rs.getString(3));
			emp.setNIC(rs.getString(4));
			emp.setEmailID(rs.getString(5));
			emp.setPassword(rs.getString(6));
			emp.setBasicSalary(rs.getInt(7));
			emp.setEmployeeRole(rs.getString(8));
			emp.setDesignation(rs.getString(9));
			emp.setUsername(rs.getString(10));
			emp.setDepartment(rs.getString("department"));
			
			unmarkedEmp.add(emp);
			
			}
			
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(Employee e : unmarkedEmp) {
			System.out.println(e.getfName());
			System.out.println(e.getDesignation());
		}
		
		return unmarkedEmp;
	}
	
	public ArrayList<Employee> getEmployeesOn(Date d) {
		// TODO Auto-generated method stub
		
		ArrayList<Employee> unmarkedEmp = new ArrayList<Employee>();
		ResultSet rs;
		
		int emplist[] = null;
		
		try {
			con = DBConnection.getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			
			
			ps = con.prepareStatement("SELECT * FROM employee WHERE Eid NOT IN (SELECT Emp_id from Attendence WHERE Att_date = ?)");
			ps.setDate(1, d);
			rs = ps.executeQuery();
			
			while (rs.next()) {
			Employee emp = new Employee();
			
			emp.setEid(rs.getInt(1));
			emp.setfName(rs.getString(2));
			emp.setlName(rs.getString(3));
			emp.setNIC(rs.getString(4));
			emp.setEmailID(rs.getString(5));
			emp.setPassword(rs.getString(6));
			emp.setBasicSalary(rs.getInt(7));
			emp.setEmployeeRole(rs.getString(8));
			emp.setDesignation(rs.getString(9));
			emp.setUsername(rs.getString(10));
			emp.setDepartment(rs.getString("department"));
			
			unmarkedEmp.add(emp);
			
			}
			
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(Employee e : unmarkedEmp) {
			System.out.println(e.getfName());
			System.out.println(e.getDesignation());
		}
		
		return unmarkedEmp;
	}

	@Override
	public void addEmpAttendance(int EmpID, Date attDate, Time arrivalTime, Time DepTime) {
		// TODO Auto-generated method stub
		
		Connection con;
		PreparedStatement ps;
		
		try {
			
			con = DBConnection.getConnection();
			
			ps = con.prepareStatement("Insert into attendence(Emp_id, Att_Date, Arrival_Time, Dep_Time) value ?, ?, ?, ?");
			ps.setInt(1, EmpID);
			ps.setDate(2, attDate);
			ps.setTime(3, arrivalTime);
			ps.setTime(4, DepTime);
			
			int i = ps.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
	}
	
	

	@Override
	public void addEmpAttendance(Attendence at) {
		// TODO Auto-generated method stub
		
		Connection con;
		PreparedStatement ps;
		
		System.out.println(at.getEmpID());
		System.out.println(at.getAttDate());
		System.out.println(at.getArrTime());
		
		LocalTime from = at.getArrTime().toLocalTime();
		LocalTime to = at.getDepTime().toLocalTime();

		Duration dt = Duration.between(from, to);
		int OThours = Math.round(dt.toHours());
		int workHours = 8;
		
		if((OThours - workHours) > 0) {
			OThours = OThours - workHours;
		} else {
			OThours = 0;
		}
		
		try {
			
			con = DBConnection.getConnection();
			
			ps = con.prepareStatement("Insert into attendence(Emp_id, Att_Date, Arrival_Time, Dep_Time, OT_hours) values (?, ?, ?, ?, ?)");
			ps.setInt(1, at.getEmpID());
			ps.setDate(2, at.getAttDate());
			ps.setTime(3, at.getArrTime());
			ps.setTime(4, at.getDepTime());
			ps.setInt(5, OThours);
			
			int i = ps.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}

	@Override
	public void addEmpAttendanceArrival(int EmpID, Time arrivalTime) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addEmpAttendanceDep(int EmpID, Time DepTime) {
		// TODO Auto-generated method stub
		
	}
	
	public int TotalOThours(int month, int year, int empID) {
		
		
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		int OTtotal = 0;
		
		try {
			con = DBConnection.getConnection();
			
			ps = con.prepareStatement("SELECT * FROM attendence WHERE YEAR(Att_Date) = ? AND MONTH(Att_Date) = ? and Emp_id = ?");
			ps.setInt(1, year);
			ps.setInt(2, month);
			ps.setInt(3, empID);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				System.out.println();
				OTtotal = OTtotal + rs.getInt("OT_hours");
				System.out.println(OTtotal);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return OTtotal;
	}
	
	public ArrayList<Attendence> getEmployeeAttendance(int empID) {
		
		ArrayList<Attendence> attList = new ArrayList<Attendence>();
		
		try {
		con = DBConnection.getConnection();
		ResultSet rs;
		
		ps = con.prepareStatement("SELECT * FROM attendence WHERE Emp_id = ? order by Att_date DESC");
		ps.setInt(1, empID);
		
		rs = ps.executeQuery();
		
		while(rs.next()) {
			
			Attendence att = new Attendence();
			
			att.setEmpID(rs.getInt("Emp_id"));
			att.setAttDate(rs.getDate("Att_date"));
			att.setArrTime(rs.getTime("Arrival_Time"));
			att.setDepTime(rs.getTime("Dep_Time"));
			att.setOThours(rs.getInt("OT_hours"));
			
			attList.add(att);
			
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		
		return attList;
		
	}
	
	
public ArrayList<Attendence> getAllEmployeeAttendance() {
		
		ArrayList<Attendence> attList = new ArrayList<Attendence>();
		
		try {
		con = DBConnection.getConnection();
		ResultSet rs;
		
		ps = con.prepareStatement("SELECT * FROM attendence order by Att_date DESC");
		
		rs = ps.executeQuery();
		
		while(rs.next()) {
			
			Attendence att = new Attendence();
			
			att.setEmpID(rs.getInt("Emp_id"));
			att.setAttDate(rs.getDate("Att_date"));
			att.setArrTime(rs.getTime("Arrival_Time"));
			att.setDepTime(rs.getTime("Dep_Time"));
			att.setOThours(rs.getInt("OT_hours"));
			
			attList.add(att);
			
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		
		return attList;
		
	}


public ArrayList<Attendence> getAllEmployeeAttendanceFrom(int month, int year) {
	
	ArrayList<Attendence> attList = new ArrayList<Attendence>();
	
	try {
	con = DBConnection.getConnection();
	ResultSet rs;
	
	if(month == 0) {
		ps = con.prepareStatement("SELECT * FROM attendence where Year(Att_date) = ? order by Att_date DESC");
		ps.setInt(1, year);
		
	} else {
		ps = con.prepareStatement("SELECT * FROM attendence where Year(Att_date) = ? and Month(Att_date) = ? order by Att_date DESC");
		ps.setInt(1, year);
		ps.setInt(2, month);
		
	}
	
	
	rs = ps.executeQuery();
	
	while(rs.next()) {
		
		Attendence att = new Attendence();
		
		att.setEmpID(rs.getInt("Emp_id"));
		att.setAttDate(rs.getDate("Att_date"));
		att.setArrTime(rs.getTime("Arrival_Time"));
		att.setDepTime(rs.getTime("Dep_Time"));
		att.setOThours(rs.getInt("OT_hours"));
		
		attList.add(att);
		
	}
	
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	
	
	return attList;
	
}

public ArrayList<Attendence> getOneEmployeeAttendanceFrom(int month, int year, int empID) {
	
	ArrayList<Attendence> attList = new ArrayList<Attendence>();
	
	try {
	con = DBConnection.getConnection();
	ResultSet rs;
	
	if(month == 0) {
		ps = con.prepareStatement("SELECT * FROM attendence where Year(Att_date) = ? and Emp_id = ? order by Att_date DESC");
		ps.setInt(1, year);
		ps.setInt(2, empID);
		
	} else {
		ps = con.prepareStatement("SELECT * FROM attendence where Year(Att_date) = ? and Month(Att_date) = ? and Emp_id = ? order by Att_date DESC");
		ps.setInt(1, year);
		ps.setInt(2, month);
		ps.setInt(3, empID);
		
	}
	
	
	rs = ps.executeQuery();
	
	while(rs.next()) {
		
		Attendence att = new Attendence();
		
		att.setEmpID(rs.getInt("Emp_id"));
		att.setAttDate(rs.getDate("Att_date"));
		att.setArrTime(rs.getTime("Arrival_Time"));
		att.setDepTime(rs.getTime("Dep_Time"));
		att.setOThours(rs.getInt("OT_hours"));
		
		attList.add(att);
		
	}
	
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	
	
	return attList;
	
}
	
	
	

}


//if(rs != null) {
//System.out.println("rs is empty");
//int i = 0;
//while(rs.next()) {
//	emplist[i] = rs.getInt("Emp_id");
//}
//
//}