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
 * Servlet implementation class searchMember
 */
@WebServlet("/searchMember")
public class searchMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String to= request.getParameter("to");
		String email=request.getParameter("email");
		System.out.println("GEt values: "+to+","+email);
		Connection con = Dbconnect.connect();
		PreparedStatement st = null;
		ResultSet rs = null;
		
		String sql = "select * from users where email like '"+email+"'";
		try {
			st = con.prepareStatement(sql);
			rs=st.executeQuery();
			System.out.println("Sql executed succesfully!");

			if(!rs.next()) {
				System.out.println("wrong username and password");
				request.setAttribute("msg", "notFound");
				request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
				
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
				
				if(to==null||to=="") {
					request.getRequestDispatcher("editMember.jsp").forward(request, response);
					
				}else if(to.equals("editProfile")){
					request.getRequestDispatcher("editProfile.jsp").forward(request, response);
					System.out.println("redirecting to: "+to);
					
				}else if(to.equals("userProfileUpdated")) {
					request.setAttribute("msg","updated");
					request.getRequestDispatcher("userProfile.jsp").forward(request, response);
					System.out.println("redirecting to: "+to);
					
				}else {
					request.getRequestDispatcher("userProfile.jsp").forward(request, response);
					System.out.println("redirecting to: "+to);
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		
		Connection con = Dbconnect.connect();
		PreparedStatement st = null;
		ResultSet rs = null;
		
		String sql = "select * from users where email like '"+email+"'";
		try {
			st = con.prepareStatement(sql);
			rs=st.executeQuery();
			System.out.println("Sql executed succesfully!");

			if(!rs.next()) {
				System.out.println("wrong username and password");
				request.setAttribute("msg", "notFound");
				request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
				
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
				
				request.getRequestDispatcher("editMember.jsp").forward(request, response);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
