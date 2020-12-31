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

    <%-------------%>
    <%--<script>
        $(document).ready(function () {

            //Auto generate id for flights' ticket (Departure Table)
            //number of row
            let countRows1 = $('#departure-table tbody td').length;
            let table = document.getElementById("departure-table");
            let tr = table.getElementsByTagName("tr");

            console.log(tr.length);
            console.log(countRows1);

            let td;
            /*td = tr[1].getElementsByTagName("td")[4];
            let radioClicked = td.getElementsByTagName("input").namedItem("departureTime").value;
            console.log(radioClicked);*/

            for (let i = 1; i < tr.length; i++) {
                for (let j = 4; j < (countRows1/(tr.length - 1)); j++){
                    td = tr[i].getElementsByTagName("td")[j];
                    let radioClicked = td.getElementsByTagName("input").namedItem("departPrice");
                    if (j == 4){
                        td.setAttribute("id", "departure-economy-" + i);
                        radioClicked.setAttribute("onclick","sendDepartureFlightValues(" + "'departure-economy-"+ i +"')");
                    } else {
                        td.setAttribute("id", "departure-business-" + i);
                        radioClicked.setAttribute("onclick","sendDepartureFlightValues(" + "'departure-business-"+ i +"')");
                    }
                    /*console.log(td);*/
                }
            }

            //Auto generate id for flights' ticket (Return Table)
            let countRows2 = $('#return-table tbody td').length;
            let table2 = document.getElementById("return-table");
            let tr2 = table2.getElementsByTagName("tr");
            console.log(tr2.length);
            console.log(countRows2);
            let td2;

            for (let i = 1; i < tr.length; i++) {
                for (let j = 4; j < (countRows2/(tr2.length - 1)); j++){
                    td2 = tr2[i].getElementsByTagName("td")[j];
                    let radioClicked2 = td2.getElementsByTagName("input").namedItem("returnPrice");
                    if (j == 4){
                        td2.setAttribute("id", "return-economy-" + i);
                        radioClicked2.setAttribute("onclick","sendReturnFlightValues(" + "'return-economy-"+ i +"')");
                    } else {
                        td2.setAttribute("id", "return-business-" + i);
                        radioClicked2.setAttribute("onclick","sendReturnFlightValues(" + "'return-business-"+ i +"')");
                    }
                }
            }
            //////////
            adults = parseInt(document.getElementById("passengerNumbers").getElementsByTagName("input").namedItem("adults").value);
            children = parseInt(document.getElementById("passengerNumbers").getElementsByTagName("input").namedItem("children").value);
            infants = parseInt(document.getElementById("passengerNumbers").getElementsByTagName("input").namedItem("infants").value);

            console.log("adults, children, infants: " + adults + children + infants);
            console.log("Ready is here !!!" + flightPicker);

            tripType = $('div#flightInformation div input#tripType').val();

        })

        ///////////
        let  adults, children, infants;
        let departurePrice, departureFlightId, departureTravelClass;
        let returnPrice, returnFlightId, returnTravelClass;
        let flightPicker;
        let tripType;

        let departureFlightValClicked, returnFlightValClicked;
        function sendDepartureFlightValues(tableDataId) {
            tripType = $('div#flightInformation div input#tripType').val();
            departureFlightValClicked = true;
            /*document.getElementById("departure-flight-information").innerHTML = "Hello World";*/
            let record = document.getElementById(tableDataId);
            departurePrice = parseFloat(record.getElementsByTagName("input").namedItem("departPrice").value);
            departureFlightId = parseInt(record.getElementsByTagName("input").namedItem("flightId").value);
            departureTravelClass = record.getElementsByTagName("input").namedItem("travelClass").value;

            document.getElementById("departure-flight-information").getElementsByTagName("p").namedItem("departurePrice").innerHTML = "Total:" + departurePrice + "$";

            console.log(departurePrice);
            console.log(departureFlightId);
            console.log(departureTravelClass);
            /*flightPicker = {
                "departureTrip": {
                    "departureFlightId": departureFlightId,
                    "travelClass": departureTravelClass,
                    "adults": adults,
                    "children": children,
                    "infant": infants
                },
                "returnTrip": {
                    "returnFlightId": returnFlightId,
                    "travelClass": returnTravelClass,
                    "adults": adults,
                    "children": children,
                    "infant": infants
                }
            };*/
            flightPicker = {
                departureTrip : {
                    departureFlightId: departureFlightId,
                    travelClass: departureTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants
                },
                returnTrip: {
                    returnFlightId : returnFlightId,
                    travelClass: returnTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants
                }
            };

            console.log(flightPicker);
             if (tripType == "oneWay"){
                if (departureFlightValClicked){
                    $('#continue').removeAttr("disabled");
                    console.log("hi!");
                    $('#continue a').attr("href","passengerDetails");
                }
            } else if (tripType == "roundTrip") {
                if (returnFlightValClicked && departureFlightValClicked){
                    $('#continue').removeAttr("disabled");
                    console.log("hello!");
                    $('#continue a').attr("href","passengerDetails");
                }
            }
        }
        /*let departureObject = '{ "departureTrip": [{"flightId": ""}, {"travelClass": ""}, {"adults": ""}, {"children": ""},{"infant": ""}]}';*/


        function sendReturnFlightValues(tableDataId) {
            tripType = $('div#flightInformation div input#tripType').val();
            returnFlightValClicked = true;
            let record2 = document.getElementById(tableDataId);
            returnPrice = parseFloat(record2.getElementsByTagName("input").namedItem("returnPrice").value);
            returnFlightId = parseInt(record2.getElementsByTagName("input").namedItem("flightId").value);
            returnTravelClass = record2.getElementsByTagName("input").namedItem("travelClass").value;

            document.getElementById("return-flight-information").getElementsByTagName("p").namedItem("returnPrice").innerHTML = "Total:" + returnPrice + "$";
            flightPicker = {
                departureTrip : {
                    departureFlightId: departureFlightId,
                    travelClass: departureTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants
                },
                returnTrip: {
                    returnFlightId : returnFlightId,
                    travelClass: returnTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants
                }
            };

             if (tripType == "oneWay"){
                 if (departureFlightValClicked){
                     $('#continue').removeAttr("disabled");
                     console.log("hi!");
                     $('#continue a').attr("href","passengerDetails");
                 }
             } else if (tripType == "roundTrip") {
                 if (returnFlightValClicked && departureFlightValClicked){
                     $('#continue').removeAttr("disabled");
                     console.log("hello!");
                     $('#continue a').attr("href","passengerDetails");
                 }
             }
        }
        function sendJson() {
            /*console.log(flightPicker);
            console.log(JSON.stringify(flightPicker));*/
            $.ajax({
                type: "POST",
                url: "flightPickerHandler",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(flightPicker),
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    /*alert(data);*/
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                    console.log("fail");
                }
            });
        }
    </script>--%>
    <script>
        let sessionId;

        $(document).ready(function () {
            sessionId = $('#sessionId').val();
            console.log(JSON.parse(sessionStorage.getItem(sessionId)));
            console.log(sessionStorage.getItem(sessionId));

            //Auto generate id for flights' ticket (Departure Table)
            //number of row
            let countRows1 = $('#departure-table tbody td').length;
            let table = document.getElementById("departure-table");
            let tr = table.getElementsByTagName("tr");

            console.log(tr.length);
            console.log(countRows1);

            let td;
            /*td = tr[1].getElementsByTagName("td")[4];
            let radioClicked = td.getElementsByTagName("input").namedItem("departureTime").value;
            console.log(radioClicked);*/

            for (let i = 1; i < tr.length; i++) {
                for (let j = 4; j < (countRows1 / (tr.length - 1)); j++) {
                    td = tr[i].getElementsByTagName("td")[j];
                    let radioClicked = td.getElementsByTagName("input").namedItem("departPrice");
                    if (j == 4) {
                        td.setAttribute("id", "departure-economy-" + i);
                        radioClicked.setAttribute("onclick", "sendDepartureFlightValues(" + "'departure-economy-" + i + "')");
                    } else {
                        td.setAttribute("id", "departure-business-" + i);
                        radioClicked.setAttribute("onclick", "sendDepartureFlightValues(" + "'departure-business-" + i + "')");
                    }
                    /*console.log(td);*/
                }
            }

            tripType = $('div#flightInformation div input#tripType').val();
            //Auto generate id for flights' ticket (Return Table)
            if (tripType == "roundTrip") {
                let countRows2 = $('#return-table tbody td').length;
                let table2 = document.getElementById("return-table");
                let tr2 = table2.getElementsByTagName("tr");
                console.log(tr2.length);
                console.log(countRows2);
                let td2;

                for (let i = 1; i < tr.length; i++) {
                    for (let j = 4; j < (countRows2 / (tr2.length - 1)); j++) {
                        td2 = tr2[i].getElementsByTagName("td")[j];
                        let radioClicked2 = td2.getElementsByTagName("input").namedItem("returnPrice");
                        if (j == 4) {
                            td2.setAttribute("id", "return-economy-" + i);
                            radioClicked2.setAttribute("onclick", "sendReturnFlightValues(" + "'return-economy-" + i + "')");
                        } else {
                            td2.setAttribute("id", "return-business-" + i);
                            radioClicked2.setAttribute("onclick", "sendReturnFlightValues(" + "'return-business-" + i + "')");
                        }
                    }
                }
            }

            //////////
            adults = parseInt(document.getElementById("passengerNumbers").getElementsByTagName("input").namedItem("adults").value);
            children = parseInt(document.getElementById("passengerNumbers").getElementsByTagName("input").namedItem("children").value);
            infants = parseInt(document.getElementById("passengerNumbers").getElementsByTagName("input").namedItem("infants").value);

            console.log("adults, children, infants: " + adults + children + infants);
            console.log("Ready is here !!!" + flightPicker);


        })
        let origin, destination, departureDate, returnDate;
        ///////////
        let adults, children, infants;
        let departurePrice, departureFlightId, departureTravelClass;
        let returnPrice, returnFlightId, returnTravelClass;
        let flightPicker;
        let tripType;

        let departureFlightValClicked, returnFlightValClicked;

        function sendDepartureFlightValues(tableDataId) {
            tripType = $('div#flightInformation div input#tripType').val();
            departureFlightValClicked = true;
            /*document.getElementById("departure-flight-information").innerHTML = "Hello World";*/
            let record = document.getElementById(tableDataId);
            departurePrice = parseFloat(record.getElementsByTagName("input").namedItem("departPrice").value);
            departureFlightId = parseInt(record.getElementsByTagName("input").namedItem("flightId").value);
            departureTravelClass = record.getElementsByTagName("input").namedItem("travelClass").value;

            document.getElementById("departure-flight-information").getElementsByTagName("p").namedItem("departurePrice").innerHTML = "Total:" + departurePrice + "$";

            console.log(departurePrice);
            console.log(departureFlightId);
            console.log(departureTravelClass);
            /*flightPicker = {
                "departureTrip": {
                    "departureFlightId": departureFlightId,
                    "travelClass": departureTravelClass,
                    "adults": adults,
                    "children": children,
                    "infant": infants
                },
                "returnTrip": {
                    "returnFlightId": returnFlightId,
                    "travelClass": returnTravelClass,
                    "adults": adults,
                    "children": children,
                    "infant": infants
                }
            };*/
            flightPicker = {
                departureTrip: {
                    departureFlightId: departureFlightId,
                    travelClass: departureTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants
                },
                returnTrip: {
                    returnFlightId: returnFlightId,
                    travelClass: returnTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants
                }
            };
            /*let previousFlightPickerData = sessionStorage.getItem(sessionId);*/
            console.log(flightPicker);

            if (tripType == "oneWay") {
                if (departureFlightValClicked) {
                    $('#continue').removeAttr("disabled");
                    console.log("hi!");
                    $('#continue a').attr("href", "passengerDetails");
                }
            } else if (tripType == "roundTrip") {
                if (returnFlightValClicked && departureFlightValClicked) {
                    $('#continue').removeAttr("disabled");
                    console.log("hello!");
                    $('#continue a').attr("href", "passengerDetails");
                }
            }

            //Send Json object
            sendJson();
        }

        /*let departureObject = '{ "departureTrip": [{"flightId": ""}, {"travelClass": ""}, {"adults": ""}, {"children": ""},{"infant": ""}]}';*/


        function sendReturnFlightValues(tableDataId) {
            tripType = $('div#flightInformation div input#tripType').val();
            returnFlightValClicked = true;
            let record2 = document.getElementById(tableDataId);
            returnPrice = parseFloat(record2.getElementsByTagName("input").namedItem("returnPrice").value);
            returnFlightId = parseInt(record2.getElementsByTagName("input").namedItem("flightId").value);
            returnTravelClass = record2.getElementsByTagName("input").namedItem("travelClass").value;

            document.getElementById("return-flight-information").getElementsByTagName("p").namedItem("returnPrice").innerHTML = "Total:" + returnPrice + "$";
            flightPicker = {
                departureTrip: {
                    departureFlightId: departureFlightId,
                    travelClass: departureTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants
                },
                returnTrip: {
                    returnFlightId: returnFlightId,
                    travelClass: returnTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants
                }
            };

            if (tripType == "oneWay") {
                if (departureFlightValClicked) {
                    $('#continue').removeAttr("disabled");
                    console.log("hi!");
                    $('#continue a').attr("href", "passengerDetails");
                }
            } else if (tripType == "roundTrip") {
                if (returnFlightValClicked && departureFlightValClicked) {
                    $('#continue').removeAttr("disabled");
                    console.log("hello!");
                    $('#continue a').attr("href", "passengerDetails");
                }
            }
            //Send Json object
            sendJson();
        }

        function sendJson() {
            /////////////////////////////////////////////////////////////////////
            let previousFlightPickerData = JSON.parse(sessionStorage.getItem(sessionId));
            previousFlightPickerData.departureTrip = flightPicker.departureTrip;
            previousFlightPickerData.returnTrip = flightPicker.returnTrip;
            console.log("Clicked!!!");
            console.log(previousFlightPickerData);
            sessionStorage.setItem(sessionId, JSON.stringify(previousFlightPickerData));
            /*console.log(flightPicker);
            console.log(JSON.stringify(flightPicker));*/
            $.ajax({
                type: "POST",
                url: "flightPickerHandler",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(flightPicker),
                success: function (data, textStatus, jqXHR) {
                    console.log("send data to backend successfully: ");
                    console.log(data);
                    /*alert(data);*/
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                    console.log("fail");
                }
            });
        }
    </script>
    <style>
        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body>
