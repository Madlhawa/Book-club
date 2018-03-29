package com.database;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class updatebookdetails
 */
@WebServlet("/updatebookdetails")
public class updatebookdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String keywords = request.getParameter("keywords");
		String author = request.getParameter("author");
		String language = request.getParameter("language");
		String country = request.getParameter("country");
		String publisher = request.getParameter("publisher");
		String publishDate = request.getParameter("publishDate");
		
		String id = request.getParameter("id");
		
		int num = Integer.parseInt(id);

		Connection con = Dbconnect.connect();
		PreparedStatement st = null;
	
		try {

			Date dateFormat = new SimpleDateFormat("yyyy-MM-dd").parse(publishDate);
			java.sql.Date dob = new java.sql.Date(dateFormat.getTime());
		
			
		
			String sql = " update books set title = '"+title+"',category = '"+category+"',keywords = '"+keywords+"',author = '"+author+"',language = '"+language+"',country = '"+country+"',publisher = '"+publisher+"',publishDate = '"+dob+"' where bookId='"+num+"' ";
			st = con.prepareStatement(sql);
			st.execute();
			System.out.println("Data updated successfully!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
		
		
		
		
		
	}

}