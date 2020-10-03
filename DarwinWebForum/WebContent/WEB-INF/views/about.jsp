<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	<br>
	<tr>
		<td>
			"Hey ! I'm Darwin - an engineer with a passion for Java SpringMVC."
		</td>
		<td>
			<h1>This is the last Java Spring MVC project from Mr Iswanto.</h1>
		</td>
		<td>
		<ul>
			<li>This project was made by using Java SE 11, Spring MVC, Hibernate, JPA, MySQL
			<li>User admin can log in and search member (sort using PagingRepository)
			<li>User admin can also Create new Member, Edit and Delete Member
		</ul>
		<td>
			<p>Default Email : admin@yahoo.com Password : admin
		</td>
	</tr>
	
	<p style="color:black;">Copyright 2020 &copy;</p>
</body>
</html>