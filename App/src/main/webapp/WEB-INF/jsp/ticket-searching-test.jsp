<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/20/20
  Time: 12:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>jQuery Autocomplete</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="http://code.jquery.com/jquery-1.7.js"
            type="text/javascript"></script>
    <script
            src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
            type="text/javascript"></script>
    <link
            href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
            rel="stylesheet" type="text/css"/>
    <STYLE TYPE="text/css" media="all">
        .ui-autocomplete {
            position: absolute;
            cursor: default;
            height: 200px;
            overflow-y: scroll;
            overflow-x: hidden;
        }
    </STYLE>
    <script type="text/javascript">
        /*get trip type */
        $(document).ready(function () {
            $("#tripType").change(function () {
                $(this).find("option:selected").each(function () {
                    let optionValue = $(this).attr("value");
                    if (optionValue == "oneWay") {
                        $("#returnDate-container").hide();
                    } else {
                        $("#returnDate-container").show();
                    }
                });
            }).change();

            /*autocomplete for origin input*/
            let value;
            $("input#origin").on("keyup", function () {
                value = $(this).val().toLowerCase();

                /*Force user to enter origin first!!!*/
                if ($('#destination').val() != '') {
                    $('#destination').val('');
                }
                /*autocomplete*/
                $("input#origin").autocomplete({
                    width: 300,
                    max: 10,
                    delay: 0,
                    minLength: 1,
                    autoFocus: true,
                    cacheLength: 1,
                    scroll: true,
                    highlight: false,
                    source: function (request, response) {
                        $.ajax({
                            url: "origin",
                            dataType: "json",
                            data: request,
                            success: function (data, textStatus, jqXHR) {
                                console.log(data);
                                let items = data;
                                let data_filter = items.filter(origin => origin.toLowerCase().indexOf(value) > -1);
                                response(data_filter);
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(textStatus);
                            }
                        });
                    }

                });

            });
            /*Auto sugguest for destination input*/
            $("input#destination").on("keyup", function () {
                let value2 = $(this).val().toLowerCase();
                /*console.log(value2);*/
                $("input#destination").autocomplete({
                    width: 300,
                    max: 10,
                    delay: 0,
                    minLength: 1,
                    autoFocus: true,
                    cacheLength: 1,
                    scroll: true,
                    highlight: false,
                    source: function (request, response) {
                        $.ajax({
                            url: "destination/" + value.toString(),
                            dataType: "json",
                            data: request,
                            success: function (data, textStatus, jqXHR) {
                                let items2 = data;
                                console.log(items2);
                                let data_filter2 = items2.filter(origin => origin.toLowerCase().indexOf(value2) > -1);
                                response(data_filter2);
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(textStatus);
                            }
                        });
                    }

                });
            });

        });
    </script>
    <script>
        let sessionId;
        function saveFlightJsonData() {
            let  adults, children, infants;
            let origin, destination, departureDate, returnDate, tripType;
            origin = $('input#origin').val();
            /*console.log(origin);*/
            destination = $('input#destination').val();
            console.log(destination);
            departureDate = $('input#departureDate').val();
            /*console.log(departureDate);*/
            returnDate = $('input#returnDate').val();
            console.log(returnDate);
            adults = $('#adults').val();
            children = $('#children').val();
            infants = $('#infants').val();
            tripType = $('#tripType').val();

            flightPicker = {
                ticketInformation : {
                    origin : origin,
                    destination : destination,
                    tripType : tripType,
                    departureDate : departureDate,
                    returnDate : returnDate,
                    adults : adults,
                    children : children,
                    infants : infants
                },
                departureTrip : {

                },
                returnTrip : {

                },
                passengerInformation : [

                ]
            };
            sessionId = $('#sessionId').val();
            sessionStorage.setItem(sessionId, JSON.stringify(flightPicker));
            console.log(flightPicker);
            console.log(JSON.stringify(flightPicker));
        }
    </script>
</head>
<body>
<input hidden type="text" value="${sessionId}" id="sessionId"/>
<div class="container">
    <h1>Let's find a flight to a certain place!!!</h1>
    <form:form action="ticketSearch" method="post" modelAttribute="ticketInformation">
        <h3>Origin:</h3>
        <form:input path="origin" name="origin" id="origin"/>

        <h3>Destination:</h3>
        <form:input path="destination" id="destination"/>

        <h3>Trip type:</h3>
        <form:select path="tripType" id="tripType" name="type">
            <option value="oneWay" selected>One Way</option>
            <option value="roundTrip">Round Trip</option>
        </form:select>

        <h3>Departure Date:</h3>
        <form:input path="departureDate" type="date" id="departureDate"/>
        <div id="returnDate-container">
            <h3>Return Date:</h3>
            <form:input path="returnDate" type="date" id="returnDate"/>
        </div>

        <h3>Travel Class</h3>
        <form:select path="travelClass">
            <option></option>
            <option value="economy">Economy</option>
            <option value="business">Business</option>
        </form:select>
        <div>
            <h3>Passenger Type:</h3>
            <span>Adults</span>
            <form:input path="passengerType.numberOfAdults" value="1" id="adults"/>

            <span>Children</span>
            <form:input path="passengerType.numberOfChildren" id="children"/>

            <span></span>Infants:
            <form:input path="passengerType.numberOfInfant" id="infants"/>
        </div>

        <br>
        <button type="submit" onclick="saveFlightJsonData()">Search</button>
    </form:form>
</div>
</body>
</html>
