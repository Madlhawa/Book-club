<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.*" %>
<script>
	function validateForm()
	{
		var password = document.forms["form"]["pw"].value;
		var cnfrmpassword = document.forms["form"]["pw1"].value;
		var textBox = document.getElementById("pwd");
		var textLength = textBox.value.length;
		
		if((password=="null"||password=="")||(cnfrmpassword=="null"||cnfrmpassword=="")){
			alert("Please input password.");
			return false;
		}else if(password!=cnfrmpassword){
			alert("Passwords doesn't match!");
			return false;
		}else if(textLength<=8){
			alert("Password must contains atleast 8 charactors");
			return false;
		}
	}
</script>
<title>Register</title>
</head>
<body>
		<%String msg = (String)request.getAttribute("msg"); 
		  if(msg != null && !msg.isEmpty()){
		  	if(msg.equals("pwdnotmatch"))
				out.println("<p style=\"color:red\"> *Passwords doesn't match.</p>");}%>
	<form name="form" method="post" action="insert" onsubmit="return validateForm()">
		Firstname : <input type="text" name="firstName" required/><br>
		Lastname :	<input type="text" name="lastName" required/><br>
		Password ; <input type="password" name="pw" id="pwd" required>
		Retype-Password ; <input type="password" name="pw1" required>
		E-mail : 	<input type="email" name="email"required/><br>
		Date of birth :	<input type="date" name="dob" required><br>
		Permenent address :<input type="text" name="pAddress"required/><br>
		Current address :<input type="text" name="cAddress"/><br>
		Mobile :	<input name="mobile" required/><br>
		Telephone :	<input name="telephone" required/><br>
		Role :		<input type="text" name="role"/><br>
		Interest :	<input type="text" name="interest"/><br>
		<input class="btn" type="submit" value="Submit">
	</form>
	<a href = "index.jsp">home</a>
</body>
</html>