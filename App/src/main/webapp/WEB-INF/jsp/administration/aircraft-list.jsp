<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/16/20
  Time: 9:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Model</th>
        <th scope="col">Total Economy Seats</th>
        <th scope="col">Total Business Seats</th>
        <th scope="col">Enabled</th>
        <th scope="col">Brand</th>
        <th scope="col">Airport</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="a" items="${aircraft}">
        <tr>
            <th scope="row">${a.aircraftId}</th>
            <td>${a.model}</td>
            <td>${a.total_economy}</td>
            <td>${a.total_business}</td>
            <td>${a.enabled}</td>
            <td>${a.brand.brandName}</td>
            <td>${a.airport.airportName}</td>
            <td><a href="editAircraft?aircraftId=${a.aircraftId}">Edit</a></td>
            <td><a href="deleteAircraft?aircraftId=${a.aircraftId}">delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>
