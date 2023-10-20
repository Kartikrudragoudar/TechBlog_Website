package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entites.MSG;
import com.tech.blog.entites.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		Fetch All Data
		String user_email = request.getParameter("user_mail");
		String user_name = request.getParameter("user_name");
		String user_password = request.getParameter("user_password");
		String user_about = request.getParameter("user_about");
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();
		
		//get the user from the session
		
		HttpSession s = request.getSession();
		User user = (User)s.getAttribute("currentUser");
		user.setEmail(user_email);
		user.setName(user_name);
		user.setPassword(user_password);
		user.setAbout(user_about);
		String oldFile = user.getProfile();
		System.out.println(oldFile);
		user.setProfile(imageName);
		
		//update database.....
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		boolean ans  = userDao.updateUser(user);
		
		if(ans) {
		    String path = request.getSession().getServletContext().getRealPath("/")+"Pics"+File.separator+user.getProfile();
		 
//		    delete code
		    String pathOldfile = request.getServletContext().getRealPath("/")+"Pics"+File.separator+oldFile;
		    System.out.println(pathOldfile);
		    if(!pathOldfile.equals("default.png")) {
		    Helper.deleteFile(pathOldfile);
		    }
		    
		    if(Helper.saveFile(part.getInputStream(), path)) {
		    	MSG msg = new MSG("Profile details updated","success","alert-success");
				s.setAttribute("msg", msg);
		    }else {
		    	MSG msg = new MSG("Something Went Wrong","error","alert-danger");
				s.setAttribute("msg", msg);
		    }
		}else {
			MSG msg = new MSG("Something Went Wrong","error","alert-danger");
			s.setAttribute("msg", msg);
		}
		    response.sendRedirect("profile.jsp");
	}

}
