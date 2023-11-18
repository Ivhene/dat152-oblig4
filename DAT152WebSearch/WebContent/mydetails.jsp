<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My details</title>
</head>
<body>
	<h3>My details</h3>
	<p><font color="red">${message}</font></p>
	<p>First name: <c:out value="${user.firstname}"></c:out><br>
	   Last name: <c:out value="${user.lastname}"></c:out><br>
	   Mobile phone: <c:out value="${user.mobilephone}"></c:out></p>
	<br>
	<p><b>My personal search history</b></p>
	<p>
	<c:forEach var="searchItem" items="${myhistory}">
		<c:out value="${searchItem.datetime}"></c:out>
		<a href="dosearch?user=${user.username}&searchkey=${searchItem.searchkey}">
		<c:out value="${searchItem.searchkey}"></c:out></a><br>
	</c:forEach><br>
	<form action="mydetails" method="post">
	<table>
		<tr><td><p>Sort By </td></tr>
		<tr><td><input type="radio" name="sortkey" value="datetime">Date<br></td></tr>
		<tr><td><input type="radio" name="sortkey" value="searchkey">Search Word<br></td></tr>
		<tr><td><p><input type="submit" value="Sort"/></p></td>
		</tr>
	</table>
	</form>
	<br>
	<p><a href="searchpage">Back to Main search page</a></p>
	<p><a href="updatepassword">Update Password</a></p>
	<p>${updaterole}</p>
	<p><b>You are logged in as <c:out value="${user.username}"></c:out>. <a href="logout">Log out</a></b></p>
</body>
</html>