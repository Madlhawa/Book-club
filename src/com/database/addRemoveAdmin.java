package com.database;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.database.Dbconnect;

/**
 * Servlet implementation class addRemoveAdmin
 */
@WebServlet("/addRemoveAdmin")
public class addRemoveAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addRemoveAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("running- addRemoveAdmin.java");
		String to= request.getParameter("to");
		String cmd= request.getParameter("cmd");
		String email=request.getParameter("email");
		System.out.println("Get values: to="+to+", cmd="+cmd+", email="+email);
		
		Connection con = Dbconnect.connect();
		if(con==null){
			request.setAttribute("msg", "dbError");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		PreparedStatement st = null;
		String sql = null;
		
		
		if(cmd.equals("make")) {
			sql = "update users set role='cAdmin' where email like '"+email+"'";
		}else {
			sql = "update users set role='member' where email like '"+email+"'";
		}
		try {
			st = con.prepareStatement(sql);
			st.execute();
			System.out.println("Role updated successfully!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(to=="editMember") {
			ResultSet rs = null;
			
			sql = "select * from users where email like '"+email+"'";
			try {
				st = con.prepareStatement(sql);
				rs=st.executeQuery();
				System.out.println("Sql executed succesfully!");

				if(!rs.next()) {
					System.out.println("wrong username and password");
					
				}else {
					System.out.println("member found");
					request.setAttribute("firstName",rs.getString("firstName"));
					request.setAttribute("lastName",rs.getString("lastName"));
					request.setAttribute("dob",rs.getString("dob"));
					request.setAttribute("email",email);
					request.setAttribute("pAddress",rs.getString("pAddress"));
					request.setAttribute("cAddress",rs.getString("cAddress"));
					request.setAttribute("mobile",rs.getString("mobile"));
					request.setAttribute("telephone",rs.getString("telephone"));
					request.setAttribute("role",rs.getString("role"));
					request.setAttribute("interest",rs.getString("interest"));
					
					rs.close();
					request.getRequestDispatcher("editMember.jsp").forward(request, response);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("adminMemberView.jsp");
		}
		try {
			st.close();
			con.close();
		} catch (SQLException ignore) {}
	}
}
