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
 * Servlet implementation class editSlot
 */
@WebServlet("/editSlot")
public class editSlot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editSlot() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Running editSlot.java");
		
		String bookId = request.getParameter("id");
		String slotNo = request.getParameter("slot");
		
		System.out.println("Values recieved "+slotNo+", "+bookId+".");
		
		Connection con = Dbconnect.connect();
		if(con==null){
			request.setAttribute("msg", "dbError");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		PreparedStatement st = null;
	
		try {
			String sql = " UPDATE featuredBooks set bookID = '"+bookId+"' where FBID LIKE '"+slotNo+"' ";
			
			st = con.prepareStatement(sql);
			st.execute();
			st.close();
			con.close();
			System.out.println("Data updated successfully!");
			request.setAttribute("msg", "slotupdated");
			request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("Here isss " + e);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
