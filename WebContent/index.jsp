<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>4C Knowledge</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div id="navbar">	
	</div>
		<div class="container">		
			<ul class="navigationBar">
				<div id="logoArea">
					<li class="logo"><a href="index.html" style="font-family:logo;font-size:33px;">4CKnowledge</a></li>
					
				</div>
				<div id="navArea">
					<li class="nav"><a class="active" href="index.html">Home</a></li>
					<li class="nav"><a href="findAd.php">Find a Car</a></li>
					<li class="nav"><a href="register.jsp">Login/Register</a></li>
					<li class="nav"><a href="postAd.html">Post your Ad</a></li>	
					<li class="nav"><a href="aboutUs.html">About Us</a></li>
					<li class="nav"><a href="contactUs.html">Contact Us</a></li>	
				</div>
			</ul>
		
			
			<br><br><br>
			<!--Header must be 1890x456 -->
			<img class="header" src="header/header.jpg" alt="Norway" width="1000" height="300">
		
			<br>
		
			<div id="sidebar">
				<h3 style="color:white;margin:5px;text-align:center;">Find the perfect car for you</h3>
				<form name="form5" method="post" action="search.php">
				<table id="form">
					<tr>
						<td><select class="search" name="make" value="Make">
						</select></td>
					</tr>
					<tr>
						<td><select class="search" name="year" value="year">
							</select></td>
						</tr>
						<tr>
							<td><select class="search" name="status">
							</select></td>
						</tr>
						<tr>
							<td>
								<select class="search" name="transmision">
								</select>
							</td>
						</tr>
				
					<tr>
						<td>
							<input class="formvalues" type="text" id="minMilage" name="minMilage" value="Min-Milage" >
							to
							<input class="formvalues" type="text" id="maxMilage" name="maxMilage" value="Max-Milage" >
						</td>
					</tr>
					
					<tr>
						<td>
							<input class="formvalues" type="text" id="minPrice" name="minPrice" value="Min-Price" >
							to
							<input class="formvalues" type="text" id="maxPrice" name="maxPrice" value="Max-Price" >
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" id="findbtn" value="Find Vehicle">
						</td>
					</tr>
				</table>
				</form>
				<img src="gif/giphy.gif" width="360px" style="text-align:center;">
			</div>
			<br>
				<div id="main">
					<div id="top">	
						<h2 class="topic" style="margin-left:100px;">Welcome to</h2>
						<h2 class="topic" id="logoh1"> 4CKnowledge</h2>
						<h4 style="text-align:center;">The  cosiest book club in the internet</h4>
						<br>
					</div>
					<br><br><br>
					<div id="col1">
					<ul id>
						<li>Enjoy our high quality service.</li>
						<li>Feel the difference.</li>
						<li>Explore the world of books.</li>
					</ul>
					<br>
					<p>Our mission is to provide users with the most comfortable and 
						memorable experience. <br><br>User satisfaction is our 
						#1 priority and that is why we strive to build long term 
						relationships with our community. <br><br>We are not a book store,
						 and we do not sell books. We are a free online community for 
						 readers with all sorts of awesome free features and free tools 
						 for book lovers. In terms of going to book stores like Amazon to 
						 get books.</p>
					
					</div>
					
					<div id="col2">
					<img src="gif/gifs.gif" height="168px">
					<img src="gif/gif3.gif" width="298.92px">
					</div>
					
				</div>
			<div id="type">
				<table style="background-color:#078898;width:1020px;height:auto;">
					<tr>
						<td class="cartypes"><img src="featuredBooks/aiBook.jpg"><br><b>Sedan</b></td>
						<td class="cartypes"><img src="featuredBooks/imagePrBook.jpg"><br><b>Coupe</b></td>
						<td class="cartypes"><img src="featuredBooks/middlewareBook.jpg"><br><b>Minivan</b></td>
						<td class="cartypes"><img src="featuredBooks/nothernLightsBook.jpg"><br><b>Cross Over</b></td>
						<td class="cartypes"><img src="featuredBooks/robotsBook.jpg"><br><b>SUV</b></td>
						<td class="cartypes"><img src="featuredBooks/aBreifHistoryBook.jpg"><br><b>Electric</b></td>
					</tr>
				</table>
			</div>
			<div id="main2">
				<br>
				<p style="margin:20px;">You’re in the right place. Tell us what titles or genres you’ve enjoyed in the
					 past, and we’ll give you surprisingly insightful recommendations. Proudly servicing
					 around the globe with unbeatable user experience. 
					Our honesty, professionalism, and dedication to our users is the key to our success, which is 
					why going the extra mile is the standard at 4CKnowledge.</p>
				<br>
			</div>
	</div>
	
	<div id="footer">
		<div class="container">
			<br><br>
			<p class="foot" style="margin-left:350px;">Copyright  © </p><p class="foot" style="font-family:'logo';"> 4CKnowledge</p><p class="foot"> , 2018 - All Right Reserved.</p>
		</div>
	</div>


</body>
</html>