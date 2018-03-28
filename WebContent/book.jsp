<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">




<title>Books inserting Form.</title>
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
		
			
				<form name="bookform" method="post" action="bookInsert" >
				<table>
				
					<tr>
						<td>Title</td>
						<td><input type="text" name="title" required/></td>
					</tr>
					<tr>
						<td>Category</td>
						<td><input type="text" name="category" required></td>
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