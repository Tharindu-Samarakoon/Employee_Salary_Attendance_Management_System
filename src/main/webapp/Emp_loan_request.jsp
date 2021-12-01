<!DOCTYPE html>
<%@page import="java.sql.Date"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.ITP.Model.Loan"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ITP.Services.LoanServicesImpl"%>
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

    </head>
    <body>
    <% Employee emp = (Employee)session.getAttribute("empD");
    	LoanServicesImpl loanImp = new LoanServicesImpl();
    	ArrayList<Loan> loanList = new ArrayList<>();
    	loanList = loanImp.getEmpRequestedLoanDetails(emp.getEid());
    %>

        <div class="topnav">
            <a href="employee1.jsp">Home</a>
            <a href="EmployeeAttendanceHistory.jsp">Attendance</a>
            <a  href="EmployeeSalary.jsp">Salary</a>
            <a class="active" href="Emp_loan_request.jsp">Loan</a>
            <a href="logoutServlet">Logout</a>
        </div>
        <br>
        <br>
        <div class="fullbody">
          <div style="padding-left:16px">
            <h3>Employee Loan Request</h3>
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

        <div style="padding-left:16px">
            <h3>Previous Loan</h3>
        </div>
        <hr>
        
            <div class="card">
                    <div class="row" style="margin-left: 5px; margin-right: 5px;">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table">
                                    <thead>
                                        <tr>
                                            <th style="min-width:200px;">Loan #</th>
                                            <th>Amount</th>
                                            <th>Total Period</th>
                                            <th>Time Left</th>
                                            <th style="min-width: 110px;">Monthly Deduction</th>
                                            <th>Amount Left</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%for(Loan l : loanList) { 
                                    	String status = l.getLoanStatus();
                                    	System.out.println(status);
                                    %>
                                    	<%if(status.equals("Requested")) { %>
                                        <tr>
                                            <td># <%=l.getLoanID() %></td>
                                            <td><%="Rs."+l.getLoanAmt() %></td>
                                            <td><%=l.getLoanPeriod()+" Months" %></td>
                                            <td>--</td>
                                            <td><%="Rs."+l.getMonthlyAmt() %></td>
                                            <td>--</td>
                                            <td>
                                                <span class="custom-badge status-orange">Requested</span>
                                            </td>
                                        </tr>
                                        <%} else if(status.equals("Active")) { 
                                        	
                                        	LocalDate start = LocalDate.parse(String.valueOf(l.getStartDate()));
                                        	LocalDate now = LocalDate.now();
                                        	
                                        	long monthsBetween = ChronoUnit.MONTHS.between(
                                        	        start.withDayOfMonth(1),
                                        	        now.withDayOfMonth(1));
                                        	System.out.println(monthsBetween);
                                        	int leftmonths = (l.getLoanPeriod()-(int)monthsBetween);
                                        	String months;
                                        	if(leftmonths < 0) {
                                        		months = "overdue";
                                        	}
                                        	months = String.valueOf(leftmonths);
                                        %>
                                        <tr>
                                            <td># <%=l.getLoanID() %></td>
                                            <td><%="Rs."+l.getLoanAmt() %></td>
                                            <td><%=l.getLoanPeriod()+" Months" %></td>
                                            <td><%=months + " months"%></td>
                                            <td><%="Rs."+l.getMonthlyAmt() %></td>
                                            <td><%="Rs."+l.getAmtLeft() %></td>
                                            <td>
                                                <span class="custom-badge status-green">Active</span>
                                            </td>
                                        </tr>
                                        <%} else if(status.equals("Finished")) { %>
                                        <tr>
                                            <td># <%=l.getLoanID() %></td>
                                            <td><%="Rs."+l.getLoanAmt() %></td>
                                            <td><%=l.getLoanPeriod()+" Months" %></td>
                                            <td>--</td>
                                            <td><%="Rs."+l.getMonthlyAmt() %></td>
                                            <td>--</td>
                                            <td>
                                                <span class="custom-badge status-blue">Finished</span>
                                            </td>
                                        </tr>
                                        <% } else { %>
                                        <tr>
                                            <td># <%=l.getLoanID() %></td>
                                            <td><%="Rs."+l.getLoanAmt() %></td>
                                            <td><%=l.getLoanPeriod()+" Months" %></td>
                                            <td>--</td>
                                            <td><%="Rs."+l.getMonthlyAmt() %></td>
                                            <td>--</td>
                                            <td>
                                                <span class="custom-badge status-red">Denied</span>
                                            </td>
                                        </tr>
                                        <% } } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

        </div>
        <br>

        <div style="padding-left:16px">
            <h3>Apply for Loan</h3>
          </div>
          <hr>
          <%String fullName = emp.getfName()+" "+emp.getlName(); %>
            <div class="profileCard bg-light border">
                <form action="AddLoanRequestServlet" method="POST" style="margin: 25px 15px 25px; padding: 10px;">
                  <div class="col">
                    <div class="row">
                      <div class="form-group col-md-6 ">
                        <label for="inputEmail4" class="form-label">Name</label>
                        <input type="text" name="name" class="form-control" id="inputEmail4"  value=<%=fullName%> disabled="disabled">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputPassword4" class="form-label">Position</label>
                        <input type="text" name="position" class="form-control" id="inputPassword4"  value=<%=emp.getDesignation() %> disabled="disabled">
                      </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                          <label for="inputEmail4" class="form-label">Department</label>
                          <input type="text" name="department" class="form-control" id="inputEmail4"  value=<%=emp.getDepartment() %> disabled="disabled">
                        </div>
                        <div class="form-group col-md-6">
                          <label for="inputPassword4" class="form-label">Basic Salary</label>
                          <input type="text" name="basicSalary" class="form-control" id="inputPassword4"  value=<%=emp.getBasicSalary()%> disabled="disabled">
                        </div>
                      </div>
                      <div class="row">
                        <div class="form-group col-md-6">
                          <label for="inputEmail4" class="form-label">Loan Amount (Rs.5000 - Rs.500000)</label>
                          <input type="number" name="loanAmt" class="form-control" min="5000" max="500000" id="inputEmail4" placeholder="Rs.">
                        </div>
                        <div class="form-group col-md-6">
                          <label for="inputPassword4" class="form-label">Loan Period</label>
                          <select name="loanPeriod" class="form-control">
                            <option value="4">4 Months</option>
                            <option value="6">6 Months</option>
                            <option value="8">8 Months</option>
                            <option value="12">12 Months</option>
                            <option value="18">18 Months</option>
                            <option value="24">24 Months</option>
                          </select>
                        </div>
                      </div>
                            
                        </div>
                        <div class="form-row" style="margin: 15px 0px;">
                            <input type="submit" value="Apply for Loan" class="btn btn-primary">
                        </div>
                </form>
                        </div>
                          
                    </div>
                    <!-- <div class="profileCard  col-md-6 form-group">
                      <img src="./images/loan.png" alt="" width="400px" class="rounded float-right">
                    </div> -->

                  </div>
                  
                </div>
            </div>

            
    </body>
</html>