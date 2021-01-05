<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01/05/21
  Time: 8:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form:form modelAttribute="ticket" action="bookingDetails" method="get">
        <div class="container">
            <form:input path="booking.bookingId" type="text" id="bookingId" placeholder="Enter your booking Id"/>
            <form:input path="passenger.lastName" type="text" id="lastName"  placeholder="Enter your last name"/>
        </div>
        <button type="submit">Search</button>
    </form:form>
</body>
</html>
