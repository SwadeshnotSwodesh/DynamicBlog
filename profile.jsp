<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.entities.Message" %>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="com.tech.blog.entities.Category"%>

<%@page import="java.sql.Connection" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="java.sql.SQLException"%>



<%

User user=(User)session.getAttribute("currentUser");
if(user==null)
{
response.sendRedirect("loginpage.jsp");
}
%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!--font-awesome 4-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
             body
            {
             background:url(img/premium.avif);
             background-size: cover;
             background-attachment: fixed;
            }
        </style>

    </head>
    <body>
        <!--navbar starts here-->


        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class='fa fa-lightbulb-o'></span>&nbsp;Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Aboutme.jsp"><span class='fa fa-smile-o'></span>&nbsp;About me<span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-file-code-o"></span>
                            My &nbsp;Skills
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">C & C++</a>
                            <a class="dropdown-item" href="#">HTML,CSS,JS</a>
                            <a class="dropdown-item" href="#">Core Java</a>
                            <a class="dropdown-item" href="#">Advance Java</a>
                            <a class="dropdown-item" href="#">MYSQL</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">DSA</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class='fa fa-universal-access fa-spin'></span>
                            &nbsp;Contact me</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href=" https://github.com/SwadeshnotSwodesh" target="_blank">Github</a>
                            <a class="dropdown-item" href=" https://linkedin.com/in/swadesh-thapa-190880239" target="_blank">LinkedIn</a>

                        </div>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal">
                            <span class='fa fa-sticky-note'></span>
                            &nbsp;New Post</a>
                    </li>



                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span>&nbsp;<%=user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <!--comment
                    <a class="nav-link" href="LogoutServlet"><span class="fa fa-user"></span>&nbsp;Log out</a>-->
                        <button class="btn btn-outline-light my-2 my-sm-2" type="submit"><a href="LogoutServlet">Log out</a></button>
                    </li>
                </ul>
            </div>
        </nav>

        <!--navbar ends here-->



        <%
                                  Message m=(Message)session.getAttribute("msg");
                                  if(m!=null)
                                  {
        %>

        <div class="alert <%= m.getCssClass()%>" role="alert">

            <%= m.getContent() %>

        </div>



        <%
            session.removeAttribute("msg");
    }
                                
        %>

        <!--main body of the page starts here-->

        <main>
            <div class="container">
                <div class="row mt-4">

                    <!--this is the first column-->
                    <div class="col-md-4">
                        <!--this is for the categories-->
                        
                        <div class="list-group">
                            
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--Categories-->
                            <%
                            PostDao d=new PostDao(ConnectionProvider.getConnection());
                            d.getAllCategories();
                            ArrayList<Category> list1=d.getAllCategories();
                            for(Category cc:list1)
                            {
                            %>
                            
                            <a href="#" onclick="getPosts(<%=cc.getCid()%>,this)" class="c-link list-group-item list-group-item-action"><%=cc.getName()%></a>
                            
                            <%
                            }

                            %>
                            
                          
                             
                        </div>
                    </div>

                    <!--this is the second column-->
                    <div class="col-md-8">
                        <!--this is for the posts-->

                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                            
                        </div>
                        
                        <div class="container-fluid" id="post-container">
                            
                        </div>
                        
                    </div>

                </div>
            </div>
        </main>

        <!--main body of the page ends here-->


        <!--profile modal starts here-->




        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%">

                            <h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>


                            <!--details in the profile starts here-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">Id:</th>
                                            <td><%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><%=user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%=user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on:</th>
                                            <td><%=user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--details in the profile ends here-->

                            <!--profile edit section starts here-->

                            <div id="profile-edit" style="display: none;">
                                <h3>Edit your profile</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data"><!--enctype is for the image type-->

                                    <table class="table">

                                        <tr>
                                            <td>Your DP:</td>
                                            <td><input type="file" name="image" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <td>Id:</td>
                                            <td><%=user.getId()%></td>
                                        </tr>

                                        <tr>
                                            <td>Name:</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
                                        </tr>

                                        <tr>
                                            <td>Password:</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Gender:</td>
                                            <td><%=user.getGender().toUpperCase()%></td>
                                        </tr>



                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline primary-background">
                                            Save

                                        </button>

                                    </div>

                                </form>

                            </div>
                            <!--profile edit section ends here-->

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit your profile</button>
                    </div>
                </div>
            </div>
        </div>



        <!--profile modal ends here-->



        <!--add post starts here-->



        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Create your post here</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <div class="modal-body">
                        <form action="AddPostServlet" method="post" id="add-post-form">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled><---Select your category---></option> 

                                    <%
                                        PostDao postd=new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list=postd.getAllCategories();
                                        for(Category c:list)
                                        {
                                    %>  
                                    <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                                    <%
                                        }
                                    %>

                                </select>




                            </div>


                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post here" class="form-control">
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height:200px;" placeholder="Enter your content here"></textarea>

                            </div>

                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your best program here"></textarea>

                            </div>

                            <div class="form-group">
                                <label>Choose your pic</label>
                                <br>
                                <input type="file" name="pic" >

                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>


                        </form>
                    </div>


                </div>
            </div>
        </div>

        <!--add post ends here-->



        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!--this is for the sweet alert-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                let editStatus = false;

                $('#edit-profile-button').click(function () {

                    if (editStatus == false)
                    {
                        $("#profile-details").hide()

                        $("#profile-edit").show()
                        editStatus = true;
                        $(this).text("Back")
                    } else
                    {
                        $("#profile-details").show()

                        $("#profile-edit").hide()
                        editStatus = false;
                        $(this).text("Edit")
                    }

                })
            })
        </script>

        <!--This is the add post js part starting from here-->

        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this part of code is called when the form is submitted...
                    event.preventDefault();//the normal behaviour (synchronous) type stops here
                    console.log("You have clicked on submit...");


                    let form = new FormData(this);//the above #add-post-form comes here with the help of this


                    //Now requesting to the server
                    $.ajax({
                        url: "AddPostServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //this is for the success part
                            console.log(data);
                            if (data.trim() == 'Done...')
                            {
                                swal("Good job!", "Saved successfully", "success");
                            } else
                            {
                                swal("Error!", "Something went wrong...try again!", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //this is for the error part
                            swal("Error!", "Something went wrong...try again!", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })

        </script>

        <!--the add post js part ends here-->
        
        <!--this is for the loading post using ajax-->
        <script>
            
            function getPosts(catId,temp){
                $("#loader").show();
                $("#post-container").hide();
                
                $(".c-link").removeClass('active');
                
                $.ajax({
                    url:"load_posts.jsp",
                    data: {cid:catId},
                    success: function(data, textStatus, jqXHR){
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                    }
                })
            }
            
            
            $(document).ready(function (e){
                
                let allPostRef=$('.c-link')[0]
                
                getPosts(0,allPostRef)
                
                
            })
            </script>

    </body>
</html>
