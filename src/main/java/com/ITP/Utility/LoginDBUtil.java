package com.ITP.Utility;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ITP.Model.Employee;
import com.ITP.Model.LoginBean;

public class LoginDBUtil {
	
	private static Connection con = null ;
	private static Statement stmt = null ;
	private static ResultSet rs = null ;
	
    public String authenticateUser(LoginBean loginBean)
    {
        String userName = loginBean.getUserName();
        String password = loginBean.getPassword();

        String userNameDB = "";
        String passwordDB = "";
        String roleDB = "";

           try {
				con = DBConnection.getConnection() ;

				stmt = con.createStatement();
			
            rs = stmt.executeQuery("select username,Password,employeeRole from employee");

            while(rs.next())
            {
                userNameDB = rs.getString("username");
                passwordDB = rs.getString("Password");
                roleDB = rs.getString("employeeRole");

                if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Admin"))
                    return "Admin";
                else if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("User"))
                    return "User";
            }
            } catch (SQLException | ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
       
        return "Invalid user credentials";
    }

}


