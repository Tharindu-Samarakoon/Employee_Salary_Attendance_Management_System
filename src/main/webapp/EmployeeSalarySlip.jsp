!DOCTYPE html>
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
            </style>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
                <link rel="stylesheet" type="text/css" href="./assets/css/font-awesome.min.css">
                <link rel="stylesheet" type="text/css" href="./assets/css/dataTables.bootstrap4.min.css">
                <link rel="stylesheet" type="text/css" href="./assets/css/style.css">
                <link rel="stylesheet" href="./css/emp_salSlip.css">
                <link rel="stylesheet" href="./css/navbar.css">
                <link rel="stylesheet" href="./css/salarySlipPrint.css" media="print">

    </head>
    <body>
    
    <%	String status = "status";
    	Salary S = (Salary)session.getAttribute("Salary");
    	Employee emp = (Employee)session.getAttribute("empD");
    	Double OTBonus = (Double)session.getAttribute("OT");%>

        <div class="topnav">
            <a href="employee1.jsp">Home</a>
            <a href="EmployeeAttendanceHistory.jsp">Attendance</a>
            <a class="active" href="EmployeeSalary.jsp">Salary</a>
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

        <!-- payment slip -->
        
        <%	
        	if(S != null) { %>
        	
            <div class="print">
                <div class="card-box">
                    <h4 class="payslip-title">Payslip for the  year <%=S.getYear() %></h4>
                    <div class="row">
                        <div class="col-sm-6 m-b-20">
                            <!-- <img src="assets/img/logo-dark.png" class="inv-logo" alt=""> -->
                            <ul class="list-unstyled mb-0">
                                <li>Feb Ceylon</li>
                                <li>3864 Quiet Valley Lane,</li>
                                <li>Sherman Oaks, Kandy, 91403</li>
                            </ul>
                        </div>
                        <div class="col-sm-6 m-b-20">
                            <div class="invoice-details">
                                <h3 class="text">Payslip #<%=S.getSalaryID()%></h3>
                                <ul class="list-unstyled">
                                    <li>Salary Month: <span><%=S.getSalaryMonth() %>, <%=S.getYear() %></span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 m-b-20">
                            <ul class="list-unstyled">
                                <li>
                                    <h5 class="mb-0"><strong><%=emp.getfName()%> <%=emp.getlName() %></strong></h5></li>
                                <li><span><%=emp.getDesignation() %></span></li>
                                <li>Employee ID: E-<%=emp.getEid() %></li>
                                <li>Department: <%=emp.getDepartment() %></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div>
                                <h4 class="m-b-10"><strong>Earnings</strong></h4>
                                <table class="table table-bordered">
                                    <tbody>
                                        <tr>
                                            <td><strong>Basic Salary</strong> <span class="float-right">Rs.<%=emp.getBasicSalary() %></span></td>
                                        </tr>
                                        <tr>
                                            <td><strong>OT Bonus</strong> <span class="float-right"><strong>Rs.<%=S.getOTbonus() %></strong></span></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Other Bonuses</strong> <span class="float-right">Rs.<%=S.getGrossAmt() - emp.getBasicSalary() - S.getOTbonus()%></span></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Gross Salary</strong> <span class="float-right">Rs.<%=S.getGrossAmt() %></span></td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div>
                                <h4 class="m-b-10"><strong>After Deductions</strong></h4>
                                <table class="table table-bordered">
                                    <tbody>
                                        <tr>
                                            <td><strong>Loan Deductions</strong> <span class="float-right">Rs.<%=S.getLoanDeductable() %></span></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Other Deductions</strong> <span class="float-right">Rs.<%=S.getGrossAmt() - S.getNetAmt() - S.getLoanDeductable() %></span></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Total Deductions</strong> <span class="float-right">Rs.<%=S.getGrossAmt() - S.getNetAmt() %></span></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Net Salary</strong> <span class="float-right"><strong>Rs.<%=S.getNetAmt() %></strong></span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <div class="printButtons">
            <div class="btn-group btn-group-sm">

                <button class="btn btn-white" onclick="window.print();return false;"><i class="fa fa-print fa-lg"></i> Print</button>
            </div>
        </div>
        <% } %>
        <br>
        <br>
          </div>
    </body>
</html>