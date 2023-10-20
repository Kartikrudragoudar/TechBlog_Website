<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage='true' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry Something Went Wrong</title>
					<!-- Error Page -->
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
	<div class="container text-center">
		<img src="computer.png" alt="Image not Found" class="img-fluid">
		<h3 class="display-3">Sorry! Something Went Wrong!......</h3>	
		<%= exception %>
		<a href="index.jsp" class="btn btn-large text-white mt-3" style="background: #f00f3c">Home</a>	
	</div>
</body>
</html>