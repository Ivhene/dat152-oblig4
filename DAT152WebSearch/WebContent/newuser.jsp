<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New User</title>
</head>
<body>
	<h3>Register new user</h3>
	<p><font color="red"><c:out value="${message}"></c:out></font></p>
	<form method="post">
		<p>Username <input type="text" name="username" required/></p>
		<p>Password <input type="password" name="password" 
		pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,50}$" 
		title="Password must be between 6 and 50 characters long and contain at least one number, one capital letter, and one non-capital letter." 
		required /></p>
		<p>Confirm Password <input type="password" name="confirm_password" required/></p>
		<p>First Name <input type="text" name="first_name" required/></p>
		<p>Last Name <input type="text" name="last_name" required/></p>
		<p>Mobile Phone <input type="text" name="mobile_phone" required/></p>
		<p><b>Preferred Dictionary Source for this computer</b><br>
			<input type="radio" name="dicturl" value="${dictconfig}" checked="checked"/>http://localhost... (Norway)<br>
			<input type="radio" name="dicturl" value="http://www.mso.anu.edu.au/~ralph/OPTED/v003/"/>http://www.mso.anu.edu.au... (Australia)
		<p><input type="submit" value="Register and log in"/></p>
	</form>
	<p><a href="index.jsp">Back</a></p>
</body>
</html>