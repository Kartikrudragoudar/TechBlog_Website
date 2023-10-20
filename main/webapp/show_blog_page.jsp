<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entites.*" %>    
<%@page import="com.tech.blog.dao.*" %> 
<%@page import="com.tech.blog.helper.*" %> 
<%@page import="java.util.*" %>

<%

	User user = (User)session.getAttribute("currentUser");
	if(user == null){
		response.sendRedirect("LoginPage.jsp");
	}
%>

<%
		int postId = Integer.parseInt(request.getParameter("post_id"));
		PostDao d = new PostDao(ConnectionProvider.getConnection());
		Posts p = d.getPostByPostId(postId);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= p.getpTitle() %></title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity ="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="CSS\Mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	.banner-background{
		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 70%, 61% 89%, 12% 86%, 0% 70%, 0 0);
	}
	.post-title{
		font-weight:100;
		font-size:30px
	}
	.post-content{
		font-size:25px;
		font-weight:100px;
	}
	.post-date{
		font-style:italic;
		font-weight:bold;
	}
	.post-user-info{
		font-size:20px;
	}
	.row-user{
		border:1px solid #e2e2e2;
		padding-top:15px;
	}
	body{
		background: url();
		background-size: cover;
		background-attachment: fixed;
	}
</style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:yellow"> 
  <a class="navbar-brand" style="color:red" href="index.jsp"> <span><lord-icon
    src="https://cdn.lordicon.com/slduhdil.json"
    trigger="hover"
    colors="primary:#f00f3c"
    style="width:25px;height:25px;top:5px">
</lord-icon>
</span> Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon">
    	<i class="fa fa-bars" style="background: blue;"></i>
    </span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" style="color:red" href="profile.jsp"> <span class="fa fa-bell" style="color:red;"></span>LearnCode with Kartik<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" style="color:red" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="fa fa-cart-arrow-down"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Languages</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structures</a>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#" style="color:red"><span class="fa fa-phone"></span> Contact</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#" style="color:red" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>Do Post</a>
      </li>
      
    </ul>
 	<ul class="navbar-nav mr-right">
 		      <li class="nav-item">
       				 <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal" style="color:red"><span class="fa fa-user-circle"></span><%= user.getName() %></a>
      		</li>
      		<li class="nav-item">
       				 <a class="nav-link" href="LogoutServlet" style="color:red"><span class="fa fa-user-plus"></span>Logout</a>
      		</li>
 	</ul>   
  </div>
