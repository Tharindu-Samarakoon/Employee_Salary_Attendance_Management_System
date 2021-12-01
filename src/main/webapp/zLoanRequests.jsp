<%@page import="com.ITP.Model.Loan"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ITP.Services.LoanServicesImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

	

</head>
<body>

	<% LoanServicesImpl LSI = new LoanServicesImpl();
		ArrayList<Loan> loanList = new ArrayList<Loan>();
		
		loanList = LSI.getRequestedLoanDetails();
		
		
		
	
	
	%>

</body>
</html>