<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
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
        <a class="nav-link" style="color:red" href="#"> <span class="fa fa-bell" style="color:red;"></span> LearnCode with Kartik<span class="sr-only">(current)</span></a>
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
        <a class="nav-link" href="LoginPage.jsp" style="color:red"><span class="fa fa-user-plus"></span> Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Register_page.jsp"style="color:red"><span class="fa fa-user-circle"></span> Sign-up</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-danger my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
	
</body>
</html>