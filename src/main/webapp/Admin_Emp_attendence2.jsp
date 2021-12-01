<!doctype html>
<%@page import="com.ITP.Model.Employee"%>
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
        
      
      .fullbody {
      	background-color: white;
      	height: 100%;
      	margin-top: 0;
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
    
        <div class="fullbody">
        <% ArrayList<Employee> emplist = (ArrayList<Employee>) session.getAttribute("emplist"); %>
        <div class="attendence-table">
            <div style="padding-left:16px">
                <h2>Employee Attendance</h2>
              </div>
              <hr>
            <div class="row">
                <div class="col-md-12">
                    <form action="MarkAttendanceServlet" method="post">
                        <div class="row justify-content-start" style="margin-bottom: 10px;">
                                <div class="col-1">
                                    <input type="submit" value="Current Attendance" class="btn btn-secondary" style="padding-left:10px; padding-right:10px;">
                                </div>
                          </div>
                        </form>
                    <form action="InputPreviousAttendance" method="POST">
                    <div class="table-responsive">
                        
                            <table class="table table-striped custom-table">
                                <thead>
                                    <tr>
                                        <th><div class="tbhead">Employee Name</div></th>
                                        <th><div class="tbhead">Department</div></th>
                                        <th><div class="tbhead">Position</div></th>
                                        <th><div class="tbhead">Arrival Time</div></th>
                                        <th><div class="tbhead">Departure Time</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <% for(Employee e : emplist) { %>
                                    <tr>
                                        <td>
                                            <div class="row">
                                        	<div class="col-md-1">
                                        		<img width="20" height="20" src="assets/img/user.jpg" class="rounded-circle" alt="">
                                        	</div>
                                        	<div class="col">
                                        		<h6><%=e.getfName()%> <%=e.getlName() %></h6>
                                        	</div>
                                        </div>
                                        </td>
                                        <td><%=e.getDepartment() %></td>
                                        <td><%=e.getDesignation() %></td>
                                        <td><div class="timeField">
                                            <label for="inputarrivalTime" class="visually-hidden"></label>
                                            <input type="time" class="form-control" id="inputarrivalTime" name="<%=e.getEid()%>ArrivalTime">
                                        </div></td>
                                        <td><div class="timeField">
                                            <label for="inputDepTime" class="visually-hidden"></label>
                                            <input type="time" class="form-control" id="inputDepTime" name="<%=e.getEid()%>DepTime">
                                            <input type="hidden" value=<%=e.getEid()%>>
                                        </div></td>
                                    </tr>
                                    <% } %>
                                    
                                </tbody>
                            </table> 
                    </div>
                    <div class="row justify-content-start">
                        <div class="col-1">
                            <input type="submit" value="Save" class="btn btn-secondary" style="padding-left:10px; padding-right:10px;">
                        </div>
                  </div>
                </form>
                </div>
            </div>
            <br> 
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