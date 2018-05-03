<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<%@ page import="java.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.Dbconnect" %>
<style type="text/css">
	.btn{
		margin-left:15px;
		height:80px;	
		width:180px;
		background-color:#078898;
		border:0;
		color:white;
		font-size:23px;
	}
	.bt{
		height:40px;	
		width:110px;
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
		align:left;
	}
</style>
<script>
	function validateForm()
	{
		if (confirm("Are you sure?")) {
			return true;
		} else {
			return false;
		}
	}
</script>
<title>Admin Panel</title>
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
						//this line stop the browser from caching, this page, which leads to back button issue after logout 
						response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
						String firstName = (String)session.getAttribute("firstName");
						String role = (String)session.getAttribute("role");
						String email= (String)session.getAttribute("email");
						String logStatus = (String)session.getAttribute("logStatus");
						
						if(logStatus=="false"||logStatus==""||logStatus==null){
							response.sendRedirect("login.jsp");
						}else if(firstName==null||firstName==""){
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
				<h3>Welcome to Admin Panel.</h3>
				<hr><br><br>
				<div >	  		
				<table >
					<tr class="spaceUnder">
						<td><a href = "adminMemberView.jsp"><input type="button" class="btn" value="Members"></td>
						<td><a href = "viewBooks.jsp"><input type="button" class="btn" value="Books"></td>
						<td><a href = "book.jsp"><input type="button" class="btn" value="Add Book"></td>
						<td></td>
					</tr>
				</table>
				</div>
				<br>
				<div style="margin-left:140px;">
				<table>
					<tr><form name="bookform" method="post" action="editbookdetails" >
						<td>Book ID :</td>
						<td><input type="text" name="id" required/></td>
						<td><input class="bt" type="submit" value="Edit Book"></td>
					</tr></form>
					<tr><form name="form" method="post" action="searchMember" onsubmit="return validateForm()">
						<td>Email   :</td>
						<td><input type="email" name="email"  required/></td>
						<td><input class="bt" type="submit" value="Search Member"></td>
					</tr></form>
					<tr>
						<td><%//Saving data that recieving from the servlet to variables
							String msg = (String)request.getAttribute("msg"); 
			  				if(msg != null && !msg.isEmpty()){
		  						if(msg.equals("notFound"))
									out.println("<p  style=\"color:red;font-size:13px;\">*Email not found!</p>");
		  						else if(msg.equals("deleted")){
		  							out.println("<p  style=\"color:green;font-size:13px;\">Member Deleted</p>");
		  						}else if(msg.equals("bookdeleted")){
		  							out.println("<p  style=\"color:green;font-size:13px;\">Book Removed</p>");
		  						}else if(msg.equals("booknotFound")){
		  							out.println("<p  style=\"color:red;font-size:13px;\">*Book not found!</p>");
		  						}else if(msg.equals("bookinserted")){
		  							out.println("<p  style=\"color:green;font-size:13px;\">*Book inserted!</p>");
		  						}else if(msg.equals("bookupdated")){
		  							out.println("<p  style=\"color:green;font-size:13px;\">*Book Details Updated!</p>");
		  						}else if(msg.equals("slotupdated")){
		  							out.println("<p  style=\"color:green;font-size:13px;\">*Book Slot Updated!</p>");
		  						}
		  			}%></td>
					</tr>
				</table>
				</div>
				
				<p><b>Edit Featured Books</b></p>
				<div style="margin-left:140px;">
				<form name="bookform" method="post" action="editSlot" >
				<table>
					<tr>
						<td style="text-align:left">Book ID:</td>
						<td><select style="width:158px" name="id">
						<%Connection con = Dbconnect.connect();
						PreparedStatement st = null;
						ResultSet rs = null;
						try {
								String sql = "select bookId, title from books";
								st = con.prepareStatement(sql);
								rs=st.executeQuery();
								System.out.println("Sql executed succesfully!");
				
								int bookId;
								while(rs.next()){ 
									bookId=Integer.parseInt(rs.getString("bookId"));%>
									<option value="<%=bookId%>"><%=rs.getString("title")%></option><%
									System.out.println("retrive values "+bookId+", "+rs.getString("title")+".");
								}
							}catch(Exception e){
								e.printStackTrace();
							}
							rs.close();
							st.close();
							con.close();%>
							</select></td>
					</tr>
					<tr>
						<td style="text-align:left">Slot No :</td>
						<td><select style="width:158px" name="slot" required>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
							</select></td>
						<td style="text-align:right;width:100px"><input class="bt" type="submit" value="Edit Slot"></td>
					</tr>
				</table>
				</form>
				</div>
				<br>
				<form name="logoutform" method="get" action="logout" onsubmit="return validateForm()" >
					<input style="margin-left:95px;" type="submit" class="bt" value="Logout">
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