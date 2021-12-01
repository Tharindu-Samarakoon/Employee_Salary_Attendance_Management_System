<!doctype html>
<%@page import="com.ITP.Utility.employeeDBUtil"%>
<%@page import="com.ITP.Services.EmployeeServices"%>
<%@page import="com.ITP.Model.Employee"%>
<%@page import="com.ITP.Services.LoanServicesImpl"%>
<%@page import="com.ITP.Model.Loan"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>Hello, world!</title>
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
    </style>
    <link rel="Stylesheet" href="./css/Admin.css">
    <link rel="stylesheet" href="./css/emp_attendence.css">
    <script src="./js/attendanceFormValidateion.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </head>
  <body>
    <h1>Hey Admin!</h1>
    
    
    <header class="site-header sticky-top py-1">
  <nav class="container d-flex flex-column flex-md-row justify-content-between">
    
    <a class="py-2 d-none d-md-inline-block" href="admindashboard">DashBoard</a>
    <a class="py-2 d-none d-md-inline-block" href="admin.jsp">Employees</a>
    <a class="py-2 d-none d-md-inline-block" href="welcomeAdmin(1).jsp">Customers</a>
    <a class="py-2 d-none d-md-inline-block" href="viewrooms.jsp">Reservations</a>
    <a class="py-2 d-none d-md-inline-block" href="admin1.jsp">Restaurant</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Events</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Promotions</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Feedback</a>
  </nav>
</header>

<% ArrayList<Loan> loanRequests = new ArrayList();
	LoanServicesImpl loanImp = new LoanServicesImpl();
	loanRequests = loanImp.getRequestedLoanDetails();%>

    <div class="fullbody">

        <div class="attendence-table">
            <div style="padding-left:16px">
                <h3>Employee Loan Requests</h3>
              </div>
              <hr>

            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-striped custom-table">
                            <thead>
                                <tr>
                                    <th style="min-width:200px;">Name</th>
                                    <th>Department</th>
                                    <th>Position</th>
                                    <th style="min-width: 110px;">Basic Salary</th>
                                    <th>Loan Amount</th>
                                    <th>Monthly Deduction</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Loan l : loanRequests) { 
                                
                                	int ID = l.getEmpID();
                                	employeeDBUtil empS = new employeeDBUtil();
                                		Employee E = empS.getEmployee(ID);%>
                               
                                
                                	<tr>
                                    <td>
                                        <div class="row">
                                        	<div class="col">
                                        		<h6><%=E.getfName() + " " +E.getlName()%></h6>
                                        	</div>
                                        </div>
                                    </td>
                                    <td><%=E.getDepartment() %></td>
                                    <td><%=E.getDesignation() %></td>
                                    <td><%=E.getBasicSalary() %></td>
                                    <td><%=l.getLoanAmt() %></td>
                                    <td><%=l.getMonthlyAmt() %></td>
                                    <td>
                                        <form action="UpdateLoanStatusServlet" method="POST" class="deleteBonus">
                                            <input type="hidden" name = "LoanID" value=<%=l.getLoanID()%>>
                                            <input type="hidden" name = "status" value="1">
                                            <input class="btn btn-outline-success rounded-1 btn-sm" type="submit" value="Approve">
                                        </form>
                                    </td>
                                    <td>
                                        <form action="UpdateLoanStatusServlet" method="POST" class="updateBonus">
                                            <input type="hidden" name = "LoanID" value=<%=l.getLoanID()%>>
                                            <input type="hidden" name = "status" value="2">
                                            <input class="btn btn-outline-danger rounded-1 btn-sm" type="submit" value="Deny" style="border-radius: 3;">
                                        </form>
                                    </td>
                                </tr>
                                
                                <% } %>
                                
                            </tbody>
                        </table>
                    </div>
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