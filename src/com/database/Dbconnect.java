package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnect {
	public static Connection connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver found!");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver not found!");
			System.out.println(e);
		}
		
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
		return con;		
	}

}
