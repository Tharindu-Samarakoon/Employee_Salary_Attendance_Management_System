<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/emlogin.css">
<style>

html {
		min-height: 100%;
		background-image: url(./images/img.png);
	   background-size: cover;
	   background-repeat: no-repeat;
	   background-position: center center;

}

  body {font-family: Arial, Helvetica, sans-serif;
	  box-sizing: border-box;
	 
	  }


.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

.icon {
  padding: 10px;
  background: dodgerblue;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.btn {
  background-color: dodgerblue;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}

body {font-family: Arial, Helvetica, sans-serif;
	  box-sizing: border-box;
	  min-height: 100%;
	  }


.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

.icon {
  padding: 10px;
  background: dodgerblue;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.btn {
  background-color: dodgerblue;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}

</style>

	

</head>
<body class="body">
 		<form name="form" action="<%= request.getContextPath()%>/loginServlet" method="post" style="max-width:500px;margin:auto">
		  <h2>Login</h2>
		  <div class="input-container">
		    <i class="fa fa-user icon"></i>
		    <input class="input-field" type="text" placeholder="Username" name="username" >
		  </div>
		
		  <div class="input-container">
		    <i class="fa fa-key icon"></i>
		    <input class="input-field" type="password" placeholder="Password" name="password" >
		  </div>
		
			<div>
				<span style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
			</div>	
 		 <button type="submit" class="btn">Login</button>
</form>
</body>
</html>

