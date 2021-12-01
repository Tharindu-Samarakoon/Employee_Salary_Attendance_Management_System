<!DOCTYPE html>
<%@page import="com.ITP.Services.SalaryServicesImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ITP.Model.Salary"%>
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

            .card {

                background-color: rgb(237, 237, 237);

            }
            </style>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
                <link rel="stylesheet" type="text/css" href="./assets/css/font-awesome.min.css">
                <link rel="stylesheet" type="text/css" href="./assets/css/dataTables.bootstrap4.min.css">
                <link rel="stylesheet" type="text/css" href="./assets/css/style.css">
                <link rel="stylesheet" href="./css/emp_salSlip.css">
                <link rel="stylesheet" href="./css/navbar.css">

    </head>
    <body>
    
    <%	String status = "status";
    	Employee emp = (Employee)session.getAttribute("empD");
    	SalaryServicesImpl SalImp = new SalaryServicesImpl();
    	ArrayList<Salary> sal = SalImp.getPrevSalaries(emp);%>

        <div class="topnav">
            <a href="employee1.jsp">Home</a>
            <a href="EmployeeAttendanceHistory.jsp">Attendance</a>
            <a class="active"  href="EmployeeSalary.jsp">Salary</a>
            <a  href="Emp_loan_request.jsp">Loan</a>
            <a href="logoutServlet">Logout</a>
          </div>
          <br>
          <br>
          <div class="fullbody">
          <div style="padding-left:16px">
            <h2>Employee Salary</h2>
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

          <div class="card mb-3 text-center" >
              <img src="./images/employeeCard.jpg" alt="" style="object-fit: cover;" height="250px">
            <div class="card-body">
              <h3 >Salary For Current Month</h3>
              <h4 class="card-text">Please generate your salary slip before the end of the month and use it when obtaining your salary</h4>
	              <form action="CalculateSalaryServlet" method="POST">
	                  <input type="hidden" value="">
	                  <button class="btn btn-outline-secondary" type="submit" style="padding: 10px; margin-top: 50px; font-size: 18px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">View Salary Slip for this Month</button>
	              </form>
              </div>
          </div>

        <br>
        <br>

        

        <br>

        <div style="padding-left:16px">
            <h3>Employee Salary Record</h3>
          </div>
          <hr>
        <div class="card-box">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-striped custom-table">
                            <thead>
                                <tr>
                                    <th style="min-width:200px;">PaySlip #</th>
                                    <th>Month</th>
                                    <th>Basic Salary</th>
                                    <th>Total Bonuses</th>
                                    <th style="min-width: 110px;">Gross Salary</th>
                                    <th>Total Deductions</th>
                                    <th>Net Salary</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% for(Salary salary: sal) { %>
                                <tr>
                                    <td>#<%=salary.getSalaryID() %></td>
                                    <td><%=salary.getSalaryMonth() %> <%=salary.getYear() %></td>
                                    <td><%=emp.getBasicSalary() %></td>
                                    <td><%=salary.getGrossAmt() - emp.getBasicSalary() %></td>
                                    <td><%=salary.getGrossAmt() %></td>
                                    <td><%=salary.getGrossAmt() - salary.getNetAmt() %></td>
                                    <td><%=salary.getNetAmt() %></td>
                                </tr> 
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
          </div>
    </body>
</html>