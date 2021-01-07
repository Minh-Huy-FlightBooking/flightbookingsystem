<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/6/2021
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Airbook-List Flight</title>
    <jsp:include page="css.jsp"/>
    <style>
        a{
            text-decoration: none;
            color: #59595b;
        }
        a:hover{
            text-decoration: none;
            color: #59595b;
        }
        li.nav-item:hover{
            background-color: #f7f7f7;
        }
        li.nav-item a:hover{
            color: #f39c12;
        }
        li.nav-item a{
            font-size: 14px;
            font-weight: 400;
            color: #59595b;
            text-align: center;
        }
        .login-btn{
            background-color: #ffffff;
            font-weight: 600;
            color: #9a9a9d;
            min-width: 95px;
            font-size: 17px;
            line-height: 17px;
            padding: 15px 20px;
        }
        .login-btn:hover{
            background-color: #f2f2f2;
            border-color: transparent;
            color: #9a9a9d;
        }
    </style>
</head>
<body style="min-height: 1000px ;font-family: 'Poppins', sans-serif;background-color: #f7f7f7">
<input hidden type="text" value="${sessionId}" id="sessionId"/>
<nav class="navbar navbar-expand-md bg-white border-bottom" style="height: 75px;padding: 0 10vw 0 10vw;">
    <a class="navbar-brand" href="#" style="font-size: 40px;font-weight: 600;color: #f39c12">
        Airpaz
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item py-3 active">
                <a class="nav-link" href="/">Flight</a>
            </li>
            <li class="nav-item py-3">
                <a class="nav-link" href="/promo">Promo</a>
            </li>
            <li class="nav-item py-3">
                <a class="nav-link" href="#">Order</a>
            </li>
        </ul>
        <div class="mt-2 mt-md-0">
            <a href="/login" class="btn my-2 my-sm-0 shadow-sm login-btn">Login</a>
        </div>
    </div>
