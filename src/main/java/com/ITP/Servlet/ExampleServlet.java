package com.ITP.Servlet;

import com.ITP.Utility.DBConnection;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import javax.servlet.http.*;
import javax.servlet.annotation.*;


@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class ExampleServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    static Connection con;
    static PreparedStatement ps;
    private LocalDate d  = LocalDate.now();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        try {
            con = DBConnection.getConnection();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (con == null) {
            System.out.println("Failed");
        }

        ZoneId defaultZoneId = ZoneId.systemDefault();

        Date date = Date.from(d.atStartOfDay(defaultZoneId).toInstant());
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());

        try {
            ps = con.prepareStatement("INSERT INTO employee(EID, basicSalary, JoinedDate) values (?, ?, ?)");
            ps.setInt(1, 6);
            ps.setDouble(2, 20000);
            ps.setDate(3, sqlDate);

            int status = ps.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
        }


        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}