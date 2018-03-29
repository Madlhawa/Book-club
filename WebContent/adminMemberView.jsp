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
<title>Insert title here</title>
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
					<%	String firstName = (String)session.getAttribute("firstName");
					String userRole = (String)session.getAttribute("role");
					if(firstName==null||firstName==""){
						%><li class="nav"><a href="register.jsp">Login/Register</a></li><%
					}else if(userRole.equals("Admin")){
						%><li class="nav"><a href="adminPanel.jsp"><%=firstName%></a></li><%
					}else{
						%><li class="nav"><a href="profile.jsp"><%=firstName%></a></li><%
					}%>
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
			<h3>Member Details</h3>
			<hr>	
			<br>
			<form method="post">
	<table>
	<%
	Connection con = Dbconnect.connect();
	PreparedStatement st = null;
	ResultSet rs = null;

	try {
		String sql = "select * from users";
		st = con.prepareStatement(sql);
		rs=st.executeQuery();
		System.out.println("Sql executed succesfully!");
		
		while(rs.next()){ 
			String email=rs.getString("email");
			String role=rs.getString("role");
			
			if(userRole.equals("cAdmin")){
				if(role.equals("member")){%>
				<table>
					<tr>
						<td><p id="title"><b><%=rs.getString("firstName") %></b></p></td>
						<td style="text-align:left;'"><p id="title"><b><%=rs.getString("lastName") %></b></p></td>
					</tr>
					<tr>
						<td>Email :</td>
						<td><b><%=email%></b></td>
					</tr>
					<tr >
						<td>Mobile :</td>
						<td style="text-align:left;"><b><%=rs.getString("mobile") %></b></td>
						<td>Birth Date :</td>
						<td><b><%=rs.getString("dob") %></b></td>
					</tr>
					<tr >
						<td>Telephone :</td>
						<td style="text-align:left;"><b><%=rs.getString("telephone") %></b></td>
						<td>Role :</td>
						<td><b><%=role%></b></td>
					</tr>
					<tr >
				</table>
				<table>
						<td>Current Address :</td>
						<td style="text-align:left;"><b><%=rs.getString("cAddress") %></b></td>
					</tr>
					<tr >
						<td>Perm. Address :</td>
						<td style="text-align:left;"><b><%=rs.getString("pAddress") %></b></td>
					</tr>
					<tr >
						<td>Interest :</td>
						<td style="text-align:left;"><b><%=rs.getString("interest") %></b></td>
					</tr>
					<tr>
					<%if(userRole.equals("Admin")){
				if(role.equals("cAdmin")){
					%><td><a href = "addRemoveAdmin?cmd=remove&email=<%=email%>"><input type="button" class="bt" value="Make Member"></td><%
				}else if(!role.equals("cAdmin")&&!role.equals("Admin")){
					%><td><a href = "addRemoveAdmin?cmd=make&email=<%=email%>"><input type="button" class="bt" value="Make Admin"></td><%
				}
				if(!role.equals("Admin")){
					%><td><a href = "removeMember?email=<%=email%>"><input type="button" class="bt" value="Ban"></td><%
				}
			}%>
			
			</tr>
		</table>  
		<hr class="split">
					<%} %>
			<%} else{%>
				<table>
					<tr>
						<td><p id="title"><b><%=rs.getString("firstName") %></b></p></td>
						<td style="text-align:left;'"><p id="title"><b><%=rs.getString("lastName") %></b></p></td>
					</tr>
					<tr>
						<td>Email :</td>
						<td><b><%=email%></b></td>
					</tr>
					<tr >
						<td>Mobile :</td>
						<td style="text-align:left;"><b><%=rs.getString("mobile") %></b></td>
						<td>Birth Date :</td>
						<td><b><%=rs.getString("dob") %></b></td>
					</tr>
					<tr >
						<td>Telephone :</td>
						<td style="text-align:left;"><b><%=rs.getString("telephone") %></b></td>
						<td>Role :</td>
						<td><b><%=role%></b></td>
					</tr>
					<tr >
				</table>
				<table>
						<td>Current Address :</td>
						<td style="text-align:left;"><b><%=rs.getString("cAddress") %></b></td>
					</tr>
					<tr >
						<td>Perm. Address :</td>
						<td style="text-align:left;"><b><%=rs.getString("pAddress") %></b></td>
					</tr>
					<tr >
						<td>Interest :</td>
						<td style="text-align:left;"><b><%=rs.getString("interest") %></b></td>
					</tr>
					<tr>
					<%if(userRole.equals("Admin")){
				if(role.equals("cAdmin")){
					%><td><a href = "addRemoveAdmin?cmd=remove&email=<%=email%>"><input type="button" class="bt" value="Make Member"></td><%
				}else if(!role.equals("cAdmin")&&!role.equals("Admin")){
					%><td><a href = "addRemoveAdmin?cmd=make&email=<%=email%>"><input type="button" class="bt" value="Make Admin"></td><%
				}
				if(!role.equals("Admin")){
					%><td><a href = "removeMember?email=<%=email%>"><input type="button" class="bt" value="Ban"></td><%
				}
			}%>
			</tr>
		</table>  
		<hr class="split">
		<%}%>
		<%}
    }catch(Exception e){
    	e.printStackTrace();
    }%>
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






