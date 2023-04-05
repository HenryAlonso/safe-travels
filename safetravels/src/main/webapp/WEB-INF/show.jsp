<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Expense</title>
<link rel="stylesheet" type ="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="top-edit">
		<h1>Expense Details</h1>
		<a href="/expenses"><button>Go Back</button></a>
	</div>
	<div class="card show" style="width: 50rem;">
	 	<ul class="list-group list-group-flush">
	    	<li class="list-group-item">Expense Name: <c:out value="${expense.name}"></c:out></li>
		    <li class="list-group-item">Expense Description: <c:out value="${expense.description}"></c:out></li>
		    <li class="list-group-item">Vendor: <c:out value="${expense.description}"></c:out></li>
		    <li class="list-group-item">Amount Spent: $<fmt:formatNumber value="${expense.amount}" pattern="#,###.00"/></li>
	  	</ul>
	</div>
	
</body>
</html>