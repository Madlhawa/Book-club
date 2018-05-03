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
<style type="text/css">
	#title {
		color:#078898;
		font-size:19px;
	}
	tr.spaceUnder>td {
		padding-bottom: 1em;
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
	hr.split {
       display: block;
       position: relative;
       padding: 0;
       margin: 8px auto;
       height: 0;
       width: 100%;
       max-height: 0;
       font-size: 1px;
       line-height: 0;
       clear: both;
       border: none;
       border-top: 1px solid #aaaaaa;
       border-bottom: 1px solid #ffffff;
    }
    td{
    	text-align:left;
    }
    table{
    	background-color:#EBEBEB;
    }
</style>
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
<title>Edit Profile</title>
</head>
<body>
	<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	String firstName = (String)session.getAttribute("firstName");
	
	if(firstName=="null"||firstName=="na"||firstName==""){
		System.out.println(firstName);
	}
	%>
	<div id="navbar">	
	</div>
		<div class="container">		
			<ul class="navigationBar">
				<div id="logoArea">
					<li class="logo"><a href="index.jsp" style="font-family:logo;font-size:33px;">4Cknowledge</a></li>
				</div>
				<div id="navArea">
					<li class="nav"><a class="active" href="index.jsp">Home</a></li>
						<%String CfirstName = (String)session.getAttribute("firstName");
						String role = (String)session.getAttribute("role");
						String Cemail= (String)session.getAttribute("email");
						if(firstName==null||firstName==""){
							%><li class="nav"><a href="register.jsp">Login/Register</a></li><%
						}else if(role.equals("Admin")){
							%><li class="nav"><a href="adminPanel.jsp"><%=CfirstName%></a></li><%
						}else {
							%><li class="nav"><a href="searchMember?to=userProfile&email=<%= Cemail%>"><%=firstName%></a></li><%
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
			<h3>Member details.</h3>
			<hr>	
			<br>
			<%//Saving data that recieving from the servlet to variables
				String userFirstName = (String)request.getAttribute("firstName");
				String	lastName  = (String)request.getAttribute("lastName");
				String dob = (String)request.getAttribute("dob");
				String email = (String)request.getAttribute("email");
				String pAddress = (String)request.getAttribute("pAddress");
				String cAddress = (String)request.getAttribute("cAddress");
				String mobile = (String)request.getAttribute("mobile");
				String telephone = (String)request.getAttribute("telephone");
				String userRole = (String)request.getAttribute("role");
				String interest = (String)request.getAttribute("interest");
				request.setAttribute("cemail",email);
		  	%>	  		
			<form name="form" method="post" action="editProfile" onsubmit="return validateForm()">
				<table>
					<tr>
						<td>First Name</td>
						<td><input type="text" name="firstName" value="<%= userFirstName%>" required/></td> 
					</tr>
					<tr>
						<td>Last Name</td>
						<td><input type="text" name="lastName" value="<%= lastName%>" required/></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="pw" id="pwd" required></td>
					</tr>
					<tr>
						<td>Retype-Password</td>
						<td><input type="password" name="pw1" required></td>
					</tr>
					<tr>
						<td>E-mail</td>
						<td><%= email%></td>
					</tr>
					<tr>
						<td>Date of birth</td>
						<td><input type="date" name="dob" value="<%= dob%>" required></td>
					</tr>
					<tr>
						<td>Permanent address</td>
						<td><input type="text" name="pAddress" value="<%= pAddress%>" required/></td>
					</tr>
					<tr>
						<td>Current address</td>
						<td><input type="text" name="cAddress" value="<%= cAddress%>" /></td>
					</tr>
					<tr>
						<td>Mobile</td>
						<td><input name="mobile" value="<%= mobile%>" required/></td>
					</tr>
					<tr>
						<td>Telephone</td>
						<td><input name="telephone" value="<%= telephone%>"/></td>
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
				<input class="btn" type="submit" value="Submit">
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