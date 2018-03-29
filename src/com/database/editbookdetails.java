package com.database;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class editbookdetails
 */
@WebServlet("/editbookdetails")
public class editbookdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		Connection con = Dbconnect.connect();
		PreparedStatement st = null;
		Statement stat = null;
		ResultSet res = null;
		
		String id = request.getParameter("id");
		
		int num = Integer.parseInt(id);
	
		try {
		
			stat = con.createStatement();
			
			
			String sql = "select * from books where bookId='"+num+"'";
			res = stat.executeQuery(sql);

			while(res.next()){

			String a = request.getParameter("title");
			String b = request.getParameter("category");
			String c = request.getParameter("keywords");
			String d = request.getParameter("author");
			String e = request.getParameter("language");
			String f = request.getParameter("country");
			String g = request.getParameter("publisher");
			String h = request.getParameter("publishDate");


			request.setAttribute("title",a);
			request.setAttribute("category",b);
			request.setAttribute("keywords",c);
			request.setAttribute("author",d);
			request.setAttribute("language",e);
			request.setAttribute("country",f);
			request.setAttribute("publisher",g);
			request.setAttribute("publishDate",h);
			
			
			request.getRequestDispatcher("updatebookdetails.jsp").forward(request,response);
			}

						


		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
		
		
		
	}

}
