<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="style2.css">
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.database.Dbconnect" %>
<style type="text/css">
	#title {
		color:#078898;
		font-size:19px;
	}
	table{
		margin-left:50px;
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
    #main{
    	background-color:#EBEBEB;
    }
</style>
<title>Book Details</title>
</head>
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
						String userRole = (String)session.getAttribute("role");
						String email= (String)session.getAttribute("email");
						if(firstName==null||firstName==""){
							%><li class="nav"><a href="register.jsp">Login/Register</a></li><%
						}else if(userRole.equals("Admin")){
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
			<h3>Book Details</h3>
			<hr>	
			<br>
	<%
	Connection con = Dbconnect.connect();
	PreparedStatement st = null;
	ResultSet rs = null;
	
	if(con==null){%>
		<h4 style="color:red;">Sorry. Unable to connect to the database. Try again later. </h4>
	<%}
	
	try {
		String sql = "select * from books";
		st = con.prepareStatement(sql);
		rs=st.executeQuery();
		System.out.println("Sql executed succesfully!");
		
		while(rs.next()){ 
			String bookId=rs.getString("bookId");%>
				<table >
					<tr>
						<td><p id="title"><b><%=rs.getString("title") %></b></p></td>
					</tr>
				</table>
				<table >
					<tr>
						<td>Book ID :</td>
						<td><b><%=bookId%></b></td>
					</tr>
					<tr >
						<td >Category :</td>
						<td style="margin-left:0px;"><b><%=rs.getString("category") %></b></td>
						<td>Author :</td>
						<td><b><%=rs.getString("author") %></b></td>
					</tr>
					<tr >
						<td>language :</td>
						<td style="text-align:left;"><b><%=rs.getString("language") %></b></td>
						<td>Country :</td>
						<td style="margin-left:0px;"><b><%=rs.getString("country")%></b></td>
					</tr>
					<tr >
					</tr>
					<tr >
						<td>Publisher :</td>
						<td style="text-align:left;"><b><%=rs.getString("Publisher") %></b></td>
						<td>Published Date :</td>
						<td><b><%=rs.getString("publishDate")%></b></td>
					</tr>
					<tr >
				</table>
				<table>
						<td>Keywords :</td>
						<td style="text-align:left;"><b><%=rs.getString("keywords") %></b></td>
					</tr>
					<tr>
					<%if(userRole.equals("Admin")){
						%><td><a href = "editbookdetails?id=<%=bookId%>"><input type="button" class="bt" value="Edit Book"></td><%
						%><td><a href = "removeBook?id=<%=bookId%>"><input type="button" class="bt" value="Delete Book"></td><%
					}
					%></tr>
					</table>  
					<hr class="split"><%
			}%>
		<%}catch(Exception e){
    		e.printStackTrace();
    	}%>
		</div>
	</div>
		
	
</body>


</html>

