<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/06/20
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>">
</head>

<body>
<div class="img-header bg-header">
    <header>
        <!-- nav logo -->
        <a href="#" class="logo">
            <img class="logo-home" src="/resources/image/logo/Qatar-Airways-Logo.png"/>

        </a>
        <!-- nav link -->
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Portfolio</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">Team</a></li>
        </ul>
    </header>
    <!-- image of header -->
    <div class="contain-img-header">
        <h2 class="text-white">Book on our app and earn bonus Qmiles</h2>
        <a href="#" class="btn btn-outline-light px-4 py-2 mt-3 btn-learn-more">Learn more</a>
    </div>

</div>

<section class="banner"></section>
<script type="text/javascript">
    window.addEventListener("scroll", function () {
        let header = document.querySelector("header");
        header.classList.toggle("sticky", window.scrollY > 0);
    })
</script>
</body>

</html>
