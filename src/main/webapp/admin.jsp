<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ITP.Model.Employee"%>
<%@page import="com.ITP.Utility.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>Admin</title>
    <style>
				  .bd-placeholder-img {
					font-size: 1.125rem;
					text-anchor: middle;
					-webkit-user-select: none;
					-moz-user-select: none;
					user-select: none;
				  }

				  @media (min-width: 768px) {
					.bd-placeholder-img-lg {
					  font-size: 3.5rem;
					}
				  }
			  input[type=text], select {
			  width: 40%;
			  padding: 12px 20px;
			  margin: 8px 0;
			  display: block;
			  border: 1px solid #ccc;
			  border-radius: 4px;
			  box-sizing: border-box;
			}

			

			.cont {
			  border-radius: 5px;
			  background-color: #f2f2f2;
			  padding: 20px;
			}
  
    </style>
    <link rel="Stylesheet" href="./css/Admin.css">
	<link rel="Stylesheet" href="./css/adcard.css">
	<link rel="Stylesheet" href="./css/buttons.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  </head>
  <body class="body">
    <h1>Hey Admin!</h1>
    <% Employee emp = (Employee)session.getAttribute("empD");  %>
    
  <div class="site-header sticky-top py-1">
  <div class="container d-flex flex-column flex-md-row justify-content-between">
    
    <a class="py-2 d-none d-md-inline-block" href="admindashboard">DashBoard</a>
    <a class="py-2 d-none d-md-inline-block" href="admin.jsp">Employees</a>
    <a class="py-2 d-none d-md-inline-block" href="welcomeAdmin(1).jsp">Customers</a>
    <a class="py-2 d-none d-md-inline-block" href="viewrooms.jsp">Reservations</a>
    <a class="py-2 d-none d-md-inline-block" href="admin1.jsp">Restaurant</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Events</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Promotions</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Feedback</a>
    <a class="py-2 d-none d-md-inline-block" href="logoutServlet">Logout</a>
  </div>
</div>

	<div>
		<div class="w3-container" align="center">
		  <div class="w3-panel w3-card-4" style="width:85%" align="center" >
			
				 <div align="left">
				 <br>
				 <p>EMPLOYEE LEAVE REPORT : </p>
					<form class="form-inline" method="post" action="<%=request.getContextPath()%>/leaveReportServlet">
					  <label>From Date:</label>
					  <input type="date" name="form_date">
					  <label>To Date:</label>
					  <input type="date" name="to_date">
					  <button type="submit">Submit</button>
					</form>
		 
				 </div>
				 
				 <br><br>
				 
				  <div align="left">
				 <br>
				 <p>DEPARTMENT WISE EMPLOYEE REPORT: </p>
					<form class="form-inline" method="post" action="<%=request.getContextPath()%>/empDepReportServlet">
					   <select  name="department"  required>
					          <option>Please Selecet One Option From Below</option>
							  <option value="House Keeping">House Keeping</option>
					          <option value="Restaurant">Restaurant</option>
					          <option value="Security">Security</option>	      
					     </select> 
					     
					  <button type="submit">Submit</button>
					</form>
		 
				 </div>
				 
				 <br><br>
				
				
			<div class="form-inline" align="center">	
				<div>
				  <label><b>Register Employee</b></label><br>
				  <span><a href="empregister.jsp"></a></span>
				 </div> 
				  &nbsp&nbsp 
				  <div>
				  <label><b>Employee Details</b></label><br>
				  <span><a href="<%= request.getContextPath()%>/getEmployeeServlet "></a></span>
				  </div>
				  &nbsp&nbsp 
				  <div>
				  <label><b>Leave requests</b></label><br>
				  <span><a href="<%= request.getContextPath()%>/getLeaveServlet"></a></span> 
				  </div>
				  &nbsp&nbsp
				  <div>
				  <label><b>Removed Employees</b></label><br>
				  <span><a href="<%= request.getContextPath()%>/removedEmpServlet"></a></span>
				  </div>
				  &nbsp&nbsp
				  <div>
				  <label><b>Employee Attendance</b></label><br>
				  <span><a href="EmployeeAttendanceReport.jsp"></a></span>
				  </div>
				  &nbsp&nbsp
				  <div>
				  <label><b>Bonuses and Deductions</b></label><br>
				  <span><a href="addBonus.jsp"></a></span>
				  </div>
				  &nbsp&nbsp
				  <div>
				  <label><b>Loan requests</b></label><br>
				  <span><a href="Admin_View_loans.jsp"></a></span>
				 </div>
			</div>
				 
				 <br><br>
				<div class="cont">
				<form>
				    <label>Employee ID </label>
				    <input type="text" name="eid" value="<%= emp.getEid() %>">
					<br>
					<label>First Name </label>
				    <input type="text" name="fName" value="<%= emp.getfName() %>">
				    <br>
				    <label>Last Name </label>
				    <input type="text" name="lName" value="<%= emp.getlName() %>">
				    <br>
				    <label>NIC </label>
				    <input type="text" name="NIC" value="<%= emp.getNIC() %>">
				    <br>
				    <label>Email ID </label>
				    <input type="text" name="emailID" value="<%= emp.getEmailID() %>">
				    <br>
				    <label>User Name</label>
				    <input type="text" name="username" value="<%= emp.getUsername() %>">
				    <br>
				    <label>Designation</label>
				    <input type="text"  name="designation" value="<%= emp.getDesignation() %>">
					<br>
				    
				    <label>Department</label>
				    <input type="text"  name="department" value="<%= emp.getDepartment() %>">
				   	<br>
				 
				  </form>
				</div>
		  </div>
		</div>
	
	</div>


    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    -->
  </body>




</html>
