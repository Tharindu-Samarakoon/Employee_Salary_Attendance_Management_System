package com.ITP.Utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ITP.Model.Employee;

public class employeeDBUtil {
	
private static boolean isSuccess;

	
	public static boolean insertemployee(String Firstname , String Lastname, String NIC , String emailID ,String Password ,int BasicSalary ,String employeeRole, String designation, String username , String department) {
			
		boolean isSuccess = false ;
		
		 	String url = "jdbc:mysql://localhost:3306/hotel_management";
	        String user = "root";
	        String Pass = "";
	        
	        try {
	        	
	        	Class.forName("com.mysql.jdbc.Driver") ;
	        	Connection con = DriverManager.getConnection(url, user , Pass) ;
	        	Statement stmt = con.createStatement() ;
	        	
	        	String sql = " INSERT INTO employee VALUES ( 0,'"+Firstname+"','"+Lastname+"','"+NIC+"','"+emailID+"','"+Password+"','"+BasicSalary+"',"
	        			+"  '"+employeeRole+"', '"+designation+"','"+username+"','"+department+"')";
	        	
	        	int rs =stmt.executeUpdate(sql) ;
	        	
	        	if(rs > 0) 
	        		isSuccess = true ;
	        	else 
	        		isSuccess = false ;
	        	
	        
	        	
	        }catch (Exception e) {
				e.printStackTrace();
			}
	        
		return isSuccess ;
	
	}
	
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
					emp.setDepartment(rs.getString(11));

					
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

		public List <Employee> selectAllEmployee() {
		
		    List< Employee > e = new ArrayList < > ();
		   
		   try {
		     	Connection con = DBConnection.getConnection();
					Statement stmt = con.createStatement();
		     	String sql = "select * from employee" ;
		         ResultSet rs = stmt.executeQuery(sql) ;
		
		   
		         // Step 4: Process the ResultSet object.
		         while (rs.next()) {
		         	int eid = rs.getInt(1);
						String fName = rs.getString(2);
						String lName = rs.getString(3);
						String NIC = rs.getString(4);
						String emailID = rs.getString(5);
						String password = rs.getString(6);
						String basicSalary = rs.getString(7) ;
						int BasicSalary = Integer.parseInt(basicSalary) ;
						String employeeRole = rs.getString(8) ;
						String designation = rs.getString(9) ;
						String username = rs.getString(10) ;
						String department = rs.getString(11) ;
		         
						e.add(new Employee(eid,username ,fName,lName,NIC,emailID,password,BasicSalary,employeeRole,designation,department));
		         
		         }
		         
		   	}catch(Exception ex) {
		        	ex.printStackTrace();
		      }	
		
		     return e ;
		 }
		
		public Employee getEmployee(int empID) {
			
			Employee emp = new Employee();
			// employee.add(emp);
			
		
			

				
				Connection con;
				try {
					con = DBConnection.getConnection();
				
				java.sql.Statement stmt = con.createStatement();
				String sql = "select * from employee where Eid = '"+String.valueOf(empID)+"'";
				ResultSet rs = stmt.executeQuery(sql);
				
				
				
					while (rs.next()) {
						
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
						emp.setDepartment(rs.getString(11));

						
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
