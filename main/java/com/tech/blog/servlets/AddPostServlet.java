package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entites.Posts;
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
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		
		int Cid = Integer.parseInt(request.getParameter("Cid"));
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		String pCode = request.getParameter("pCode");
		Part part = request.getPart("pic");
		
		// getting currentUser id
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("currentUser");
		
		Posts post = new Posts(pTitle, pContent, pCode, part.getSubmittedFileName(),null,Cid,user.getId());
		PostDao dao = new PostDao(ConnectionProvider.getConnection());
		if(dao.savePost(post)) {
			 String path = request.getServletContext().getRealPath("/")+"blog_pics"+File.separator+part.getSubmittedFileName();
			 Helper.saveFile(part.getInputStream(), path);
			 writer.println("Done!..");
		}else {
			writer.println("Error...");
		}
	}

}
