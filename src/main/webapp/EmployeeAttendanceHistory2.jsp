<!DOCTYPE html>
<%@page import="java.time.Month"%>
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

            .printButtons {
            background-color: rgb(231, 226, 226);
            padding: 15px;
            margin-right: auto;
             }
             
             @media print {

		    @page
		    {
		     size: A4;
		     size: portrait;
		   }
		
		    body {visibility:hidden;}
		
		    .print {visibility:visible;}
		
		    .print {
		        position: absolute;
		        top: 0;
		        left: 0px;
		    }
		    
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
    	ArrayList<Attendence> attList = new ArrayList<>();
    	int year = (int)request.getAttribute("year");
    	int month = (int)request.getAttribute("month");
    	attList = (ArrayList<Attendence>)request.getAttribute("list");
    	
    	%>

        <div class="topnav">
            <a href="employee1.jsp">Home</a>
            <a class="active"  href="EmployeeAttendanceHistory.jsp">Attendance</a>
            <a href="EmployeeSalary.jsp">Salary</a>
            <a href="Emp_loan_request.jsp">Loan</a>
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

        <div style="padding-left:16px" class="print">
        	<%if(month == 0){ %>
        	<h3>Attendance Report for <%=year %></h3>
        	<%}else { %>
            <h3>Attendance Report for <%=Month.of(month).name() + " " + year %></h3>
            <%} %>
        </div>
        <hr>

        <div class="card print">
            
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

        <div class="printButtons">
            <div class="btn-group btn-group-sm">

                <button class="btn btn-white" onclick="window.print();return false;"><i class="fa fa-print fa-lg"></i> Print</button>
            </div>
        </div>
        <br>
        <div class="row">
                <div class="text-center">
                    <a href="EmployeeAttendanceHistory.jsp" class="btn btn-outline-secondary rounded-1" style="width: 100px;">Back</a>
                </div>
            </div>

            
    </body>
</html>