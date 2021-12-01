package com.ITP.Utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

        static Connection con = null;

        public DBConnection() {
        }

        public static Connection getConnection() throws ClassNotFoundException, SQLException {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_las", "root", "1234");
            //System.out.println("Connection successfull!!");
            //System.out.println("Is this printing");
            if (con == null) {
                System.out.println("The con object is null");
            } else {
                //System.out.println("con object is not null");
            }

            return con;
        }
    }
