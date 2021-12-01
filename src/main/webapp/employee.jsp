<!DOCTYPE html>
<%@page import="com.ITP.Model.Employee"%>
<html>
    <head>
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <style>
            html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
            .w3-sidebar {
            z-index: 3;
            width: 250px;
            top: 43px;
            bottom: 0;
            height: inherit;
            }
            </style>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
            <link rel="stylesheet" type="text/css" href="./assets/css/font-awesome.min.css">
            <link rel="stylesheet" type="text/css" href="./assets/css/dataTables.bootstrap4.min.css">
            <link rel="stylesheet" type="text/css" href="./assets/css/style.css">
            <link rel="stylesheet" href="./css/emp_salSlip.css">
            <link rel="stylesheet" href="./css/navbar.css">
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="./js/attendanceReport.js"></script>

    </head>
    <body>
    

		<% Employee emp = (Employee)session.getAttribute("empD"); %>
		
		<div class="topnav">
            <a class="active" href="#home">Home</a>
            <a  href="#news">Profile</a>
            <a href="EmployeeAttendanceHistory.jsp">Attendance</a>
            <a  href="EmployeeSalary.jsp">Salary</a>
            <a  href="Emp_loan_request.jsp">Loan</a>
        </div>
        <br>
        <br>
        <div class="fullbody">
          <div style="padding-left:16px">
            <h3>Employee Attendance</h3>
          </div>
          <hr>
          
          
        <div class="emp-details">
            <div class="card">
                <div class="card-box">
                  <h4>Full Name : <%=emp.getfName()+" "+emp.getlName()%></h4>
                  <h5>Department : <%=emp.getDepartment() %></h5>
                  <h5>Position : <%=emp.getDesignation() %></h5>
                </div>
                
            </div>
        </div>
        

        <hr>

	<form action="CalculateSalaryServlet" method="POST">
		<input type="submit" value="Calculate Salary for this month">
	</form>

</body>
</html>