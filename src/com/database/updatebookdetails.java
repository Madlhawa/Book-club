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
	public int ss = 0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		ss = Integer.parseInt(id);
		System.out.println("POST parameter: id="+id);
		
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String keywords = request.getParameter("keywords");
		String author = request.getParameter("author");
		String language = request.getParameter("language");
		String country = request.getParameter("country");
		String publisher = request.getParameter("publisher");
		String publishDate = request.getParameter("publishDate");
		
		Connection con = Dbconnect.connect();
		if(con==null){
			request.setAttribute("msg", "dbError");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		PreparedStatement st = null;
	
		try {
			Date dateFormat = new SimpleDateFormat("yyyy-MM-dd").parse(publishDate);
			java.sql.Date dob = new java.sql.Date(dateFormat.getTime());
			
			String sql = " UPDATE books set title = '"+title+"',category = '"+category+"', keywords = '"+keywords+"', author = '"+author+"', language = '"+language+"', country = '"+country+"', publisher = '"+publisher+"',publishDate = '"+dob+"' where bookId LIKE '"+ss+"' ";
			
			st = con.prepareStatement(sql);
			st.execute();
			st.close();
			con.close();
			System.out.println("Data updated successfully!");
			request.setAttribute("msg", "bookupdated");
			request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("Here isss " + e);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
