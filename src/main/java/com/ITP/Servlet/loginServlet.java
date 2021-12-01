package com.ITP.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.util.*;

import com.ITP.Model.Employee;
import com.ITP.Model.LoginBean;
import com.ITP.Utility.LoginDBUtil;
import com.ITP.Utility.employeeDBUtil;

/**
 * @author Tharindu
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		LoginBean loginBean = new LoginBean();
		String userName = request.getParameter("username");
        String password = request.getParameter("password");

        loginBean.setUserName(userName);
        loginBean.setPassword(password);
        
        LoginDBUtil loginDBUtil = new LoginDBUtil();
        employeeDBUtil EmpDBUtil = new employeeDBUtil() ;
        
        Employee empDetails = new Employee();
		try {
			empDetails = EmpDBUtil.getEmployee(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
       
        String userValidate = loginDBUtil.authenticateUser(loginBean);
               
            if(userValidate.equals("Admin")){
    			HttpSession session  =   request.getSession() ;
    	    	session.setAttribute("empD", empDetails);
            	RequestDispatcher dis = request.getRequestDispatcher("admin.jsp");
    			dis.forward(request, response);

            	
            }

            else if(userValidate.equals("User")){
            	HttpSession session  =   request.getSession() ;
    	    	session.setAttribute("empD", empDetails);
            	RequestDispatcher dis2 = request.getRequestDispatcher("employee1.jsp");
    			dis2.forward(request, response);
    			
            }
            else
            {
                response.sendRedirect("index.jsp");
            }
    }
		
	}


