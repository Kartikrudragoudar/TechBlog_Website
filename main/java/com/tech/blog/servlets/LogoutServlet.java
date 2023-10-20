package com.tech.blog.servlets;

import java.io.IOException;

import com.tech.blog.entites.MSG;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("currentUser");
		
		MSG message = new MSG("Logout Successfully","success","alert-success");
		session.setAttribute("msg", message);
		
		response.sendRedirect("LoginPage.jsp");
		
		
	}
	
	
	
	

}
