<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import = "java.io.IOException" %>
<%@page import = "javax.servlet.ServletException" %>
<%@page import = "javax.servlet.annotation.WebServlet" %>
<%@page import = "javax.servlet.http.HttpServlet" %>
<%@page import = "javax.servlet.http.HttpServletRequest" %>
<%@page import = "javax.servlet.http.HttpServletResponse" %>
<%@page import = "com.database.Dbconnect" %>
<%@page import = "java.sql.*" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.ResultSet" %>
<%@page import = "java.sql.Statement" %>    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Edit books</title>
</head>
<body>

<%

Connection con = Dbconnect.connect();
PreparedStatement st = null;
Statement stat = null;
ResultSet res = null;

%>


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
			
			
			<form name="bookform" method="post" action="" >
			<%
			stat = con.createStatement();
			
			int num = Integer.parseInt(request.getParameter("u"));
			String sql = "select * from books where id='"+num+"'";
			res = stat.executeQuery(sql);
			
			while(res.next()){
			
			%>
			
				<table>
				
					<tr>
						<td>Id</td>
						<td><input type="hidden" name="id" value='<%=res.getString("id") %>' /></td>
					</tr>
				
					<tr>
						<td>Title</td>
						<td><input type="text" name="title" value='<%=res.getString("title") %>'/></td>
					</tr>
					<tr>
						<td>Category</td>
						<td><input type="text" name="category" value='<%=res.getString("category") %>'/></td>
					</tr>
					<tr>
						<td>Keywords</td>
						<td><input type="text" name="keywords" value='<%=res.getString("keywords") %>'/></td>
					</tr>
					<tr>
						<td>Author</td>
						<td><input type="text" name="author" value='<%=res.getString("author") %>'/></td>
					</tr>
					<tr>
						<td>Language</td>
						<td><input type="text" name="language" value='<%=res.getString("language") %>'/></td>
					</tr>
					<tr>
						<td>Country</td>
						<td><input type="text" name="country" value='<%=res.getString("country") %>'/></td>
					</tr>
					<tr>
						<td>Publisher</td>
						<td><input type="text" name="publisher" value='<%=res.getString("publisher") %>'/></td>
					</tr>
					<tr>
						<td>Publish Date</td>
						<td><input type="date" name="publishDate" value='<%=res.getString("publishDate") %>'/></td>
					</tr>
				
				</table>
				<%
			       }
				%>
				
				<input class="btn" type="submit" value="Update/Edit">
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

<%

String a = request.getParameter("id");
String b = request.getParameter("title");
String c = request.getParameter("category");
String d = request.getParameter("keywords");
String e = request.getParameter("author");
String f = request.getParameter("language");
String g = request.getParameter("country");
String h = request.getParameter("publisher");
String i = request.getParameter("publishDate");

if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null && h!=null && i!=null){

	String query = "update books set title=?, category=?, keywords=?, author=?, language=?, country=?, publisher=?, publishDate=? where id='"+a+"'";
	st = con.prepareStatement(query);
	st.setString(1,b);
	st.setString(2,c);
	st.setString(3,d);
	st.setString(4,e);
	st.setString(5,f);
	st.setString(6,g);
	st.setString(7,h);
	st.setString(8,i);
	st.executeUpdate();
	response.sendRedirect("index.jsp");
	
}








%>















