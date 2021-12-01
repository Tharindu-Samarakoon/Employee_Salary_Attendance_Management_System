package com.ITP.Services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ITP.Model.Employee;
import com.ITP.Utility.DBConnection;
import com.mysql.cj.xdevapi.Statement;

public class EmployeeServices {
	
	public Employee getEmployee(String userName) {
		
		Employee emp = new Employee();
		// employee.add(emp);
		
	
		

			
			Connection con;
			try {
				con = DBConnection.getConnection();
			
			java.sql.Statement stmt = con.createStatement();
			String sql = "select * from employee where username = '"+userName+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			
			
				while (rs.next()) {
				/* int eid = rs.getInt(1);
					String fName = rs.getString(2);
					String lName = rs.getString(3);
					String NIC = rs.getString(4);
					String emailID = rs.getString(5);
					String password = rs.getString(6);
					String basicSalary = rs.getString(7) ;
					int BasicSalary = Integer.parseInt(basicSalary) ;
					String employeeRole = rs.getString(8) ;
					String designation = rs.getString(9) ;
					String username = rs.getString(11) ; */
					
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

					
				}
				
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			return emp;

	}
}
	
