package com.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		Connection con = Dbconnect.connect();
		PreparedStatement st = null;
		ResultSet rs=null;
		String firstName=null;
		String role=null;
		
		try {			
			String sql = "select password, firstName, role from users where email='"+email+"' and password='"+pw+"'";
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			if(!rs.next()) {
				System.out.println("wrong username and password");
				request.setAttribute("msg", "loginFaild");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
			}else {
				System.out.println("Username and password match!");
				
				firstName=rs.getString("firstName");
				role=rs.getString("role");
				
				HttpSession session=request.getSession();  
				session.setAttribute("email",email);
				session.setAttribute("firstName",firstName);
				session.setAttribute("role",role);
				
				if(role.equals("admin")) {
					response.sendRedirect("adminPanel.jsp"); 
				}else {
					response.sendRedirect("index.jsp");
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

/*sending data to jsp example
 * request.setAttribute("msg", "pwdnotmatch");
request.getRequestDispatcher("/register.jsp").forward(request, response);*/