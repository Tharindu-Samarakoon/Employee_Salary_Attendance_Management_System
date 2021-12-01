<!doctype html>
<%@page import="com.ITP.Model.OTbonus"%>
<%@page import="com.ITP.Model.SalaryChanges"%>
<%@page import="com.ITP.Services.SalaryChangesServicesImpl"%>
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
      
      
      .fullbody {
      	background-color: white;
      	height: 100%;
      	padding-bottom: 10px;
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

<% ArrayList<SalaryChanges> Changes = new ArrayList<SalaryChanges>();
    SalaryChangesServicesImpl S = new SalaryChangesServicesImpl();
    Changes = S.getChanges();
    OTbonus OT = new OTbonus();
    OT = S.getOTbonus();
     
%>

<div class="fullbody">

        <div class="attendence-table">
            <div style="padding-left:16px">
                <h4>Employee Salary: Bonuses and Deductions</h4>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-striped custom-table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Rate</th>
                                    <th>Department</th>
                                    <th style="width: 200px;"></th>
                                    <th style="width: 200px;"></th>
                                  </tr>
                            </thead>
                            <tbody>
                                <% for(SalaryChanges C : Changes) {
                                    if(C.getStatus().equals("Active")) {
                                        session.setAttribute("ChangeObject",C); 
                                    %>
                                <tr>
                                  <td><%=C.getName()%></td>
                                  <td><%=C.getType()%></td>
                                  <td><%=C.getRate()%>%</td>
                                  <td><%=C.getChangeFor()%></td>
                                  <td>
                                    <form action="updateBonus.jsp" method="POST" class="updateBonus">
                                        <input type="hidden" value=<%=C.getID()%> name="ChangeID">
                                        <input class="btn btn-success" type="submit" value="Update" >
                                    </form>
                                  </td>
                                  <td>
                                    <form action="RemoveSalaryAdjustmentsServlet" method="POST" class="deleteBonus">
                                        <input type="hidden" value=<%=C.getID()%> name="ChangeID">
                                        <input class="btn btn-danger" type="submit" value="Remove">
                                    </form>
                                </td>
                                </tr>
                                <%}
                                    } %>
                                    
                                 	<tr>
                                  <td>Overtime Bonus</td>
                                  <td>bonus</td>
                                  <td><%=OT.getRate()%> per hour</td>
                                  <td>All</td>
                                  <td>
                                    <form action="UpdateOTBonus.jsp" method="POST" class="updateBonus">
                                        <input type="hidden" value=<%=OT.getName()%> name="ChangeID">
                                        <input class="btn btn-success" type="submit" value="Update" >
                                    </form>
                                  </td>
                                  <td>
                                    <form action="" method="POST" class="deleteBonus">
                                        <input type="hidden" value="" name="ChangeID">
                                        <input class="btn btn-danger" type="submit" value="Remove" disabled="disabled">
                                    </form>
                                </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
            <br>
            <div style="padding-left:16px">
                <h5>Add Bonus/Deduction</h5>
              </div>
              <hr>
              <br>
            <div class="row bg-light border" style="padding: 25px;">
              <div class="col-md-8">
                <form action="AddNewSalaryAdjustmentServlet" method="POST" class="row g-3">
                <div class="row">
                  <div class="col-md-6">
                      <label for="fname" class="form-label">Adjustment Name<span>*</span></label>
                      <input class="form-control" id="fname" type="text" name="fname" required/>
                  </div>
                    <div class="col-md-6">
                      <label for="Rate" class="form-label">Rate<span>*</span></label>
                      <input class="form-control" id="Rate" type="number" step="0.01"  min="0" max="100" name="Rate" required/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-md-6">
                        <label for="Type"class="form-label">Type<span>*</span></label>
                        <select name="Type" class="form-select">
                          <option value="bonus">Bonus</option>
                          <option value="deduction">Deduction</option>
                        </select>
                     </div>
                          <div class="col-md-6">
                            <label for="Department" class="form-label">Department<span>*</span></label>
                            <select name="Department" class="form-select">
                              <option value="House Keeping">House Keeping</option>
                              <option value="Restaurant">Restaurant</option>
                              <option value="Security">Security</option>
                              <option value="All">All</option>
                            </select>
                          </div>
                      </div>
                      <div class="row" style="margin-top: 10px;">
                        <div class="col-md-6">
                          <!-- <button type="submit">Submit</button> -->
                <input type="submit" value="Submit" class="btn btn-secondary">
                        </div>
                      </div>
                      </form>
                    </div>
                    <div class="col-md-4">

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
