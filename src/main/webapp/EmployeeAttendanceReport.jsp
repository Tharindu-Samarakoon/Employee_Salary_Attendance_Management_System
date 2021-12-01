<!doctype html>
<%@page import="com.ITP.Utility.employeeDBUtil"%>
<%@page import="com.ITP.Services.EmployeeServices"%>
<%@page import="com.ITP.Services.AttendenceServicesImpl"%>
<%@page import="com.ITP.Model.Attendence"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ITP.Model.Employee"%>
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
    <link rel="Stylesheet" href="./css/AttendanceReportPrint.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="./js/attendanceReport.js"></script>
    
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

<% Employee e = new Employee();
	ArrayList<Attendence> attList = new ArrayList<>();
	AttendenceServicesImpl attImpl = new AttendenceServicesImpl();
	employeeDBUtil empUtil = new employeeDBUtil();
	
	attList = attImpl.getAllEmployeeAttendance();
	
	%>

    <div class="fullbody">
    
    <br>
      <div style="padding-left:16px">
        <h3>Employee Attendance</h3>
      </div>
      <hr>

      <div class="card mb-3 text-center" >
        <img src="./images/attendance.png" alt="" style="object-fit: cover;" height="250px">
      <div class="card-body">
        <h3 >Mark Employee Attendance</h3>
        <h6 class="card-text">Today's attendance or a previous days attendance can be marked by entering the date</h6>
        <form action="MarkAttendanceServlet" method="POST">
            <input type="hidden" value="">
            <button class="btn btn-outline-secondary" type="submit" style="padding: 10px; margin-top: 50px; font-size: 18px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">Mark Attendance</button>
        </form>
      </div>
    </div>
    <br>

        <div class="attendence-table ">
            <div style="padding-left:16px">
                <h3 class="print">Employee Attendance Report</h3>
              </div>
              <hr class="print">

              <form action="SearchAttendanceReportServlet" method = "post" class="row g-3">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-3">
                            <label for="Department" class="form-label">Department</label>
                            <select id="Department" name="Department" class="form-select">
                                <option selected value = "All">All</option>
                                <option value = "Restaurant">Restaurant</option>
                                <option value = "Security">Security</option>
                                <option value = "House Keeping">House Keeping</option>
                      </select>
                        </div>
                        <div class="col-md-3">
                            <label for="Type" class="form-label">Type</label>
                            <select id="Type" name="Type" class="form-select">
                                <option value = "All" selected>All</option>
                                <option value = "OTonly">Overtime Only</option>
                                <option value = "NoOT">No Overtime</option>
                            </select>
                        </div>
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
                </div>
                <!-- <div class="col-md-3">
                    <label for="Department" class="form-label">Department</label>
                    <select id="Department" class="form-select">
                      <option selected>Choose...</option>
                      <option>...</option>
                    </select>
                  </div>
                  <div class="col-md-3">
                      <label for="Type" class="form-label">Type</label>
                      <select id="Type" class="form-select">
                        <option selected>Choose...</option>
                        <option>...</option>
                      </select>
                    </div> -->
                    

                        <div class="form-group">
                            <div class="row align-self-end">
                                <div class="col ">
                                    <button type="submit" class="btn btn-secondary ">Apply Filter</button>
                                </div>
                            </div>
                        </div>
              </form>
              <br class="print">


            <div class="row print">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-striped custom-table">
                            <thead>
                                <tr>
                                    <th style="min-width:200px;" onclick="sortTable(0)" >Name</th>
                                    <th onclick="sortTable(1)">Department</th>
                                    <th>Date</th>
                                    <th>Arrival Time</th>
                                    <th style="min-width: 110px;">Departure Time</th>
                                    <th>OT hours</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%for(Attendence att : attList) { 
                            	int EID = att.getEmpID();
                            	e = empUtil.getEmployee(EID);
                            	
                            	
                            	%>
                            
                                <tr>
                                    <td>
                                        <div class="row">
                                        	<div class="col">
                                        		<h6><%=e.getfName()+" "+e.getlName() %></h6>
                                        	</div>
                                        </div>
                                    </td>
                                    <td><%=e.getDepartment() %></td>
                                    <td><%=att.getAttDate() %></td>
                                    <td><%=att.getArrTime()+"h" %></td>
                                    <td><%=att.getDepTime()+"h" %></td>
                                    <td><%=att.getOThours()+" hrs" %></td>
                                </tr>
                                <% } %>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </div>
    <div class="printButtons">
            <div class="btn-group btn-group-sm">

                <button class="btn btn-outline-secondary" onclick="window.print();return false;"><i class="fa fa-print fa-lg"></i> Print</button>
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