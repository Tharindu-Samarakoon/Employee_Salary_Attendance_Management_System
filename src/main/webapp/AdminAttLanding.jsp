<!DOCTYPE html>
<html>
    <head>
        
        
        <link rel="stylesheet" href="./css/Admin_EA.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/style.css">
        <link rel="stylesheet" href="./css/emp_attendence.css">
        <link rel="stylesheet" href="./css/navbar.css">
        
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
          	max-width: 850px;
          }
          </style>
        <body class="w3-content" style="max-width:2400px">
    
    
    <div class="w3-top w3-padding-16">
        <div class="w3-bar w3-theme w3-top w3-left-align w3-large">
          <a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
          <a href="#" class="w3-bar-item w3-button w3-theme-l1">FEB CEYLON</a>
          <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Employee</a>
          <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Reservations</a>
          <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Restaurant</a>
          <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Customer</a>
          <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">Reviews & Complaints</a>
          <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">Promotion</a>
        </div>
      </div>
      
      <!-- Overlay effect when opening sidebar on small screens -->
      <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

        <br>
        <br>

        <div style="margin-top: 25px; margin-left: 8%; margin-right: 8%;">
        <div class="card text-left">
          <div class="card-header">
            Edit Bonuses and Deductions
          </div>
          <div class="card-body">
             <a href="addBonus.jsp" class="btn btn-primary">Edit Bonus/Deduction</a>
          </div>
        </div>

        <div class="card text-left">
          <div class="card-header">
            Attendance
          </div>
          <div class="card-body">
            <form action="MarkAttendanceServlet" method="POST">
              <button type="submit" class="btn btn-primary">Mark Attendance</button>
              <a href="EmployeeAttendanceReport.jsp" class = "btn btn-primary">Attendance report</a>
            </form>
          </div>
        </div>

        <div class="card text-left">
          <div class="card-header">
            Loans
          </div>
          <div class="card-body">
            <p class="card-text"></p>
            <form action="" method="POST">
              <button type="submit" class="btn btn-primary">Loan Requests</button>
              <a href="Admin_View_loans.jsp" class = "btn btn-primary">Click to view loan requests</a>
            </form>
          </div>
        </div>
      </div>
        
        <!-- <div class="row row-cols-1 row-cols-md-3 g-4">
          <div class="col">
            <div class="card h-100">
              <img src="..." class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">
              </div>
              <div class="card-footer">
                <small class="text-muted">Last updated 3 mins ago</small>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-100">
              <img src="..." class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">Last updated 3 mins ago</small>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-100">
              <img src="..." class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">Last updated 3 mins ago</small>
              </div>
            </div>
          </div>
        </div> -->

      </div>
    
            <script>
      // Get the Sidebar
      var mySidebar = document.getElementById("mySidebar");
      
      // Get the DIV with overlay effect
      var overlayBg = document.getElementById("myOverlay");
      
      // Toggle between showing and hiding the sidebar, and add overlay effect
      function w3_open() {
        if (mySidebar.style.display === 'block') {
          mySidebar.style.display = 'none';
          overlayBg.style.display = "none";
        } else {
          mySidebar.style.display = 'block';
          overlayBg.style.display = "block";
        }
      }
      
      // Close the sidebar with the close button
      function w3_close() {
        mySidebar.style.display = "none";
        overlayBg.style.display = "none";
      }
      </script>
    </body>
</html>