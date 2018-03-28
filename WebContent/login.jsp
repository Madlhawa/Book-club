<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="style2.css">
<%@ page import="java.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<title>Login</title>
</head>
<body>
	<div id="navbar">	
	</div>
		<div class="container">		
			<ul class="navigationBar">
				<div id="logoArea">
					<li class="logo"><a href="index.html" style="font-family:logo;font-size:33px;">4Cknowledge</a></li>
				</div>
				<div id="navArea">
					<li class="nav"><a class="active" href="index.html">Home</a></li>
					<li class="nav"><a href="findAd.html">Find a Car</a></li>
					<li class="nav"><a href="login.html">Register</a></li>
					<li class="nav"><a href="postAd.html">Post your Ad</a></li>	
					<li class="nav"><a href="aboutUs.html">About Us</a></li>
					<li class="nav"><a href="contactUs.html">Contact Us</a></li>
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
			<br>
			<%//Saving data that recieving from the servlet to variables
				String msg = (String)request.getAttribute("msg"); 
		  		if(msg != null && !msg.isEmpty()){
		  			if(msg.equals("loginFaild"))
						out.println("<p  style=\"color:red;font-size:13px;\"> *Wrong Email or Password!.</p>");
		  		}
		  	%>	  		
			<form name="form" method="post" action="login">
				<table>
					<tr>
						<td>E-mail</td>
						<td><input type="email" name="email"required/></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="pw" id="pwd" required></td>
					</tr>
				</table>
				<input class="btn" type="submit" value="Login">
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