package com.training.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.utils.SqlConnection;
import com.sun.java.swing.plaf.windows.resources.windows;

/**
 * Servlet implementation class Validate
 */
@WebServlet("/Validate")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		session.setAttribute("Location", request.getParameter("labCode"));
        Connection con = SqlConnection.getOracleConnection();
		PrintWriter out = response.getWriter();
		String sql = "Select * from PATHLAB where username = ? and password = ?";

		PreparedStatement pstmt;
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,request.getParameter("userName"));
			pstmt.setString(2,request.getParameter("password"));
			ResultSet resultset = pstmt.executeQuery();
			
			System.out.println(con);
			
			if(resultset.next()) {

				RequestDispatcher dispatcher = request.getRequestDispatcher("User.jsp");
				dispatcher.forward(request, response);
			}
			
			else {
				System.out.println("Hello wrong password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				
				dispatcher.forward(request, response);
				
				
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
		doGet(request, response);
	}

}
