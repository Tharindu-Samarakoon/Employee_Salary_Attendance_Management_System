<!DOCTYPE html>
<%@page import="com.ITP.Model.Employee"%>
<html>
    <head>
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <style>
            html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
            .w3-sidebar {
            z-index: 3;
            width: 250px;
            top: 43px;
            bottom: 0;
            height: inherit;
            }
            
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
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
            <link rel="stylesheet" type="text/css" href="./assets/css/font-awesome.min.css">
            <link rel="stylesheet" type="text/css" href="./assets/css/dataTables.bootstrap4.min.css">
            <link rel="stylesheet" type="text/css" href="./assets/css/style.css">
            <link rel="stylesheet" href="./css/emp_salSlip.css">
            <link rel="stylesheet" href="./css/navbar.css">
     		<link rel="Stylesheet" href="./css/adcard.css">
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="./js/attendanceReport.js"></script>

    </head>
    <body>
    

		<% Employee emp = (Employee)session.getAttribute("empD"); %>
		
		<div class="topnav">
            <a class="active" href="employee1.jsp">Home</a>
            <a href="EmployeeAttendanceHistory.jsp">Attendance</a>
            <a  href="EmployeeSalary.jsp">Salary</a>
            <a  href="Emp_loan_request.jsp">Loan</a>
            <a href="<%= request.getContextPath()%>/logoutServlet">Logout</a>
        </div>
        <br>
        <br>
        <div class="fullbody">

                <div class="row">
                    <form action="" method="post">
                        <input type="hidden" name="empID" value="">
                        <input type="submit" class="btn btn-secondary" value="Delete this Months Salary">
                    </form>
                </div>

                <br>

                <div class="row">
                    <form action="" method="post">
                        <input type="hidden" name="empID" value="">
                        <input type="submit" class="btn btn-secondary" value="Set loan remainning to 0">
                    </form>
                </div>
                <br>

                <div class="row">
                    <form action="" method="post">
                        <input type="hidden" name="empID" value="">
                        <input type="submit" class="btn btn-secondary" value="Set loan remaining to full">
                    </form>
                </div>
                <br>
           </div>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="js/cbpHorizontalMenu.min.js"></script>
		<script>
			$(function() {
				cbpHorizontalMenu.init();
			});
		</script>
	</body>
</html>