<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>

	<form method="post" action="insert" >
		User name<input name="userName"/>
		<input type="submit">
	</form>



	
	<%/*
	String url = "jdbc:mysql://localhost/bookClub";
	String user = "root";
	String password = "";
	
	Connection con=null;
	
	try {
		con=DriverManager.getConnection(url, user, password);
		System.out.println("Connected!");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println("Cannot connect to DB");
		e.printStackTrace();
	}
	
	Statement st = con.createStatement();
	
	ResultSet rs;
	
	int i = st.executeUpdate("insert into users values('madhawa')");
	out.println("registered");*/
	%>
	<a href = "index.jsp">home</a>
</body>
</html>