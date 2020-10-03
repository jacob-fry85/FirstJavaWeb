<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Member</title>
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
					<div>
						<h1>Member List</h1>
					</div>

					<div>
						<form method="get" action="searchMember">
							<input type="text" name="keyword" /> <input type="submit"
								value="Search" />
						</form>
						<br>
						<table border="1" padding="5">
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Email</th>
								<th>Address</th>
								<th>Password</th>
								<th>Action</th>
							</tr>
							<c:forEach items="${listMember}" var="member">
								<tr>
									<td>${member.id}</td>
									<td>${member.name}</td>
									<td>${member.email}</td>
									<td>${member.address}</td>
									<td>${member.password}</td>
									<td><a href="editMember?id=${member.id}">Edit</a>
										&nbsp;&nbsp;&nbsp;&nbsp; <a
										href="deleteMember?id=${member.id}">Delete</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div>
						Total Items: ${totalItems} - Page: ${currentPage} of ${totalPages}
						&nbsp; - &nbsp;
						<span>
					
						<c:forEach var="j" begin="1" end="${totalPages}">  
   							<a href = '<c:url value ="/page/${j}" />'><c:out value="${j}" /></a> &nbsp;&nbsp;
						</c:forEach>
						</span>
						


					</div>
				</div>
				<div class="col-md-6"></div>
				<p style="color:black;">Copyright 2020 &copy;</p>
			</div>
		</div>
</body>
</html>