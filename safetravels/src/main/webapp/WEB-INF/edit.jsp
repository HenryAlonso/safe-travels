<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Expense</title>

<link rel="stylesheet" type ="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="top-edit">
		<h1>Edit Expense </h1>
		<a href="/expenses"><button>Go Back</button></a>
	</div>
	<div class="edit-form">
	<form:form action="/expenses/edit/${expense.id}" method="post" modelAttribute="expense">
		<div>
		  	<form:label for="name" class="form-label" path="name">Expense Name: </form:label>
		  	<form:errors class="warning" path="name"/>
		  	<form:input class="form-control" path="name"/>
		</div>
		  	<form:label for="vendor" class="form-label" path="vendor">Vender: </form:label>
		  	<form:errors class="warning" path="vendor"/>
		  	<form:input class="form-control" path="vendor"/>			
		<div>
		</div>
			<form:label for="amount" class="form-label" path="amount">Amount:</form:label>
			<form:errors class="warning" path="amount"/>
			<form:input class="form-control" type="number" step="0.50" min="0" path="amount"/>
		<div>
			<form:label for="description" class="form-label" path="description">Description:</form:label>
			<form:errors class="warning" path="description"/>
			<form:textarea class="form-control" rows="4" path="description"/>
		</div>  	
		<div>
		</div>  	
	<input type="submit" value="Submit"/>
	</form:form>
	</div>
	

</body>
</html>