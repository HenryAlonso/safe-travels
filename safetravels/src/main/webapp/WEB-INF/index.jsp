<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Safe Travels</title>

<link rel="stylesheet" type ="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<h1>Safe Travels</h1>
	<table class="table table-dark table-striped">
		  		<thead>
			    	<tr class="table table-dark">
				      	<th scope="col">Expense</th>
				      	<th scope="col">Vendor</th>
				      	<th scope="col">Amount</th>
				      	<th scope="col">Actions</th>
			    	</tr>
			  	</thead>
			  	<tbody>
			  		<c:forEach var="expense" items="${expenses}">
				    	<tr>
				    		<td>
				    			<a class="links" href="/expenses/show/<c:out value="${expense.id}"></c:out>">
				    			<c:out value="${expense.name}"></c:out>
								</a>
				    		</td>
				    		<td>
				    			<c:out value="${expense.vendor}"></c:out>
				    		</td>
				    		<td>
								<fmt:formatNumber value="${expense.amount}" pattern="#,###.00"/>		
				    		</td>
				    		<td>
				    			<a class="links" href="/expenses/edit/${expense.id}">Edit | </a>
								<a class="links" href="/expenses/delete/${expense.id}">Delete</a>
				    		</td>
				    	</tr>
			  		</c:forEach>
				</tbody>
			</table>
				<h1 class="form-center">Add an expense:</h1>
			<form:form action="/expenses/new" method = "post" modelAttribute = "expense">
			<div class="form-center">
				<p>
					<form:label path="name">Expense Name: </form:label>
					<form:errors class="warning" path="name"/>
					<form:input type="text" path="name"/>
				</p>
				<p>
					<form:label path="vendor">Vendor:</form:label>
					<form:errors class="warning" path="vendor"/>
					<form:input type="text" path="vendor"/>
				</p>
				<p>
					<form:label path="amount">Amount:</form:label>
					<form:errors class="warning" path="amount"/>
					<form:input type="number" step="0.50" min="0" path="amount"/>
				</p>
				<p>
					<form:label path="description">Description:</form:label>
					<form:errors class="warning" path="description"/>
					<form:textarea rows="4" path="description"/>
				</p>
			</div>	
			<div class="form-center">
				<input type="submit" value="Submit"/>
			</div>
			</form:form>
			
			
			
			
			
			
</body>
</html>