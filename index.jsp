 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!--font-awesome 4-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <!--clip-path maker-->
        <style>
           
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 95%, 61% 100%, 28% 95%, 0 100%);
            }

              



            
            /*this is for the second text animation*/
            .text-animation {
            font-size: 36px;
            font-family: 'Arial', sans-serif;
            text-align: left;
            animation: fadeInOut 0.033s infinite;
        }

        @keyframes fadeInOut {
            0%, 100% {
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
        }
        
          

        
        
          #typingContainer {
            font-size: 24px;
            font-family: 'Arial', sans-serif;
            overflow: hidden;
            white-space: nowrap;
            border-right: 2px solid #000;
            position: relative;
            display: inline-block;
        }

        #typingContainer::after {
            position: absolute;
            top: 0;
            right: 0;
            height: 100%;
            width: 2px;
            background-color: #000;
            animation: blinkCursor 0.7s step-end infinite;
        }

        @keyframes blinkCursor {
            from { opacity: 1; }
            to { opacity: 0; }
        }
        
         

        </style>


    </head>
    <body>


        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>



        <!--banner-->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div>
                    <div class="container text-white">

                        <div class="left">


                            <h1>Hi I'm Swadesh Thapa</h1>

                            <div id="typingContainer" class="typing-text"></div>
                            <br>
                            <h3>Welcome to my Tech Blog!</h3>

                            <br>
                            
                            <!--<h6>&nbsp;All we believe in are ST, DRY, and KISS.</h6>-->
                            <div class="text-animation">
                                
                                <h6>&nbsp;All we believe in are ST, DRY, and KISS.</h6>
                            </div>
                            <br> 
                            <a href="registerpage.jsp" class='btn btn-outline-light btn-lg'><span class="fa fa-check-square-o"></span>&nbsp;Sign Up! It's Free</a>
                            <a href="loginpage.jsp" class='btn btn-outline-light btn-lg'><span class="fa fa-user-circle"></span>&nbsp;Login</a>
                        </div>

                    </div>
                </div>
                <div class="right">
                    <img src="img/img1.jpg" width="20" height="60" alt="Loading...">

                </div>
                <div class="c"></div>

            </div>

        </div>
        <div class="secondContainer">
            <h3>Build your career in different sectors of CS & IT.</h3>
        </div>
        <br>


        <!--cards-->
        <div class='container'>
            <div class='row mb-2'>

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Software Engineer</h5>
                            <p class="card-text">Become a software engineer and earn average salary of around $118,223 per annum in the US paying scale.</p>
                                
 
                        
                            <a href="https://www.indeed.com/career/software-engineer/salaries" class="btn primary-background text-white" target="_blank">Read more</a>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Data Scientist</h5>
                            <p class="card-text">Become a data scientist and earn average salary of around $123,853 per annum in the US paying scale.</p>
                            <a href="https://www.indeed.com/career/data-scientist/salaries?from=top_sb" class="btn primary-background text-white" target="_blank">Read more</a>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Network Engineer</h5>
                            <p class="card-text">Become a network engineer and earn average salary of around $96,135 per annum in the US paying scale.</p>
                            <a href="https://www.indeed.com/career/network-engineer/salaries?from=top_sb" class="btn primary-background text-white" target="_blank">Read more</a>
                        </div>
                    </div>

                </div>





            </div>


            <div class='row mb-6'>

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Cyber Security</h5>
                            <p class="card-text">Become a cyber security engineer and earn average salary of around $111,755 per annum in the US paying scale.</p>
                            <a href="https://www.indeed.com/career/it-security-specialist/salaries?from=top_sb" class="btn primary-background text-white" target="_blank">Read more</a>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">QA Engineer</h5>
                            <p class="card-text">Become a QA engineer and earn average salary of around $59,253 per annum in the US paying scale.</p>
                            <a href="https://www.indeed.com/career/quality-assurance-engineer/salaries?from=top_sb" class="btn primary-background text-white" target="_blank">Read more</a>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Data Administrator</h5>
                            <p class="card-text">Become a data administrator and earn average salary of around $58,679 per annum in the US paying scale.</p>
                            <a href="https://www.indeed.com/career/data-administrator/salaries" class="btn primary-background text-white" target="_blank" >Read more</a>
                        </div>
                    </div>

                </div>

            </div>


        </div>
        <br>

         

        <!--footer-->
        <footer class="footer">
            @Copyright 2023
        </footer>






        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <script src="js/myjs.js" type="text/javascript"></script>
        
        
       
        
        
         <script>
        const messages = [
            "An ardent Full-Stack Software Engineer",
            "A Tech Enthusiast exploring technology",
            // Add more messages as needed
        ];

        let messageIndex = 0;
        let charIndex = 0;
        const typingContainer = document.getElementById('typingContainer');
        let typingInterval;
        let deleting = false;

        function type() {
            const currentMessage = messages[messageIndex];

            if (deleting) {
                typingContainer.textContent = currentMessage.slice(0, charIndex);
                if (charIndex > 0) {
                    charIndex--;
                } else {
                    deleting = false;
                    messageIndex = (messageIndex + 1) % messages.length;
                    setTimeout(type, 500); // Delay before starting to type the next message
                    return;
                }
            } else {
                typingContainer.textContent = currentMessage.slice(0, charIndex);
                if (charIndex < currentMessage.length) {
                    charIndex++;
                } else {
                    deleting = true;
                    setTimeout(type, 2000); // Delay before starting to delete
                    return;
                }
            }
            typingInterval = setTimeout(type, 100);
        }

        function startTypingAnimation() {
            if (typingInterval) {
                clearTimeout(typingInterval);
            }

            typingInterval = setTimeout(type, 100);
        }

        window.onload = startTypingAnimation;
    </script>


          

    </body>
</html>
