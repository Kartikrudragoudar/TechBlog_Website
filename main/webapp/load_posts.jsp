<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.entites.Posts" %>
<%@page import="java.util.*" %>

<div class="row">
						
	<%	
		Thread.sleep(1000);
		PostDao d = new PostDao(ConnectionProvider.getConnection());
	
		int cid = Integer.parseInt(request.getParameter("cId"));
		List<Posts> post = null;
		if(cid==0){
			post = d.getAllPosts();
		}else{
			post = d.getPostByCatId(cid);
		}
		
		if(post.size()==0){
			out.println("<h3 class='display-3 text-center'>No Posts In This Category...</h3>");
			return;
		}
		
		for(Posts p:post){
	%>
			<div class="col-md-6 mt-2">	  
				<div class="card"> 
				<img class="card-img-top" alt="Card image cap" src="blog_pics/<%= p.getpPic()%>">
					<div class="card-body">
						<b><%=p.getpTitle()%></b>
						<p><%=p.getpContent() %></p>
					</div>
					<div>
						<div class="card-footer text-center" style="background:#f00f3c">
							<a href="show_blog_page.jsp?post_id=<%= p.getpID() %>" class="btn btn-outline-light btn-sm" style="margin-right: 12px">Read More...</a>
							<a href="#" class="btn btn-outline-light btn-sm" style="margin-right: 12px"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
							<a href="#" class="btn btn-outline-light btn-sm" style="margin-right: 12px"><i class="fa fa-commenting-o"></i><span>20</span></a>
						</div>
					</div>
				</div>
			</div>
			<% 
		}
			%>
</div>
