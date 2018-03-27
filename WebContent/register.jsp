<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>

	<form method="post" action="insert" >
		Firstname : <input name="firstName"/><br>
		Lastname :	<input name="lastName"/><br>
		Date of birth :	<input type="date" name="dob"><br>
		E-mail : 	<input type="email" name="email"/><br>
		Permenent address :<input name="pAddress"/><br>
		Current address :<input name="cAddress"/><br>
		Mobile :	<input name="mobile"/><br>
		Telephone :	<input name="telephone"/><br>
		Role :		<input name="role"/><br>
		Interest :	<input name="interest"/><br>
		<input type="submit">
	</form><br><br>
	<a href = "index.jsp">home</a>
</body>
</html>