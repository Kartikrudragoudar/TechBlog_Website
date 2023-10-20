<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registeration Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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

	<main class="p-5" style="padding-bottom 80px; background:#f00f3c;">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center text-white" style="background:#f00f3c;">
						<span class="fa fa-3x fa-user-circle  fa-spin"></span>
						<br/>
						<p>Register Here</p>
					
					</div>
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="post">
							<div class="form-group">
    							<label for="user_name">User Name</label>
    							<input name ="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name" required="required">
  							</div>
  							
  							<div class="form-group">
    							<label for="exampleInputEmail1">Email address</label>
    							<input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required">
    							<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  							</div>
  							<div class="form-group">
    							<label for="exampleInputPassword1">Password</label>
    							<input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required">
  							</div>
  							<div class="form-group">
    							<label for="gender">Select Gender</label>
    							<br>
    							<input type="radio" id="gender" name="gender" value="Male"> Male
    							<input type="radio" id="gender" name="gender" value="Female"> Female
  							</div>
  							<div class="form-group">
  								<textarea name="about" rows="5" cols="30" placeholder="Enter something about yourself" class="form-control"></textarea>
  							
  							</div>
  							<div class="form-check">
    							<input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    							<label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
  							</div>
  							<br>
  								<div class="container text-center" id="loader" style="display: none">
  									<span class="fa fa-refresh fa-spin fa-4x"></span>
  									<h4>Please Wait</h4>
  									<br>
  								</div>
  								<button type="submit" class="btn btn-primary" id="submit-btn">Submit</button>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</main>





																	<!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#sumbimt-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            if (data.trim() === 'done')
                            {
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "LoginPage.jsp"
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
</body>

</html>