</nav>
<br><br>
<div class="container">
    <div class="row">
        <div class="col-sm-8">
            <div class="card">
                <div class="card-body px-0">

                    <div class="col">
                        <div class="row border-bottom">
                            <div class="col-sm-9 pb-3">
                                <p style="font-size: 14px;line-height: 17px;font-weight: 400;">Selected Departure Flight</p>
                                <strong>${f.flightRoute.originAirport.city.cityName}</strong>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                                </svg>
                                <strong>${f.flightRoute.destinationAirport.city.cityName}</strong>
                            </div>
                            <div class="col-sm-3">
                            </div>
                        </div>

                        <div class="row">
                            <table class="table table-borderless">
                                <tbody>
                                <c:forEach var="f" items="${departFlights}">
                                <tr>
                                    <td style="padding: 0 0 0 30px">
                                        <img src="https://cdn2.airpaz.com/rel-0292/themes/img/airlines_logo_vector/BL.png" alt="" height="75px" width="75px">
                                        <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${f.aircraft.model}</p>
                                        <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${f.aircraft.brand.brandName}</p>
                                    </td>
                                    <td>
                                        <strong>${f.departureTime.toLocalTime()}</strong>
                                        <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${f.departureTime.toLocalDate()}</p>
                                        <br>
                                        <strong>${f.arrivalTime.toLocalTime()}</strong>
                                        <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${f.arrivalTime.toLocalDate()}</p>
                                    </td>
                                    <td>
                                        <strong>${f.flightRoute.originAirport.city.cityName}</strong>
                                        <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${f.flightRoute.originAirport.airportName}</p>
                                        <br>
                                        <strong>${f.flightRoute.destinationAirport.city.cityName}</strong>
                                        <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${f.flightRoute.destinationAirport.airportName}</p>
                                    </td>
                                    <td align="center">
                                        <strong>Economy</strong><br><br>
                                        <input type="radio" value=" ${f.economyPrice}" id="departPrice" name="departPrice"/>
                                        <input type="hidden" value="${f.flightId}" id="flightId" name="flightId"/>
                                        <input type="hidden" value="economy" id="travelClass" name="travelClass"/>
                                        <input type="hidden" value="${f.departureTime.toLocalTime()}" id="departureTime"
                                               name="departureTime"/>
                                        <input type="hidden" value="${ticketInformation.adults}" id="adults" name="adults"/>
                                        <input type="hidden" value="${ticketInformation.children}" id="children"
                                               name="children"/>
                                        <input type="hidden" value="${ticketInformation.infant}" id="infants" name="infants"/>
                                        <br/>
                                        ${f.economyPrice}
                                    </td>
                                    <td align="center">
                                        <strong>Business</strong><br><br>
                                        <input type="radio" name="departPrice" value="${f.businessPrice}" id="departPrice"/>
                                        <input type="hidden" value="${f.flightId}" id="flightId" name="flightId"/>
                                        <input type="hidden" value="business" id="travelClass" name="travelClass"/>
                                        <input type="hidden" value="${f.departureTime.toLocalTime()}" id="departureTime"/>
                                        <input type="hidden" value="${ticketInformation.adults}" id="adults" name="adults"/>
                                        <input type="hidden" value="${ticketInformation.children}" id="children"
                                               name="children"/>
                                        <input type="hidden" value="${ticketInformation.infant}" id="infants" name="infants"/>
                                        <br/>
                                        ${f.businessPrice}
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
            <br><br>
            <c:if test="${returnStatus == 'true'}">
                <div class="card">
                    <div class="card-body px-0">
                        <div class="col">
                            <div class="row border-bottom">
                                <div class="col-sm-9 pb-3">
                                    <p style="font-size: 14px;line-height: 17px;font-weight: 400;">Selected Departure Flight</p>
                                    <strong>${f.flightRoute.originAirport.city.cityName}</strong>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                                    </svg>
                                    <strong>${f.flightRoute.destinationAirport.city.cityName}</strong>
                                </div>
                                <div class="col-sm-3">
                                </div>
                            </div>

                            <div class="row">
                                <table class="table table-borderless">
                                    <tbody>
                                    <c:forEach var="rf" items="${returnFlights}">
                                        <tr>
                                            <td style="padding: 0 0 0 30px">
                                                <img src="https://cdn2.airpaz.com/rel-0292/themes/img/airlines_logo_vector/BL.png" alt="" height="75px" width="75px">
                                                <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${rf.aircraft.model}</p>
                                                <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${rf.aircraft.brand.brandName}</p>
                                            </td>
                                            <td>
                                                <strong>${rf.departureTime.toLocalTime()}</strong>
                                                <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${rf.departureTime.toLocalDate()}</p>
                                                <br>
                                                <strong>${rf.arrivalTime.toLocalTime()}</strong>
                                                <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${rf.arrivalTime.toLocalDate()}</p>
                                            </td>
                                            <td>
                                                <strong> ${rf.flightRoute.originAirport.city.cityName}</strong>
                                                <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${rf.flightRoute.originAirport.airportName}</p>
                                                <br>
                                                <strong>${rf.flightRoute.destinationAirport.city.cityName}</strong>
                                                <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${rf.flightRoute.destinationAirport.airportName}</p>
                                            </td>
                                            <td align="center">
                                                <strong>Economy</strong><br><br>
                                                <input type="radio" value=" ${rf.economyPrice}" id="departPrice" name="departPrice"/>
                                                <input type="hidden" value="${rf.flightId}" id="flightId" name="flightId"/>
                                                <input type="hidden" value="economy" id="travelClass" name="travelClass"/>
                                                <input type="hidden" value="${rf.departureTime.toLocalTime()}" id="departureTime"
                                                       name="departureTime"/>
                                                <input type="hidden" value="${ticketInformation.adults}" id="adults" name="adults"/>
                                                <input type="hidden" value="${ticketInformation.children}" id="children"
                                                       name="children"/>
                                                <input type="hidden" value="${ticketInformation.infant}" id="infants" name="infants"/>
                                                <br/>
                                                    ${rf.economyPrice}
                                            </td>
                                            <td align="center">
                                                <strong>Business</strong><br><br>
                                                <input type="radio" name="departPrice" value="${rf.businessPrice}" id="departPrice"/>
                                                <input type="hidden" value="${rf.flightId}" id="flightId" name="flightId"/>
                                                <input type="hidden" value="business" id="travelClass" name="travelClass"/>
                                                <input type="hidden" value="${rf.departureTime.toLocalTime()}" id="departureTime"/>
                                                <input type="hidden" value="${ticketInformation.adults}" id="adults" name="adults"/>
                                                <input type="hidden" value="${ticketInformation.children}" id="children"
                                                       name="children"/>
                                                <input type="hidden" value="${ticketInformation.infant}" id="infants" name="infants"/>
                                                <br/>
                                                    ${rf.businessPrice}
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>

        <div class="col-sm-4 " id="flightInformation">
            <div class="card">
                <div class="card-body px-0">
                    <div class="col">
                        <div class="row border-bottom" style="padding: 0 0 0 20px">
                            <strong class="mb-1">Flight Information</strong>
                            <p style="font-size: 14px;line-height: 17px;font-weight: 500;color: #9a9a9d">Price is showed in dollar unit.</p>
                        </div>
                        <div class="row border-bottom" style="padding: 20px 0 0 5px">
                            <div class="col">
                                <input type="hidden" id="tripType" name="tripType" value="${ticketInformation.tripType}">
                                <div id="departure-flight-information">
                                <p><strong>Departure Trip</strong></p>
                                <p><small>Departure : </small><strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">${ticketInformation.destination}</strong></p>
                                <p><small>Arrival : </small><strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">${ticketInformation.origin}</strong></p>
                                <p><small></small><strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b" name="departurePrice"></strong></p>
                                </div>
                            </div>
                            <c:if test="${ticketInformation.tripType == 'roundTrip'}">
                                <div class="col">
                                    <p><strong>Return Trip</strong></p>
                                    <p><small>Departure : </small><strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">${ticketInformation.destination}</strong></p>
                                    <p><small>Arrival : </small><strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">${ticketInformation.origin}</strong></p>
                                    <p><small>Arrival : </small><strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b" name="returnPrice"></strong></p>
                                </div>
                            </c:if>
                        </div>
                        <div class="row" style="padding: 20px 0px 0 5px" id="passengerNumbers">
                            <div class="col">
                                <strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">Adults: </strong>
                                <small>${ticketInformation.adults}</small>
                                <input type="hidden" value="${ticketInformation.adults}" name="adults" />
                            </div>
                            <div class="col">
                                <strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">Children: </strong>
                                <small>${ticketInformation.children}</small>
                                <input type="hidden" value="${ticketInformation.children}" name="children" />
                            </div>
                            <div class="col">
                                <strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">Infants: </strong>
                                <small>${ticketInformation.infant}</small>
                                <input type="hidden" value="${ticketInformation.infant}" name="infants" />
                            </div>
                            <br/>
                            <div>
                                This is the stardard price per adult.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <button id="continue" class="btn btn-danger w-100 py-2" disabled><a onclick="sendJson()">Continue</a></button>
        </div>
    </div>
</div>
<br><br>
<footer class="fixed-bottom">
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>
