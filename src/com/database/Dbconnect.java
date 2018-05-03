package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnect {
	public static Connection connect() {
		System.out.println("Running Dbconnect.java");
		System.out.println("Searching for driver");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver found!");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver not found!");
			System.out.println(e);
		}
		
		String url = "jdbc:mysql://mysql8.db4free.net:3306/bookclub?autoReconnect=true&useSSL=false";
		String user = "madhawa";
		String password = "a788180c";  
		
		/*String url2 = "jdbc:mysql://databases-auth.000webhost.com:3306/id3143473_automart";
		String user2 = "id3143473_19950506";
		String password2 = "powershot";*/
		
		Connection con=null;
		
		try {
			System.out.println("Connecting to db4free database");
			con=DriverManager.getConnection(url, user, password);
			System.out.println("Connected to db4free database!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Cannot connect to db4free");
			System.out.println("No books found, Redirecting to index.jsp");
			e.printStackTrace();
			/*try {
				System.out.println("Connecting to freesqldatabase database");
				con=DriverManager.getConnection(url2, user2, password2);
				System.out.println("Connected to freesqldatabase database!");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("Cannot connect to freesqldatabase");
				e1.printStackTrace();
			}*/
		}
		return con;		
	}

}
