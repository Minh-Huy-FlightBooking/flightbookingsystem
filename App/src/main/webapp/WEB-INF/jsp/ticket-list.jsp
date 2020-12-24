<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<div class="container-fluid  bg-warning">Logo is here</div>

<div class="container-fluid bg-danger">
    Booking Process is displayed here
</div>
<%-----------%>
<div class="container mt-4">
    <div class="row">
        <div class="col">
            <h3>Departure Trip</h3>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Dates</th>
                    <th scope="col">Origin</th>
                    <th scope="col">Arrival Place</th>
                    <th scope="col">Flight</th>
                    <th scope="col">Economy Price</th>
                    <th scope="col">Business Price</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="f" items="${departFlights}">
                    <tr>
                        <td scope="row">
                            <input type="hidden" value="${f.flightId}">
                                ${f.departureTime.toLocalDate()}
                            <br/>
                                ${f.arrivalTime.toLocalDate()}
                        </td>
                        <td>
                                ${f.departureTime.toLocalTime()}
                            <br/>
                                ${f.flightRoute.originAirport.airportName}
                        </td>
                        <td>
                                ${f.arrivalTime.toLocalTime()}
                            <br/>
                                ${f.flightRoute.destinationAirport.airportName}
                        </td>
                        <td>
                                ${f.aircraft.model}
                            <br/>
                        </td>
                        <td>
                            <input type="radio" name="departPrice" value=" ${f.economyPrice}">
                            <br/>
                                ${f.economyPrice}
                        </td>
                        <td>
                            <input type="radio" name="departPrice" value="${f.businessPrice}">
                            <br/>
                                ${f.businessPrice}
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <%--<br/>
            <br/>--%>
            <c:if test="${returnStatus == 'true'}">
                <div class="container-fluid">
                    <h3>Return Flight</h3>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Dates</th>
                            <th scope="col">Origin</th>
                            <th scope="col">Arrival Place</th>
                            <th scope="col">Flight</th>
                            <th scope="col">Economy Price</th>
                            <th scope="col">Business Price</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="rf" items="${returnFlights}">
                            <tr>
                                <td scope="row">
                                        ${rf.departureTime.toLocalDate()}
                                    <br/>
                                        ${rf.arrivalTime.toLocalDate()}
                                </td>
                                <td>
                                        ${rf.departureTime.toLocalTime()}
                                    <br/>
                                        ${rf.flightRoute.originAirport.airportName}
                                </td>
                                <td>
                                        ${rf.arrivalTime.toLocalTime()}
                                    <br/>
                                        ${rf.flightRoute.destinationAirport.airportName}
                                </td>
                                <td>
                                        ${rf.aircraft.model}
                                    <br/>
                                </td>
                                <td>
                                    <input type="radio" name="returnPrice" value=" ${f.economyPrice}">
                                    <br/>
                                        ${rf.economyPrice}
                                </td>
                                <td>
                                    <input type="radio" name="returnPrice" value="${f.businessPrice}">
                                    <br/>
                                        ${rf.businessPrice}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>

        <%--aside panel to display current choice !!!--%>
        <div class="col-md-3 bg-dark px-0">
            <div class="bg-success ">
                <h5>Flight Information</h5>
                <p>Price is showed in dollar unit.</p>
                <div>
                    <p>
                        Departure: ${ticketInformation.origin}
                    </p>
                    <p>Arrival: ${ticketInformation.destination}</p>
                </div>
                <div>
                    <h5></h5>
                </div>
            </div>
        </div>
    </div>
    <div>
        <form:form  action="passengerDetails" modelAttribute="flightInformation" method="post">
            <form:input path="flightId" hidden="true" value=""/>
            <form:input path="ticketInformation.origin" hidden="true" value=""/>
            <form:input path="ticketInformation.destination" hidden="true" value=""/>
            <form:input path="ticketInformation.passengerType" hidden="true" value=""/>
            <form:input path="ticketInformation.departureDate" hidden="true" value=""/>
            <form:input path="ticketInformation.returnDate" hidden="true" value=""/>
            <form:input path="ticketInformation.travelClass" hidden="true" value=""/>
            <button>Back</button>
            <button type="submit">Continue</button>
        </form:form>

    </div>
</div>
</body>
</html>
