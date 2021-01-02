<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01/01/21
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="administration/_head.jsp" />
    <title>Title</title>

</head>
<body>
<div class="container">
    <form:form action="" >
        <div class="form-group">
            <label for="cardNumber">Card Number: </label>
            <input type="text" class="form-control col-md-4" id="cardNumber" placeholder="" >
        </div>
        <div class="form-group">
            <label for="expiryDate">Expiry Date: </label>
            <input type="date" class="form-control col-md-4" id="expiryDate" placeholder="" >
        </div>
        <div class="form-group">
            <label for="otp">Enter OTP: </label>
            <input type="text" class="form-control col-md-4" id="otp" placeholder="" >
        </div>
        <button type="submit" class="btn btn-primary">Pay</button>
    </form:form>


</div>

</body>
</html>
