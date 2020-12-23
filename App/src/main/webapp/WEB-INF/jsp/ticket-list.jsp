<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/20/20
  Time: 12:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Origin</th>
        <th scope="col">Destination</th>
        <th scope="col">Departure Time</th>
        <th scope="col">Arrival Time</th>
        <th scope="col">Economy Price</th>
        <th scope="col">Business Price</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="f" items="${departFlights}">
        <tr>
            <th scope="row">${f.flightRoute.originAirport.airportName}</th>
            <td>${f.flightRoute.destinationAirport.airportName}</td>
            <td>${f.departureTime}</td>
            <td>${f.arrivalTime}</td>
            <td>${f.economyPrice}</td>
            <td>${f.businessPrice}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
    <br/>
    <br/>
    <c:if test="${returnStatus == 'true'}">

        <div class="container-fluid">
            <h3>Return Flight</h3>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Origin</th>
                    <th scope="col">Destination</th>
                    <th scope="col">Departure Time</th>
                    <th scope="col">Arrival Time</th>
                    <th scope="col">Economy Price</th>
                    <th scope="col">Business Price</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="rf" items="${returnFlights}">
                    <tr>
                        <th scope="row">${rf.flightRoute.originAirport.airportName}</th>
                        <td>${rf.flightRoute.destinationAirport.airportName}</td>
                        <td>${rf.departureTime}</td>
                        <td>${rf.arrivalTime}</td>
                        <td>${rf.economyPrice}</td>
                        <td>${rf.businessPrice}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

</div>
</body>
</html>
