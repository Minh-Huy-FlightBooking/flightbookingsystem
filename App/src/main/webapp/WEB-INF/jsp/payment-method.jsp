<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/23/20
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <jsp:include page="administration/_head.jsp"/>
    <script>
        function goToCreditCardPayment () {
            location.href = "payment";
        }
    </script>
</head>
<body>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Origin</th>
            <th scope="col">Destination</th>
            <th scope="col">Passenger Name</th>
            <th scope="col">Travel Class</th>
            <th scope="col">Seat Code</th>
            <th scope="col">Title</th>
            <th scope="col">Price</th>
            <th scope="col">Unit</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${paymentInformationList}">
            <tr>
                <td>
                    ${p.flight.flightRoute.originAirport}
                    ${p.flight._departureTime}
                </td>
                <td>
                    ${p.flight.flightRoute.destinationAirport}
                    ${p.flight._arrivalTime}
                </td>
                <td>
                    ${p.passengerInformation.firstName}
                    &nbsp;
                    ${p.passengerInformation.lastName}
                </td>
                <td>
                    ${p.travelClass}
                </td>
                <td>
                    ${p.seatCode}
                </td>
                <td>
                    ${p.passengerInformation.title}
                </td>
                <c:choose>
                    <c:when test="${p.travelClass == 'economy'}">
                        <c:choose>
                            <c:when test="${p.passengerInformation.title} == 'infant'">
                                <td>
                                    ${p.flight.economyPrice * 0.1}
                                </td>
                            </c:when>
                            <c:when test="${p.passengerInformation.title} == 'child'">
                                <td>
                                    ${p.flight.economyPrice * 0.9}
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>
                                    ${p.flight.economyPrice}
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:when test="${p.travelClass == 'business'}">
                        <c:choose>
                            <c:when test="${p.passengerInformation.title} == 'infant'">
                                <td>
                                    ${p.flight.businessPrice * 0.1}
                                </td>
                            </c:when>
                            <c:when test="${p.passengerInformation.title} == 'child'">
                                <td>
                                    ${p.flight.businessPrice * 0.9}
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>
                                    ${p.businessPrice.economyPrice}
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                </c:choose>
                <td>$</td>
            </tr>
        </c:forEach>
        </tbody>
        <thead class="thead-dark">
        <tr>
            <th scope="col">Total</th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col" id="totalPrice"></th>
        </tr>
        </thead>
    </table>
</div>
<div class="container">
    <h1>Payment Page</h1>
    <h1>Pay through credit card</h1>
    <button  id="creditCardPayment" onclick="   goToCreditCardPayment()">Credit Card</button>
</div>
</body>
</html>
