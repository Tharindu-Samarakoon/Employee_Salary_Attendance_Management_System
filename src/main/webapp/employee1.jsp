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
            <a href="logoutServlet">Logout</a>
        </div>
        <br>
        <br>
        <div class="fullbody">
                  <div>
		<div class="w3-container" align="center">
		  <div class="w3-panel w3-card-4" style="width:75%" align="center" >
			<div class="form-inline">
				
				<form action="<%= request.getContextPath()%>/leaveRedirect">
					<input type="hidden" value="<%= emp.getEid() %> ">
					<button type="submit">Apply Leave</button>
				</form>
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				
				<form method="post" action="<%=request.getContextPath()%>/lvStatusServlet">
      					<input type="hidden" name="emID" value="<%= emp.getEid() %>">
      					<button type="submit">Requested Leave </button>
				</form>
		
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

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="js/cbpHorizontalMenu.min.js"></script>
		<script>
			$(function() {
				cbpHorizontalMenu.init();
			});
		</script>
	</body>
</html>