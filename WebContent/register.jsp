<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="style2.css">
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
		}else if(textLength<8){
			alert("Password must contains atleast 8 charactors");
			return false;
		}
	}
</script>
<title>Register</title>
</head>
<body>
	<div id="navbar">	
	</div>
		<div class="container">		
			<ul class="navigationBar">
				<div id="logoArea">
					<li class="logo"><a href="index.jsp" style="font-family:logo;font-size:33px;">4Cknowledge</a></li>
				</div>
				<div id="navArea">
					<li class="nav"><a class="active" href="index.jsp">Home</a></li>
						<%
						response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
						String firstName = (String)session.getAttribute("firstName");
						String role = (String)session.getAttribute("role");
						String email= (String)session.getAttribute("email");
						if(firstName==null||firstName==""){
							%><li class="nav"><a href="register.jsp">Login/Register</a></li><%
						}else if(role.equals("Admin")){
							%><li class="nav"><a href="adminPanel.jsp"><%=firstName%></a></li><%
						}else {
							%><li class="nav"><a href="searchMember?to=userProfile&email=<%= email%>"><%=firstName%></a></li><%
						}%>
					<li class="nav"><a href="viewBooks.jsp">Books</a></li>
					<li class="nav"><a href="aboutUs.jsp">About Us</a></li>
					<li class="nav"><a href="contactUs.jsp">Contact Us</a></li>	
				</div>
			</ul>
		
			
			<br><br><br>
			<img class="header" src="header/header.jpg" alt="Norway" width="1000" height="300">
		
			<br>
		
			<div id="basicSidebar">
				<img src="gif/giphy.gif" width="360px" style="text-align:center;"><br>
				<img src="gif/gifs.gif" width="360px" style="text-align:center;"><br>
				<img src="gif/gif3.gif" width="360px" style="text-align:center;">
				
			</div>
			<div id="main">
			<br>
			<h3>Join with us to enjoy.</h3>
			<hr>
			<td style="padding-top: 1px;">&nbsp;</td>
			<h5>Already a Member? Login here&nbsp;&nbsp;&nbsp;<a href = "login.jsp"><input type="button" id="loginbtn" value="Login"></a></h5>
			<%/*/*Saving data that recieving from the servlet to variables
				String msg = (String)request.getAttribute("msg"); 
		  		if(msg != null && !msg.isEmpty()){
		  		if(msg.equals("pwdnotmatch"))
				out.println("<p style=\"color:red\"> *Passwords doesn't match.</p>");
		  		}*/%>
		  		
			<form name="form" method="post" action="insert" onsubmit="return validateForm()">
				<table>
					<tr>
						<td>First Name</td>
						<td><input type="text" name="firstName" required/></td> 
					</tr>
					<tr>
						<td>Last Name</td>
						<td><input type="text" name="lastName" required/></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="pw" id="pwd" required/></td>
					</tr>
					<tr>
						<td>Retype-Password</td>
						<td><input type="password" name="pw1" required/></td>
					</tr>
					<tr>
						<td>E-mail</td>
						<td><input type="email" name="email"required/></td>
					</tr>
					<tr>
						<td>Date of birth</td>
						<td><input type="date" name="dob" required/></td>
					</tr>
					<tr>
						<td>Permanent address</td>
						<td><input type="text" name="pAddress"required/></td>
					</tr>
					<tr>
						<td>Current address</td>
						<td><input type="text" name="cAddress"/></td>
					</tr>
					<tr>
						<td>Mobile</td>
						<td><input name="mobile" required/></td>
					</tr>
					<tr>
						<td>Telephone</td>
						<td><input name="telephone" /></td>
					</tr>
					<tr>
							<td>Interest</td>
							<td><select name="interest"><option>Science</option>
                                        <option>Education</option>
                                        <option>IT</option>
                                        <option>Science fiction</option>
                                       	<option>Drama</option>
                                       	<option>Romance</option>
                                       	<option>Mystery</option>
                                       	<option>Horror</option>   
							</select></td>
					</tr>
					
					
				</table>
				<input class="btn" type="submit" value="Submit"/>

			</form>
		</div>
	</div>
		
	<footer id="footer" style="float:right; width:100%;">
		<div class="container">
			<br><br>
			<p class="foot" style="margin-left:350px;">Copyright  © </p><p class="foot" style="font-family:'logo';"> 4Cknowledge</p><p class="foot"> , 2018 - All Right Reserved.</p>
		</div>
	</footer>
</body>
</html>