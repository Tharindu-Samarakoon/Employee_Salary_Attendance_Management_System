<!DOCTYPE html>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalTime"%>
<%@page import="com.ITP.Model.Attendence"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ITP.Services.AttendenceServicesImpl"%>
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
    <% Employee emp = (Employee)session.getAttribute("empD"); 
    	AttendenceServicesImpl attImpl = new AttendenceServicesImpl();
    	ArrayList<Attendence> attList = new ArrayList<>();
    	
    	attList = attImpl.getEmployeeAttendance(emp.getEid());
    	%>

        <div class="topnav">
            <a href="employee1.jsp">Home</a>
            <a class="active"  href="EmployeeAttendanceHistory.jsp">Attendance</a>
            <a  href="EmployeeSalary.jsp">Salary</a>
            <a  href="Emp_loan_request.jsp">Loan</a>
            <a href="logoutServlet">Logout</a>
        </div>
        <br>
        <br>
        <div class="fullbody">
          <div style="padding-left:16px">
            <h3>Employee Attendance</h3>
          </div>
          <hr>

         


        <!-- profile card -->
        <!-- <div class="profileCard" style="padding: 15px;">
          <div class="profile-basic">
            <div class="row">
                <div class="col-md-5">
                    <div class="profile-info-left">
                        <h3 class="user-name m-t-0 mb-0"><%=emp.getfName()%> <%=emp.getlName() %></h3>
                        <small class="text-muted"><%=emp.getDesignation() %></small>
                        <div class="staff-id">Employee ID : E<%=emp.getEid()%></div>
                        <div class="staff-msg"><a href="chat.html" hidden class="btn btn-primary">Send Message</a></div>
                    </div>
                </div>
                <div class="col-md-7">
                    <ul class="personal-info">
                        <li>
                            <span class="title">Email:</span>
                            <span class="text"><%=emp.getEmailID() %></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        </div> -->

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
            <h3>Attendance Report</h3>
        </div>
        <hr>

        <div class="card">
                <form action="SearchEmployeeAttendanceHistoryServlet" method="post" style="margin-right: 15px; margin-left: 15px; margin-top: 15px;">

                <div class="row">
                    <div class="col-md-3">
                        <label for="Year" class="form-label">Year</label>
                        <select id="Year" name="Year" class="form-select">
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="Month" class="form-label">Month</label>
                        <select id="Month" name="Month" class="form-select">
                            <option selected value="0">All</option>
                            <option  value='1'>January</option>
                            <option value='2'>February</option>
                            <option value='3'>March</option>
                            <option value='4'>April</option>
                            <option value='5'>May</option>
                            <option value='6'>June</option>
                            <option value='7'>July</option>
                            <option value='8'>August</option>
                            <option value='9'>September</option>
                            <option value='10'>October</option>
                            <option value='11'>November</option>
                            <option value='12'>December</option>
                        </select>
                        </div>
                </div>
                <br>
                        <div class="row">
                            <div class="col-md-3">
                            	<input type="hidden" value=<%=emp.getEid() %> name="Empid">
                                <button type="submit" id="filter" class="form-button btn btn-primary">Apply Filter</button>
                            </div>
                        </div>
                </form>
                <br>
        
        
                    <div class="row" style="margin-right: 10px; margin-left: 10px;">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table">
                                    <thead>
                                        <tr>
                                            <th style="min-width:200px;">Date</th>
                                            <th>Arrival Time</th>
                                            <th>Departure Time</th>
                                            <th>Work Hours</th>
                                            <th style="min-width: 110px;">OT hours</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%for(Attendence att : attList) { 
                                    
                                    	LocalTime from = att.getArrTime().toLocalTime();
										LocalTime to = att.getDepTime().toLocalTime();
								
										Duration dt = Duration.between(from, to);
										int OThours = Math.round(dt.toHours());
									%>
                                        <tr>
                                            <td># <%=att.getAttDate() %></td>
                                            <td><%=att.getArrTime()%></td>
                                            <td><%=att.getDepTime()%></td>
                                            <td><%=OThours+" hr"%></td>
                                            <td><%=att.getOThours()  + " hr"%></td>
                                        </tr>
                                        <%} %>
                                        <!-- <tr>
                                            <td>#</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>#</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr> -->
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
        </div>
        <br>

            
    </body>
</html>