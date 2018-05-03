package com.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class editProfile
 */
@WebServlet("/editProfile")
public class editProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String pw = request.getParameter("pw");
		String dateFromForm = request.getParameter("dob");
		String pAddress = request.getParameter("pAddress");
		String cAddress = request.getParameter("cAddress");
		String mobile = request.getParameter("mobile");
		String telephone = request.getParameter("telephone");
		String interest = request.getParameter("interest");
		
		String email = request.getSession(false).getAttribute("email").toString();
		System.out.println("Current user emai:"+email);
		
		/*sending data to jsp example
		 * request.setAttribute("msg", "pwdnotmatch");
		request.getRequestDispatcher("/register.jsp").forward(request, response);*/
		
		Connection con = Dbconnect.connect();
		if(con==null){
			request.setAttribute("msg", "dbError");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		PreparedStatement st = null;
		
	
		try {
			Date dateFormat = new SimpleDateFormat("yyyy-MM-dd").parse(dateFromForm);
			java.sql.Date dob = new java.sql.Date(dateFormat.getTime());
			
			String sql = "update users set firstName='"+firstName+"',lastName='"+lastName+"',dob='"+dob+"',password='"+pw+"',pAddress='"+pAddress+"',cAddress='"+cAddress+"',mobile='"+mobile+"',telephone='"+telephone+"',interest='"+interest+"'where email like '"+email+"'";
			st = con.prepareStatement(sql);
			st.execute();
			System.out.println("Data inserted successfully!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			st.close();
			con.close();
		} catch (SQLException ignore) {}
		response.sendRedirect("searchMember?to=userProfileUpdated&email="+email);
	}
}
