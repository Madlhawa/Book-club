<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="style2.css">
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
<title>Books inserting Form.</title>
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
						<%String firstName = (String)session.getAttribute("firstName");
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
				<h3>Add a Book.</h3>
				<hr><br>
				<form name="bookform" method="post" action="bookInsert" >
				<table>
				
					<tr>
						<td>Title</td>
						<td><input type="text" name="title" required/></td>
					</tr>
					<tr>
						<td>Category</td>
						<td><select name="category"><option>Science</option>
                                        <option>Education</option>
                                        <option>IT</option>
                                        <option>Science fiction</option>
                                       	<option>Drama</option>
                                       	<option>Romance</option>
                                       	<option>Mystery</option>
                                       	<option>Horror</option>          	
                            </select></td>
					</tr>
					<tr>
						<td>Keywords</td>
						<td><input type="text" name="keywords" required></td>
					</tr>
					<tr>
						<td>Author</td>
						<td><input type="text" name="author" required/></td>
					</tr>
					<tr>
						<td>Language</td>
						<td><input type="text" name="language" required></td>
					</tr>
					<tr>
						<td>Country</td>
						<td><input type="text" name="country" required/></td>
					</tr>
					<tr>
						<td>Publisher</td>
						<td><input type="text" name="publisher"required/></td>
					</tr>
					<tr>
						<td>Publish Date</td>
						<td><input type="date" name="publishDate" required /></td>
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