<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="CSS\Mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	.banner-background{
		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 70%, 61% 89%, 12% 86%, 0% 70%, 0 0);
	}
</style>

</head>

<body>
	<!-- nav bar -->
	<%@include file="normal_navbar.jsp" %>
	
	<!-- //Banner -->
	<div class="banner-background container-xl p=0"> 
		
		<div class="jumbotron text-white" style="background:#f00f3c;">
			<div class="container">
				<h3 class="display=3">Welcome To Tech Blog</h3>
				<p>Welcome to technical blog, world of technology.
				 A programming language is a type of written language that tells computers what to do.
				 Examples are: Python, Ruby, Java, JavaScript, C, C++, and C#. Programming languages are used to write all computer programs and computer software. 
				 A programming language is like a set of instructions that the computer follows to do something.
				</p>
				<p>Most programming languages consist of instructions for computers. There are programmble
				machines that use a set of specific instructions rather than general programming languages.</p>
				<button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start ! its Free</button>
				<a href="LoginPage.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin"></span> Login</a>
			</div>
		</div>
	</div>
	
	<!-- //cards -->
	<div class="container">
			<div class="row mb-2">
				<div class="col-md-4">
					<div class="card">
 						<div class="card-body">
    						<h5 class="card-title">Java Programming</h5>
    						<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    						<a href="#" class="btn primary-background text-white">Read More</a>
  						</div>
					</div>																	
				</div>
				
				<div class="col-md-4">
					<div class="card">
 						<div class="card-body">
    						<h5 class="card-title">Java Programming</h5>
    						<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    						<a href="#" class="btn primary-background text-white">Read More</a>
  						</div>
					</div>																	
				</div>
				
				<div class="col-md-4">
					<div class="card">
 						<div class="card-body">
    						<h5 class="card-title">Java Programming</h5>
    						<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    						<a href="#" class="btn primary-background text-white">Read More</a>
  						</div>
					</div>																	
				</div>
		    </div>
		    <div class="row">
				<div class="col-md-4">
					<div class="card">
 						<div class="card-body">
    						<h5 class="card-title">Java Programming</h5>
    						<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    						<a href="#" class="btn primary-background text-white">Read More</a>
  						</div>
					</div>																	
				</div>
				
				<div class="col-md-4">
					<div class="card">
 						<div class="card-body">
    						<h5 class="card-title">Java Programming</h5>
    						<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    						<a href="#" class="btn primary-background text-white">Read More</a>
  						</div>
					</div>																	
				</div>
				<br/>
				<br/>
				<div class="col-md-4">
					<div class="card">
 						<div class="card-body">
    						<h5 class="card-title">Java Programming</h5>
    						<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    						<a href="#" class="btn primary-background text-white">Read More</a>
  						</div>
					</div>																	
				</div>
		    </div>
	</div>
	
				<!--  Javascript -->
	<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>