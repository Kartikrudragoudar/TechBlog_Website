package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.tech.blog.entites.*;
import com.tech.blog.dao.UserDao;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter(); 
		
		String check = request.getParameter("check");
		
		if(check==null) {
			writer.println("Box not checked");
		}else {
			//Baki ka data yaha nikalnaa..
			
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");
			
			//Create a user object and set all data to that object...
			User user = new User(name, email, password, gender,about);
			
			
					
			
			//create a userDao object;
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user)){
				writer.println("done");
			}else {
				writer.println("ERROR");
			}
		}
		
		
	}

}
