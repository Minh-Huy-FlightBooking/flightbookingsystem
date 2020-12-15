<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/9/2020
  Time: 7:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>

<body>
<header>
    <div class="container-fluid bg-light ">
        <div class="row">
            <div class="col-sm-7">
                <img src="image/logo/Qatar-Airways-Logo.png" width="120px" height="auto">
            </div>
            <div class="col-sm-5 align-self-center justify-content-end">
                Let's stay connected to get bonuses and thousands of benefits
            </div>

        </div>
    </div>
</header>
<main>
    <div class="container-fluid py-5" style="background-color: rgb(180, 180, 180); height: 90vh;">
        <div class=" container ">
            <div class="row ">
                <div class="col-md-5 mx-auto ">
                    <div class="myform form ">
                        <div class="logo mb-3 ">
                            <div class="col-md-12 text-center ">
                                <h1>Login</h1>
                            </div>
                        </div>
                        <form action="handleLogin" method="post" name="login">
                            <div class="form-group ">
                                <label for="username">Username</label>
                                <input type="text " name="username" class="form-control " id="username" aria-describedby="emailHelp " placeholder="Enter email ">
                            </div>
                            <div class="form-group ">
                                <label for="password">Password</label>
                                <input type="password " name="password" id="password" class="form-control " aria-describedby="emailHelp " placeholder="Enter Password ">
                            </div>
                            <div class="form-group ">
                                <p class="text-center">By signing up you accept our <a href="# ">Terms Of Use</a></p>
                            </div>
                            <div class="col-md-12 text-center ">
                                <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm ">Login</button>
                            </div>
                            <div class="col-md-12 ">
                                <div class="login-or ">
                                    <hr class="hr-or ">
                                    <span class="span-or"></span>
                                </div>
                            </div>
                            <div class="col-md-12 mb-3 ">
                                <p class="text-center ">
                                    <a href="javascript:void(); " class="google btn mybtn "><i class="fa fa-google-plus ">
                                    </i> Signup using Google
                                    </a>
                                </p>
                            </div>
                            <div class="form-group ">
                                <p class="text-center ">Don't have account? <a href="# " id="signup ">Sign up here</a></p>
                            </div>
                        </form>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Footer -->
<footer class="container-fluid page-footer font-small indigo pt-4" style="background-color: rgb(81,117,94);">
    <div class="container ">
        <div class="row ">
            <div class="col-md-6 ">
                <img src="image/logo/Qatar-Airways-Logo.png" width="150px" height="auto"/>
            </div>
            <div class="col-md-2 align-self-center ">
                Let's stay connected
            </div>
            <div class="col-md-3 align-self-center align-items-end " style="font-size: 15px; ">
                <i class="fa fa-facebook-official fa-2x px-2" aria-hidden="true "></i>
                <i class="fa fa-youtube fa-2x  px-2" aria-hidden="true "></i>
                <i class="fa fa-twitter-square fa-2x  px-2" aria-hidden="true "></i>
                <i class="fa fa-instagram fa-2x  px-2" aria-hidden="true "></i>
                <i class="fa fa-cloud fa-2x  px-2"></i>
            </div>
        </div>
    </div>

    <!-- Footer Links -->
    <div class="container text-center text-md-left ">
        <!-- Grid row -->
        <div class="row ">
            <!-- Grid column -->
            <div class="col-md-3 mx-auto ">
                <!-- Links -->
                <h5 class="font-weight-bold text-uppercase mt-3 mb-4 ">Qatar Airways</h5>

                <ul class="list-unstyled ">
                    <li>
                        <a href="#! ">About Us</a>
                    </li>
                    <li>
                        <a href="#! ">Awards</a>
                    </li>
                    <li>
                        <a href="#! ">Careers</a>
                    </li>
                    <li>
                        <a href="#! ">Press releases</a>
                    </li>
                </ul>

            </div>
            <!-- Grid column -->

            <hr class="clearfix w-100 d-md-none ">

            <!-- Grid column -->
            <div class="col-md-3 mx-auto ">

                <!-- Links -->
                <h5 class="font-weight-bold text-uppercase mt-3 mb-4 ">Group Companies</h5>

                <ul class="list-unstyled ">
                    <li>
                        <a href="#! ">Hamad International Airport</a>
                    </li>
                    <li>
                        <a href="#! ">Qatar Executive</a>
                    </li>
                    <li>
                        <a href="#! ">Qatar Duty Free</a>
                    </li>
                    <li>
                        <a href="#! ">Qatar Airways Cargo</a>
                    </li>
                </ul>

            </div>
            <!-- Grid column -->

            <hr class="clearfix w-100 d-md-none ">

            <!-- Grid column -->
            <div class="col-md-3 mx-auto ">

                <!-- Links -->
                <h5 class="font-weight-bold text-uppercase mt-3 mb-4 ">Business Solution</h5>

                <ul class="list-unstyled ">
                    <li>
                        <a href="#! ">Corporate travel</a>
                    </li>
                    <li>
                        <a href="#! ">Beyond Business</a>
                    </li>
                    <li>
                        <a href="#! ">QMICE Meetings and Events</a>
                    </li>
                    <li>
                        <a href="#! ">Visions</a>
                    </li>
                </ul>

            </div>
            <!-- Grid column -->

            <hr class="clearfix w-100 d-md-none ">

            <!-- Grid column -->
            <div class="col-md-3 mx-auto ">

                <!-- Links -->
                <h5 class="font-weight-bold text-uppercase mt-3 mb-4 ">Contact us</h5>

                <ul class="list-unstyled ">
                    <li>
                        <a href="#! "><i class="fa fa-envelope mr-3 "></i> info@example.com</a>
                    </li>
                    <li>
                        <a href="#! "><i class="fa fa-phone mr-3 "></i> + 01 234 567 88</a>
                    </li>
                    <li>
                        <a href="#! "><i class="fa fa-print mr-3 "></i> + 01 234 567 89</a>
                    </li>
                    <li>
                        <a href="#! "> <i class="fas fa-home "></i></i> New York, NY 10012, US</a>
                    </li>
                </ul>

            </div>
            <!-- Grid column -->

        </div>
        <!-- Grid row -->

    </div>
    <!-- Footer Links -->
    <!-- <div class="container ">
        <img class="img-fluid " src="img/total-awards-2.PNG " />
    </div> -->
    <!-- Copyright -->
    <div class="container footer-copyright text-start py-3 ">
        <div class="row ">
            <div class="col-4.5 border-right border-dark pr-2 mr-2">
                © 2020 Copyright:
                <a href="# ">Qatar Airways. All rights reserved
                </a>
            </div>
            <div class="col ">
                <span>Cookie policy</span>
            </div>
            <div class="col ">
                Legal Privacy
            </div>
            <div class="col ">
                Accessibility
            </div>
            <div class="col ">
                Optional services
            </div>
        </div>


    </div>
    <!-- Copyright -->

</footer>
<!-- Footer -->
</body>

</html>
