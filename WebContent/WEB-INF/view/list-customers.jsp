<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
	<title>List Customers</title>
	
	<link type="text/css" 
		  rel="stylesheet" 
		  href="${pageContext.request.contextPath}/resources/css/style.css">
	
</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>

	<div id="container">
	
		<div id="content">
		
			<!-- put new button: Add Customer -->
			
			<input type="button" value="Add Customer" 
				   onclick="window.location.href='showFormForAdd'; return false;"
				   class="add-button"
			/>
		
			<table>
			
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email Name</th>
					<th>Action</th>
				</tr>
			
				<c:forEach var="tempCustomer" items="${customers}">
			
					<tr>
						<td> ${tempCustomer.firstName} </td>
						<td> ${tempCustomer.lastName} </td>
						<td> ${tempCustomer.email} </td>
						
						<td> 
							<!-- construct an "update" link with customer id -->
							<c:url var="updateLink" value="/customer/showFormForUpdate" >
							   <c:param name="customerId" value="${tempCustomer.id}"/>
							</c:url>

							<!-- construct an "update" link with customer id -->
							<c:url var="deleteLink" value="/customer/delete" >
							   <c:param name="customerId" value="${tempCustomer.id}"/>
							</c:url>

							<!-- display the update link -->
							<a href="${updateLink}">Update</a> 
							|
							<a href="${deleteLink}"
								onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false">
								Delete</a> 
						</td>
					</tr>
					
				</c:forEach>
			
			</table>		
		</div>
	
	</div>
</body>
</html>