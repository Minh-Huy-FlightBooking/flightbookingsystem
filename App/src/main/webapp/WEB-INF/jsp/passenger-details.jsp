<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/23/20
  Time: 7:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jQuery Autocomplete</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="http://code.jquery.com/jquery-1.7.js"
            type="text/javascript"></script>
    <script
            src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
            type="text/javascript"></script>
    <link
            href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
            rel="stylesheet" type="text/css"/>
    <script>
        let origin, destination, departureDate, returnDate;
        let adults, children, infants;
        let departurePrice, departureFlightId, departureTravelClass;
        let returnPrice, returnFlightId, returnTravelClass;
        let flightPicker;
        let flightData;
        let tripType;

        $(document).ready(function () {
            console.log("HI am ready to go!!");
            console.log(sessionId.value);
            let previousSessionValue = sessionStorage.getItem(sessionId.value);
            console.log(previousSessionValue);

            if (previousSessionValue != null) {
                flightData = JSON.parse(previousSessionValue);

                adults = parseInt(flightData.ticketInformation.adults);
                children = parseInt(flightData.ticketInformation.children);
                infants = parseInt(flightData.ticketInformation.infants);

                console.log(flightData);
                console.log(adults);
                console.log(children);
                console.log(infants);


                for (let i = 1; i <= (adults + children + infants); i++) {
                    if (i <= adults) {
                        $('#passenger-data-container').find("div.passenger-data-item").eq(i - 1).attr("id", "passenger-" + i);
                        document.getElementById("passenger-" + i).getElementsByTagName("input").namedItem("sendInformationCheckbox").setAttribute("onclick", "sendDataToEmail('passenger-" + i + "')");
                    } else if (i <= (adults + children)) {
                        $('#passenger-data-container').find("div.passenger-data-item").eq(i - 1).attr("id", "passenger-" + i);
                    } else {
                        $('#passenger-data-container').find("div.passenger-data-item").eq(i - 1).attr("id", "passenger-" + i);
                    }
                }
                /* let title = $('#passenger-2 #title').val();
                 console.log(title);*/
            }
        })
        let isDataSentChecked;
        function sendDataToEmail(passengerDataItem){
            let inputTag = document.getElementById(passengerDataItem).getElementsByTagName("input");
            if (inputTag.namedItem("sendInformationCheckbox").checked){
                inputTag.namedItem("email").removeAttribute("disabled");
                inputTag.namedItem("phoneNumber").removeAttribute("disabled");
                isDataSentChecked = true;
            } else {
                inputTag.namedItem("email").setAttribute("disabled", "true");
                inputTag.namedItem("phoneNumber").setAttribute("disabled", "true");;
            }
        }
        let passengerInformation = new Array();

        //Send Data back to Server --> Using Ajax
        function sendPassengerData() {
            for (let i = 1; i <= (adults + children + infants); i++) {
                let passengerData = document.getElementById("passenger-" + i);
                let title, firstName, lastName, gender, dateOfBirth, nationality, passportNumber, expiryDate, email, phoneNumber;

                title = passengerData.getElementsByTagName("select").namedItem("title").value;

                gender = passengerData.getElementsByTagName("select").namedItem("gender").value;
                nationality = passengerData.getElementsByTagName("select").namedItem("nationality").value;

                firstName = passengerData.getElementsByTagName("input").namedItem("firstName").value;
                lastName = passengerData.getElementsByTagName("input").namedItem("lastName").value;
                dateOfBirth = passengerData.getElementsByTagName("input").namedItem("dateOfBirth").value;
                if (title != "infant"){
                    passportNumber = passengerData.getElementsByTagName("input").namedItem("passportNumber").value;
                    expiryDate = passengerData.getElementsByTagName("input").namedItem("expiryDate").value;
                }

                if (title != "infant" && title != "child" && isDataSentChecked) {
                    email = passengerData.getElementsByTagName("input").namedItem("email").value;
                    phoneNumber = passengerData.getElementsByTagName("input").namedItem("phoneNumber").value;
                }

                console.log(title);
                console.log(firstName);
                console.log(lastName);
                console.log(dateOfBirth);
                console.log(gender);
                console.log(nationality);
                if (title != "infant"){
                    console.log(passportNumber);
                    console.log(expiryDate);
                }
                if ( i  == (adults + children + infants)){
                    console.log("The last one");
                } else {
                    console.log("Not The last one");
                }

                let person = {
                    title: title,
                    firstName: firstName,
                    lastName: lastName,
                    dateOfBirth: dateOfBirth,
                    gender: gender,
                    nationality: nationality,
                    passportNumber: passportNumber,
                    expiryDate: expiryDate,
                    email: email,
                    phoneNumber: phoneNumber
                };

                console.log(person);
                passengerInformation.push(person);
            }
            console.log((passengerInformation));
            flightData.passengerInformation = passengerInformation;
            console.log(flightData);

            //Send Data to Server here !! Ha ha!!
            sessionStorage.setItem(sessionId, JSON.stringify(flightData));
            $.ajax({
                type: "POST",
                url: "flightPickerHandler",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(flightData),
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
    <script>

    </script>
</head>
<body>
<button onclick="sendPassengerData()">Click me</button>
<input hidden type="text" value="${sessionId}" id="sessionId"/>
<div class="container-fluid  bg-warning">Logo is here</div>

<div class="container-fluid bg-danger">
    Booking Process is displayed here
</div>
<div class="container border mt-2">
    <div class="row">
        <div class="col-md-3">
            List of passenger's data here!!!
        </div>
        <div class="col">
            <div>
                <h5>
                    Please make sure that you enter the names of all passengers as shown on passports. This will avoid
                    problems at
                    the airport. Name changes are not permitted once the booking has been finalised.
                </h5>
            </div>
            <div id="passenger-data-container">
                <c:forEach var="p" items="${passengerList}">
                    <div style="border-bottom: yellow solid 2px" class="passenger-data-item">
                        <div>
                            <h5>
                                <c:choose>
                                    <c:when test="${p.title == 'adult'}">
                                        Adult
                                    </c:when>
                                    <c:when test="${p.title == 'child'}">
                                        Child
                                    </c:when>
                                    <c:when test="${p.title == 'infant'}">
                                        Infant
                                    </c:when>
                                </c:choose>
                            </h5>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <label>Title</label>
                                <select class="form-control" name="title">
                                    <c:choose>
                                        <c:when test="${p.title == 'adult'}">
                                            <option value="Mr">Mr</option>
                                            <option value="Mrs">Mrs</option>
                                            <option value="Mrs">Ms</option>
                                            <option value="Mrs">Miss</option>
                                        </c:when>
                                        <c:when test="${p.title == 'infant'}">
                                            <option value="infant">Infant</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="child">Child</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                            <div class="form-group col-md-2">
                                <label>First Name:</label>
                                <input class="form-control" name="firstName" placeholder="First Name"/>
                            </div>
                            <div class="form-group col-md-2">
                                <label>Last Name</label>
                                <input class="form-control" name="lastName" placeholder="Last Name"/>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <label>Gender</label>
                                <select class="form-control" name="gender">
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="homosexuality">Homosexuality</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Date Of Birth</label>
                                <input type="date" class="form-control" name="dateOfBirth"/>
                            </div>
                            <div class="form-group col-md-2">
                                <label>Nationality</label>
                                <select class="form-control" name="nationality">
                                    <option value="Vietnam">Vietnam</option>
                                    <option value="USA">USA</option>
                                </select>
                            </div>
                        </div>
                        <c:if test="${p.title == 'adult' || p.title == 'child'}">
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label>Passport Number:</label>
                                    <input path="passportNumber" class="form-control" name="passportNumber"/>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Expiry Date:</label>
                                    <input type="date" class="form-control" name="expiryDate"/>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${p.title == 'adult'}">
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label>Email:</label>
                                    <input path="passportNumber" class="form-control" name="email" disabled/>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Phone Number:</label>
                                    <input type="text" class="form-control" name="phoneNumber" disabled/>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Send Booking Data to this email</label>
                                    <input type="checkbox" name="sendInformationCheckbox" class="form-control  col-md-2"/>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <div class="mt-2">
                <button><a href="ticketSearch">Back</a></button>
                <button id="continue"><a href="seatSelection" onclick="sendPassengerData()">Continue</a></button>
            </div>
            <%--<form:form action="" modelAttribute="passenger">
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label for="title">Title</label>
                        <form:select path="title" class="form-control" id="title">
                            <option value="Mr">Mr</option>
                            <option value="Mrs">Mrs</option>
                            <option value="Mrs">Ms</option>
                            <option value="Mrs">Miss</option>
                        </form:select>
                            &lt;%&ndash;<input type="email" class="form-control" id="inputEmail4" placeholder="Email">&ndash;%&gt;
                    </div>
                    <div class="form-group col-md-2">
                        <label for="firstName">First Name:</label>
                        <form:input path="firstName" class="form-control" id="firstName" placeholder="First Name"/>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="lastName">Last Name</label>
                        <form:input path="lastName" class="form-control" id="lastName" placeholder="Last Name"/>

                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label for="lastName">Gender</label>
                        <form:select path="gender"  class="form-control" id="gender">
                            <option>Male</option>
                            <option>Female</option>
                            <option>Homosexuality</option>
                        </form:select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="dateOfBirth">Date Of Birth</label>
                        <form:input path="dateOfBirth" type="date" class="form-control" id="dateOfBirth"/>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="firstName">Nationality</label>
                        <form:select path="nationality"  class="form-control" id="nationality">
                            <option>Vietnam</option>
                            <option>USA</option>
                        </form:select>
                    </div>

                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="lastName">Passport Number:</label>
                        <form:input path="passportNumber" class="form-control"/>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="dateOfBirth">Expiry Date:</label>
                        <form:input path="expiryDate" type="date" class="form-control"/>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" style="width: 100px">Back</button>
                <button type="submit" class="btn btn-primary" style="width: 100px">Continue</button>
                <button>Go To Home Page (Test)</button>
            </form:form>--%>
        </div>
    </div>
</div>

</div>
</body>
</html>
