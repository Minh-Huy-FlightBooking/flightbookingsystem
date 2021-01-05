<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01/04/21
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="administration/_head.jsp" ></jsp:include>
    <style>
        body {
            /*background: #282c34;*/
        }
        #notification-container {
            /*background: #61aeee;*/
        }

    </style>
</head>
<body>


<div class="container-fluid" id="notification-container">
   <h1>Booking Details: </h1>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">
                Booking Id
            </th>
            <th scope="col">Ticket Id</th>
            <th scope="col">Flight</th>
            <th scope="col">Origin</th>
            <th scope="col">Destination</th>
            <th scope="col">Travel Class</th>
            <th scope="col">Ticket Type</th>
            <th scope="col">Seat Code</th>
            <th scope="col">Price <span>($)</span></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="t" items="${tickets}">
            <tr>
                <td>${t.booking.bookingId}</td>
                <td>${t.ticketId}</td>
                <td>
                    ${t.flight.flightId}
                    <br/>
                    ${t.flight.aircraft.model}
                </td>
                <td>
                    ${t.flight.flightRoute.originAirport.airportName}
                    <br/>
                    ${t.flight.departureTime}
                </td>
                <td>
                    ${t.flight.flightRoute.destinationAirport.airportName}
                    <br/>
                    ${t.flight.arrivalTime}
                </td>
                <td>${t.travelClass.className}</td>
                <td>${t.ticketType.ticketTypeName}</td>
                <td>${t.seatCode}</td>
                <td>${t.price}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
