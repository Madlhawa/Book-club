package com.database;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.database.Dbconnect;

import java.sql.*;

/**
 * Servlet implementation class insert
 */
@WebServlet(description = "insert data into servlet", urlPatterns = { "/insert" })
public class insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		
		Connection con = Dbconnect.connect();
		PreparedStatement st = null;
		
		String sql = "insert into users values('"+userName+"')";
		
		try {
			st = con.prepareStatement(sql);
			st.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
