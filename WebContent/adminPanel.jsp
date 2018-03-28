<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<%@ page import="java.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<style type="text/css">
	.btn{
		margin-left:95px;
		height:80px;	
		width:180px;
		background-color:#078898;
		border:0;
		color:white;
		font-size:23px;
	}
	.bt{
		height:40px;	
		width:100px;
		background-color:#078898;
		border:0;
		color:white;
	}
	.btn:hover,.bt:hover{
		background-color:silver;
		color:#078898;
	}
	tr.spaceUnder>td {
		padding-bottom: 1em;
	}
</style>
<title>Login</title>
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
					<%	String firstName = (String)session.getAttribute("firstName");
						if(firstName==null||firstName==""){
							%><li class="nav"><a href="register.jsp">Login/Register</a></li><%
						}else{
							%><li class="nav"><a href="register.jsp"><%=firstName%></a></li><%
						}  %>
					<li class="nav"><a href="findAd.php">Find a Car</a></li>
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
				<h3>Welcome to Admin Panel.</h3>
				<hr>	<br><br>
				<%//Saving data that recieving from the servlet to variables
					String msg = (String)request.getAttribute("msg"); 
			  		if(msg != null && !msg.isEmpty()){
		  				if(msg.equals("loginFaild"))
							out.println("<p  style=\"color:red;font-size:13px;\"> *Wrong Email or Password!.</p>");
		  			}
		  		%>	  		
				<table>
					<tr class="spaceUnder">
						<td><a href = "adminMemberView.jsp"><input type="button" class="btn" value="Members"></td>
						<td><a href = "adminViewBooks.jsp"><input type="button" class="btn" value="Books"></td>
						<td></td>
					</tr>
				</table>
				<br>
				<div style="margin-left:140px;">
				<table>
					<tr>
						<td>Book ID :</td>
						<td><input type="text" name="email"  required/></td>
						<td><a href = "editBook"><input type="button" class="bt" value="Edit Book"></td>
					</tr>
					<tr>
						<td>Email   :</td>
						<td><input type="text" name="email"  required/></td>
						<td><a href = "editMember.jsp"><input type="button" class="bt" value="Edit Member"></td>
					</tr>
				</table>
				</div>
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