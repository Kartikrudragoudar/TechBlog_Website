package com.tech.blog.servlets;

import java.io.IOException;
import java.sql.Connection;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entites.*;
import com.tech.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		fetch username and password from request
		
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		User user  = dao.getUserByEmailAndPassword(userEmail, userPassword);
		
		if(user==null) {
			MSG msg = new MSG("Invalid Details ! try with another","error","alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("LoginPage.jsp");
			
		}else {
//			login.....
			
			HttpSession s = request.getSession();
			s.setAttribute("currentUser",user);
			response.sendRedirect("profile.jsp");
		}
	}

}
