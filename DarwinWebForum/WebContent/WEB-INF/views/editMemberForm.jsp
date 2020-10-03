<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Member</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<!-- css  -->
<style>
p {
	color: red;
}

h2 {
	font-size: 32px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light">
		<ul class="navbar-nav">
			<li><a class="nav-link" href="<c:url value='/index'/>">Home</a></li>
			<li><a class="nav-link" href="<c:url value='/about'/>">About</a></li>
			<li><a class="nav-link" href="<c:url value='/addMember'/>">Add Member</a></li>
			<li><a class="nav-link" href="<c:url value='/logout'/>">LogOut</a></li>
		</ul>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div align="center">
					<h2>Edit Member</h2>
					<form:form action="processAddMember" method="post"
						modelAttribute="member">
						<table border="0" cellpadding="5">
							<tr>
								<td>ID:</td>
								<td>${member.id} <form:hidden path="id" />
								</td>
							</tr>

							<tr>
								<td>Name :</td>
								<td><form:input path="name" /></td>
							</tr>
							<tr>
								<td>Email :</td>
								<td><form:input path="email" /></td>
							</tr>
							<tr>
								<td>Address :</td>
								<td><form:input path="address" /></td>
							</tr>
							<tr>
								<td>Password :</td>
								<td><form:input path="password" /></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="Save" /></td>
							</tr>

						</table>
					</form:form>
				</div>
				<div class="col-md-6"></div>
				
			</div>
		</div>
</body>
</html>