</nav>
									<!-- End Of NavBar -->	
	
								<!--  main content of the body -->
			<div class="container">
				<div class="row">
					<div class="col-md-8 offset-md-2">
						<div class="card">
							<div class="card-header text-white" style="background:#f00f3c">
								<h4 class="post-title"><%= p.getpTitle() %></h4>
								
							</div>
							<div class="card-body">
								<img class="card-img-top my-2" alt="Card image cap" src="blog_pics/<%= p.getpPic() %>">
								<p class="post-content"><%= p.getpContent() %></p>
								<div class="row my-3 row-user">
									<div class="col-md-8">
									<%
										UserDao ud = new UserDao(ConnectionProvider.getConnection());
										
									%>
										<p class="post-user-info"><a href="#!"><%=ud.getUserByUserId(p.getUserId()).getName()%></a> has posted; </p>
									</div>
									<div class="col-md-4">
										<p class="post-date"><%= p.getpDate() %></p>
									</div>
								</div>
								<br>
								<br>
								<div class="post-code">
										<pre><%= p.getpCode() %></pre>	
								</div>
							</div>
								<div class="card-footer" style="background:#f00f3c">
									<a href="#" class="btn btn-outline-light btn-sm" style="margin-right: 12px"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
									<a href="#" class="btn btn-outline-light btn-sm" style="margin-right: 12px"><i class="fa fa-commenting-o"></i><span>20</span></a>
								</div>
						</div>
					</div>
				</div>
			</div>



							<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background: #f00f3c; text: white">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
        	<img src="<%= user.getProfile() %>" class="img-fluid" style="border-radius:50%;max-width:200px">
        	<h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
        	
        					<!-- Details -->
		  <div id="profile_details">	        
        	<table class="table">
  				<tbody>
    				<tr>
      					<th scope="row">ID:</th>
      					<td><%= user.getId() %></td>
    				</tr>
    				<tr>
      					<th scope="row">Email:</th>
      					<td><%=user.getEmail() %></td>
    				</tr>
   					<tr>
     					<th scope="row">Gender:</th>
     					<td><%= user.getGender() %></td>
    				</tr>
    				<tr>
     					<th scope="row">Status:</th>
     					<td><%= user.getAbout() %></td>
    				</tr>
    				<tr>
     					<th scope="row">Registered On:</th>
     					<td><%= user.getRdate().toString() %></td>
    				</tr>
  				</tbody>
			</table>
		</div>	
		
							<!-- profile_Edit -->
		<div id="profile_edit" style="display:none">
			<h3>Please Edit Carefully</h3>
			<form action="EditServlet" method="post" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<td>ID: </td>
						<td><%= user.getId() %></td>
					</tr>
					<tr>
						<td>Email: </td>
						<td><input type="email" class="form-control" name="user_mail" value="<%= user.getEmail() %>" ></td>
					</tr>
					<tr>
						<td>Name: </td>
						<td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>" ></td>
					</tr>
					<tr>
						<td>Password: </td>
						<td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>" ></td>
					</tr>
					<tr>
						<td>Gender: </td>
						<td><%= user.getGender().toUpperCase() %></td>
					</tr>
					<tr>
						<td>About: </td>
						<td>
							<textarea rows="3" cols="40" name="user_about"><%= user.getAbout() %></textarea>
						</td>
					</tr>
					<tr>
						<td>New Profile: </td>
						<td>
							<input type="file" name="image" class="form-control">
						</td>
					</tr>
				</table>
				<div class="container">
					<button type="submit" class="btn btn-outline-primary">Save</button>
				</div>
			
			</form>
		
		
		
		</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="edit-profile-button">EDIT</button>
      </div>
    </div>
  </div>
</div>

							<!-- End Of Profile Modal -->
							
							<!-- Add post Modal -->
								<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="AddPostServlet" method="post" id="add-post-form">
        	<div class="form-group">
        		<select class="form-control" name="Cid">
        			<option selected disabled>----Select Category----</option>
        			<%
        				PostDao post = new PostDao(ConnectionProvider.getConnection());
        				ArrayList<Categories> list = post.getAllCategories();
        				for(Categories c:list){
        			%>
        			<option value="<%=c.getcId() %>"><%= c.getcName() %></option>
        			<%
        				}
        			%>
        		</select>
        	</div>
        	<div class="form-group">
        		<input name ="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
        		<br>
        	</div>
        	<div class="form-group">
        		<textarea name="pContent" rows="" cols="60" class="from-control" placeholder="Enter your context" style="height:200px"></textarea>
        	</div>
        	<div class="form-group">
        		<textarea name="pCode" rows="" cols="60" class="from-control" placeholder="Enter your program (if any)" style="height:200px"></textarea>
        	</div>
        	<div class="form-group">
        		<label>Select your pic...</label>
        		<br>
        		<input type="file" placeholder="Enter your pic..." name="pic"/>
        	</div>
        	
        	<div class="container text-center">
        		<button type="submit" class="btn btn-outline-primary">Post</button>
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>
					
					
							<!-- End Add Post Modal -->
							
								<!--  Javascript -->
	<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script >$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').trigger('focus')
	})
	</script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script type="text/javascript">
		let editStatus = false;
	
		$(document).ready(function(){
			$('#edit-profile-button').click(function(){
				if (editStatus == false){
					$("#profile_details").hide()
					$("#profile_edit").show()
					editStatus = true;
					$(this).text("Back")
				}else{
					$("#profile_details").show()
					$("#profile_edit").hide()
					editStatus = false;
				}
			})
		})
	
	</script>
	
	 <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'Done!..')
                            {
                            	swal("Good job!", "Saved Successfully", "success");
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
</body>
</html>