<input hidden type="text" value="${sessionId}" id="sessionId"/>
<%--<input hidden type="text" value="${ticketInformation.tripType}" id="tripTypeSearched"/>--%>
<div class="container-fluid  bg-warning">Logo is here</div>

<div class="container-fluid bg-danger">
    Booking Process is displayed here
</div>
<%-----------%>
<div class="container mt-4">
    <div class="row">
        <div class="col">
            <div class="container-fluid" id="departure-container">
                <h3>Departure Trip</h3>
                <table class="table table-striped" id="departure-table">
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
                            <td>
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

            <%--<br/>
            <br/>--%>
            <c:if test="${returnStatus == 'true'}">
                <div class="container-fluid" id="return-container">
                    <h3>Return Flight</h3>
                    <table class="table table-striped" id="return-table">
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
                                    <input type="radio" value=" ${rf.economyPrice}" id="departPrice"
                                           name="returnPrice"/>
                                    <input type="hidden" value="${rf.flightId}" id="flightId" name="flightId"/>
                                    <input type="hidden" value="economy" id="travelClass" name="travelClass"/>
                                    <input type="hidden" value="${rf.departureTime.toLocalTime()}" id="departureTime"
                                           name="departureTime"/>
                                    <input type="hidden" value="${ticketInformation.adults}" id="adults" name="adults"/>
                                    <input type="hidden" value="${ticketInformation.children}" id="children"
                                           name="children"/>
                                    <input type="hidden" value="${ticketInformation.infant}" id="infants"
                                           name="infants"/>
                                    <br/>
                                        ${rf.economyPrice}
                                </td>
                                <td>
                                    <input type="radio" value=" ${rf.businessPrice}" id="departPrice"
                                           name="returnPrice"/>
                                    <input type="hidden" value="${rf.flightId}" id="flightId" name="flightId"/>
                                    <input type="hidden" value="business" id="travelClass" name="travelClass"/>
                                    <input type="hidden" value="${rf.departureTime.toLocalTime()}" id="departureTime"
                                           name="departureTime"/>
                                    <input type="hidden" value="${ticketInformation.adults}" id="adults" name="adults"/>
                                    <input type="hidden" value="${ticketInformation.children}" id="children"
                                           name="children"/>
                                    <input type="hidden" value="${ticketInformation.infant}" id="infants"
                                           name="infants"/>
                                    <br/>
                                        ${rf.businessPrice}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <div class="">
                <button><a href="ticketSearch">Back</a></button>
                <button id="continue" disabled><a onclick="sendJson()">Continue</a></button>
            </div>
        </div>

        <%--aside panel to display current choice !!!--%>
        <div class="col-md-3 px-0" id="flightInformation">
            <div class="bg-success ">
                <h5>Flight Information</h5>
                <p>Price is showed in dollar unit.</p>
                <input type="hidden" id="tripType" name="tripType" value="${ticketInformation.tripType}">
                <div id="departure-flight-information">
                    <h4>Departure Trip:</h4>
                    <div>
                        <p>
                            Departure: ${ticketInformation.origin}
                        </p>
                        <p>
                            Arrival: ${ticketInformation.destination}
                        </p>
                        <p name="departurePrice"></p>
                    </div>
                </div>
                <c:if test="${ticketInformation.tripType == 'roundTrip'}">
                    <div id="return-flight-information">
                        <h4>Return Trip:</h4>

                        <div>
                            <p>
                                Departure: ${ticketInformation.destination}
                            </p>
                            <p>
                                Arrival: ${ticketInformation.origin}
                            </p>
                            <p name="returnPrice"></p>
                        </div>
                    </div>
                </c:if>
                <div style="border-top: 1px dashed yellow" id="passengerNumbers">
                    <p>
                        <span>
                            Adults:
                            ${ticketInformation.adults}
                            <input type="hidden" value="${ticketInformation.adults}" name="adults" id="adults"/>
                        </span>
                        <span>
                            Children:
                            ${ticketInformation.children}
                            <input type="hidden" value="${ticketInformation.children}" name="children" id="children"/>
                        </span>
                        <span>
                            Infant:
                            ${ticketInformation.infant}
                            <input type="hidden" value="${ticketInformation.infant}" name="infants" id="infants"/>
                        </span>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
