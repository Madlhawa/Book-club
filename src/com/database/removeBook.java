package com.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class removeBook
 */
@WebServlet("/removeBook")
public class removeBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		System.out.println("get value: email="+id);
		Connection con = Dbconnect.connect();
		PreparedStatement st = null;
	
		try {
			String sql = "DELETE FROM books WHERE bookId='"+id+"'";
			st = con.prepareStatement(sql);
			st.execute();
			System.out.println("Book removed successfully!");
			request.setAttribute("msg", "bookdeleted");
			request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("msg", "booknotFound");
			request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
		}
	}

}
