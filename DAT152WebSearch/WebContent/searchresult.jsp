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
	<h3>Search Results</h3>
	<p><b>Search key: "<c:out value="${searchkey}"></c:out>"</b></p>
	<c:forEach var="entry" items="${result}">
		<p><c:out value="${entry}"></c:out></p>
	</c:forEach><br>
	<p><a href="searchpage">Back to Main search page</a></p>
	<p><b>You are logged in as <c:out value="${user.username}"></c:out>. <a href="logout">Log out</a></b></p>
</body>
</html>