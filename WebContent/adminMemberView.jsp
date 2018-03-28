<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.database.Dbconnect" %>
<title>Insert title here</title>
</head>
<body></body>

<form method="post">
	<table border="2">
	<tr>
		<td>Name</td>
		<td>Email</td>
		<td>Mobile</td>
		<td>DOB</td>
	</tr>
	<%
	Connection con = Dbconnect.connect();
	PreparedStatement st = null;
	ResultSet rs = null;

	try {
		String sql = "select firstName,email,mobile,dob from users";
		st = con.prepareStatement(sql);
		rs=st.executeQuery();
		System.out.println("Sql executed succesfully!");
		
		while(rs.next()){%>
			<tr>
				<td><%=rs.getString("firstName") %></td>
				<td><%=rs.getString("email") %></td>
				<td><%=rs.getString("mobile") %></td>
				<td><%=rs.getString("dob") %></td>
			</tr>
		<%}%>
		
	</table><%	
    }catch(Exception e){
    	e.printStackTrace();
    }%>
</form>
</html>