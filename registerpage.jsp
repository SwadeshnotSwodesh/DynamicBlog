<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!--font-awesome 4-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!--clip-path maker-->
        <style>
           /* .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 95%, 61% 100%, 28% 95%, 0 100%);
            }*/
        </style>
    </head>
    <body>

        <!--navbar-->
        <%@include file="normal_navbar.jsp"%>

        <main class="primary-background banner-background" style="padding-bottom: 60px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">

                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <p>Sign Up here</p>

                            </div>

                            <div class="card-body">

                                <form id="reg-form" action="RegisterServlet" method="POST">
                                    <div class="form-group">
                                        <label for="exampleUserName1">User Name</label>
                                        <input name="user_name" type="text" class="form-control" id="exampleUserName1" aria-describedby="emailHelp" placeholder="e.g. Swadeshworks" autofocus="" required="">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="" autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email Address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your email address" required="">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Select Gender</label>
                                        <br>
                                        <input type="radio" id="exampleInputEmail1" name="user_gender" value="male">Male&nbsp;
                                        <input type="radio" id="exampleInputEmail1" name="user_gender" value="female">Female&nbsp;
                                        <input type="radio" id="exampleInputEmail1" name="user_gender" value="others">Others

                                    </div>

                                    <div class="form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">I agree all the terms and conditions.</label>
                                    </div>
                                    <br>
                                    <!--this is for the waiting time in the registration page-->
                                    <div class="container text-center" id="loader" style="display: none;">
                                        <span class="fa fa-refresh fa-spin fa-2x"></span>
                                        <h4>Please wait...</h4>
                                    </div>
                                    <br>
                                    <button id="reset-btn" type="reset" class="btn btn-primary">Reset</button>
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                </form>

                            </div>

                        </div>
                    </div>

                </div>

            </div>
        </main>

        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <script src="js/myjs.js" type="text/javascript"></script>

        <!--for sweetalert-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <!--ajax based implementation for registration-->
        <script>
            $(document).ready(function () {
                console.log("Loaded");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#reset-btn").hide();
                    $("#submit-btn").hide();
                    $("#loader").show();


                    //sending register servlet...
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            $("#reset-btn").show();
                            $("#submit-btn").show();
                            $("#loader").hide();
                            
//                            the "Done..." should be same to that of "Done..." of RegisterServlet.java 
                            if(data.trim()==="Done...")
                            {
                                swal("Successfully registered...Redirecting to the login page!")
                                    .then((value) => {
                                        window.location = "loginpage.jsp";
                                    });
                            }
                            else 
                            {
                                swal(data);
                            }

                            
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            

                            $("#reset-btn").show();
                            $("#submit-btn").show();
                            $("#loader").hide();

                            swal("Sorry! Something went wrong. Please try again later.");
                                     
                        },
                        processData: false,
                        contentType: false
                    });
                })

            })
        </script>
    </body>
</html>
