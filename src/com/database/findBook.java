package com.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class findBook
 */
@WebServlet("/findBook")
public class findBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("redirected to findBook.java");
		
		String category = request.getParameter("category");
		String language = request.getParameter("language");
		String country = request.getParameter("country");
		String year = request.getParameter("year");
		
		System.out.println("parameters recieved successfully");
		
		/*sending data to jsp example
		 * request.setAttribute("msg", "pwdnotmatch");
		request.getRequestDispatcher("/register.jsp").forward(request, response);*/
		
		Connection con = Dbconnect.connect();
		if(con==null){
			request.setAttribute("msg", "dbError");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		PreparedStatement st = null;
		ResultSet rs = null;
		
		String sql = "select bookId from books where category='"+category+"' and language='"+language+"' and country='"+country+"' and YEAR(publishDate)='"+year+"'";
	
		try {
			st = con.prepareStatement(sql);
			rs=st.executeQuery();
			System.out.println("Searching for books,(Sql executed succesfully!)");

			if(!rs.next()) {
				System.out.println("No books found, Redirecting to index.jsp");
				request.setAttribute("msg", "noBookFound");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				
			}else {
				System.out.println("Forwarding search parameters");
				request.setAttribute("category", category);
				request.setAttribute("language", language);
				request.setAttribute("country", country);
				request.setAttribute("year", year);
				
				rs.close();
				st.close();
				System.out.println("Book(s) found, redirecting to searchBook.jsp");
				request.getRequestDispatcher("searchBook.jsp").forward(request, response);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
