package com.database;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.database.Dbconnect;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String pw = request.getParameter("pw");
		String dateFromForm = request.getParameter("dob");
		String email = request.getParameter("email");
		String pAddress = request.getParameter("pAddress");
		String cAddress = request.getParameter("cAddress");
		String mobile = request.getParameter("mobile");
		String telephone = request.getParameter("telephone");
		String role = request.getParameter("role");
		String interest = request.getParameter("interest");
		
		/*sending data to jsp example
		 * request.setAttribute("msg", "pwdnotmatch");
		request.getRequestDispatcher("/register.jsp").forward(request, response);*/
		
		Connection con = Dbconnect.connect();
		PreparedStatement st = null;
	
		try {
			Date dateFormat = new SimpleDateFormat("yyyy-MM-dd").parse(dateFromForm);
			java.sql.Date dob = new java.sql.Date(dateFormat.getTime());
			
			String sql = "insert into users values('"+firstName+"','"+lastName+"','"+dob+"','"+email+"','"+pw+"','"+pAddress+"','"+cAddress+"','"+mobile+"','"+telephone+"','"+role+"','"+interest+"')";
			st = con.prepareStatement(sql);
			st.execute();
			System.out.println("Data inserted successfully!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
