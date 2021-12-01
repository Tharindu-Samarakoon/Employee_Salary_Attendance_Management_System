<!doctype html>
<%@page import="java.time.Month"%>
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
	
	attList = (ArrayList<Attendence>)request.getAttribute("attendance");
	String department = String.valueOf(request.getAttribute("department"));
	String type = String.valueOf(request.getAttribute("type"));
	int year = (int)request.getAttribute("year");
	int month = (int)request.getAttribute("month");
	System.out.println(department+" " +type);
	
	%>

    <div class="fullbody">

        <div class="attendence-table print">
            <div style="padding-left:16px">
            <% if(month != 0) { %>
                <h3>Employee Attendance Report for <%=Month.of(month).name() + " " + year %> </h3>
                <%} else {%>
                <h3>Employee Attendance Report for <%=year %></h3>
                <%} %>
              </div>
              <hr>

              <br>


            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-striped custom-table">
                            <thead>
                                <tr>
                                    <th style="min-width:200px;">Name</th>
                                    <th>Department</th>
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
                            	
                            	if(department.equals("All")){
                            	
                            	
                            	if(type.equals("All")) {
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
                                
                                <% } else if(type.equals("OTonly")) { 
                                		if(att.getOThours() > 0) {
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
                                	
                                	
                                
                                <%} } else if(type.equals("NoOT")) {
                                	
                                	if(att.getOThours() == 0) {
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
                                	
                               <%}
                                	} %>
                            
                                <!-- <tr>
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
                                </tr> -->
                                <% }else { 
                                
                                	if(e.getDepartment().equals(department)) {
                                		
                                		if(type.equals("All")) {
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
                                
                                <% } else if(type.equals("OTonly")) { 
                                		if(att.getOThours() != 0) {
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
                                	
                                	
                                
                                <%} } else if(type.equals("NoOT")) {
                                	
                                	if(att.getOThours() == 0) {
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
                                	
                               <%}} }
                            	
                            	}} %>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <br>
    </div>
    <div class="printButtons">
            <div class="btn-group btn-group-sm">

                <button class="btn btn-outline-secondary" onclick="window.print();return false;"><i class="fa fa-print fa-lg"></i> Print</button>
            </div>
    </div>

    </div>
    
    <div class="row">
                <div class="text-center">
                    <a href="EmployeeAttendanceReport.jsp" class="btn btn-outline-secondary rounded-1" style="width: 100px;">Back</a>
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