<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Seat Charts</title>
    <%--Javascript External Link is placed here--%>
    <jsp:include page="administration/_head.jsp"/>
    <script>
        let sessionId ;
        $(document).ready(function () {
            sessionId = $('#sessionId').val();
            let previousObject = sessionStorage.getItem(sessionId);
            previousObject = JSON.parse(previousObject);
            console.log(previousObject);
            //Auto fill id and value for departure seats
            //Number of Rows and number of columns per row
            let numberOfColumns = $('#departure-table .departure-seat-container td').length;
            console.log(numberOfColumns);
            let table = document.getElementById("departure-table");
            let tr = table.getElementsByTagName("tr");
            let td;
            console.log(tr.length);
            console.log(numberOfColumns / (tr.length - 1));

            let alphabet = new Array("A", "B", "C", "", "D", "E", "F");
            console.log(alphabet[1]);

            /*td.getElementsByTagName("button").namedItem("seat-item").setAttribute("onclick", "getSeatCode('" + "seatCode-" + alphabet[j] + i + "')");*/
            for (let i = 1; i < tr.length; i++) {
                for (let j = 0; j < (numberOfColumns / (tr.length - 1)); j++) {
                    td = tr[i].getElementsByTagName("td")[j];
                    td.setAttribute("id", "departure-seatCode-" + alphabet[j] + i);
                    if (j != 3) {
                        td.getElementsByTagName("span").namedItem("departure-seat-item").setAttribute("onclick", "getDepartureSeatCode('" + "seatCode-" + alphabet[j] + i + "')");
                        td.append("" + alphabet[j] + i);
                        let key = "departure-seatCode-" + alphabet[j] + i;
                        seatBookedData.push({key: key, value: true});
                    }
                    if (j == 3) {
                        td.innerHTML = "" + i;
                    }
                }
            }
            console.log(seatBookedData);

            //Auto fill id and value for return seats
            //Number of Rows and number of columns per row
            let numberOfColumns2 = $('#return-table .return-seat-container td').length;
            console.log(numberOfColumns2);
            let table2 = document.getElementById("return-table");
            let tr2 = table2.getElementsByTagName("tr");
            let td2;
            console.log(tr2.length);
            console.log(numberOfColumns2 / (tr2.length - 1));

            /*td.getElementsByTagName("button").namedItem("seat-item").setAttribute("onclick", "getSeatCode('" + "seatCode-" + alphabet[j] + i + "')");*/
            for (let i = 1; i < tr2.length; i++) {
                for (let j = 0; j < (numberOfColumns2 / (tr2.length - 1)); j++) {
                    td2 = tr2[i].getElementsByTagName("td")[j];
                    td2.setAttribute("id", "return-seatCode-" + alphabet[j] + i);
                    if (j != 3) {
                        td2.getElementsByTagName("span").namedItem("return-seat-item").setAttribute("onclick", "getReturnSeatCode('" + "return-seatCode-" + alphabet[j] + i + "')");
                        td2.append("" + alphabet[j] + i);
                        let key = "return-seatCode-" + alphabet[j] + i;
                        seatBookedData.push({key: key, value: true});
                    }
                    if (j == 3) {
                        td2.innerHTML = "" + i;
                    }
                }
            }
            console.log(seatBookedData);
            //Generate Id for passenger Turn
            let departureNames = document.getElementById("departureNames").getElementsByTagName("li");
            console.log(departureNames.length);
            for (let i = 1; i <= departureNames.length; i++){
                $('#departureNames li').eq(i - 1).attr("id", "departurePassenger-" + i);
                $('#departureNames li').eq(i - 1).attr("onclick", "getSeatSelectionTurn('departurePassenger-" + i + "')");
            }

            let returnNames = document.getElementById("returnNames").getElementsByTagName("li");
            console.log(returnNames.length);
            for (let i = 1; i <= returnNames.length; i++) {
                $('#returnNames li').eq(i - 1).attr("id", "returnPassenger-" + i);
                $('#returnNames li').eq(i - 1).attr("onclick", "getSeatSelectionTurn('returnPassenger-" + i + "')");
            }

        })

        let seatBookedData = [];

        /*function getDepartureSeatCode(seatCode) {
            console.log("clicked!!: " + seatCode);

            console.log(currentPassengerSelected);
            let x = $('#' + currentPassengerSelected + ' input').val();
            console.log(x);

            $('#' + currentPassengerSelected + ' input:text').val(seatCode);
            let seatPossession = {
                seatCode: "",
                passengerName: ""
            };
            let count = 0;
            for (let m = 0; m < departureSeatPossession.length; m++) {
                if (departureSeatPossession[m].passengerName == currentPassengerSelected) {
                    count++;
                }
            }

            if (count == 0) {
                departureSeatPossession.push({
                    seatCode: $('#' + currentPassengerSelected + ' input').val(),
                    passengerName: currentPassengerSelected
                });
            } else {
                for (let m = 0; m < departureSeatPossession.length; m++) {
                    if (departureSeatPossession[m].passengerName == currentPassengerSelected) {
                        departureSeatPossession[m].passengerName = currentPassengerSelected;
                    }
                }

            }
        }
                function getReturnSeatCode(seatCode) {
                    if (!(currentPassengerSelected.indexOf("depart") > -1)){
                        console.log("clicked!!: " + seatCode);
                        console.log(currentPassengerSelected);
                        let x = $('#' + currentPassengerSelected + ' input').val();
                        console.log(x);

                        $('#' + currentPassengerSelected + ' input:text').val(seatCode);
                        let seatPossession = {
                            seatCode: "",
                            passengerName: ""
                        };
                        let count = 0;
                        for (let m = 0; m < returnSeatPossession.length; m++) {
                            if (returnSeatPossession[m].passengerName == currentPassengerSelected) {
                                count++;
                            }
                        }

                        if (count == 0) {
                            returnSeatPossession.push({
                                seatCode: $('#' + currentPassengerSelected + ' input').val(),
                                passengerName: currentPassengerSelected
                            });
                        } else {
                            for (let m = 0; m < returnSeatPossession.length; m++) {
                                if (returnSeatPossession[m].passengerName == currentPassengerSelected) {
                                    returnSeatPossession[m].passengerName = currentPassengerSelected;
                                }
                            }
                        }
                    }

                }*/

                let currentPassengerSelected;
                let departureSeatPossession = new Array();
                let returnSeatPossession = new Array();

        function getDepartureSeatCode(seatCode) {
            if (currentPassengerSelected != null) {
                console.log("clicked!!: " + seatCode);

                console.log(currentPassengerSelected);
                let x = $('#' + currentPassengerSelected + ' input[name=departureSeatCode]').val();
                console.log(x);

                $('#' + currentPassengerSelected + ' input[name=departureSeatCode]').val(seatCode);
                let seatPossession = {
                    seatCode: "",
                    passengerName: ""
                };
                let count = 0;
                for (let m = 0; m < departureSeatPossession.length; m++) {
                    if (departureSeatPossession[m].passengerName == $('#' + currentPassengerSelected + ' input[name=departurePassengerName]').val()) {
                        count++;
                    }
                }

                if (count == 0) {
                    departureSeatPossession.push({
                        seatCode: $('#' + currentPassengerSelected + ' input[name=departureSeatCode]').val(),
                        passengerName: $('#' + currentPassengerSelected + ' input[name=departurePassengerName]').val()
                    });
                } else {
                    for (let m = 0; m < departureSeatPossession.length; m++) {
                        if (departureSeatPossession[m].passengerName == $('#' + currentPassengerSelected + ' input[name=departurePassengerName]').val()) {
                            departureSeatPossession[m].passengerName = $('#' + currentPassengerSelected + ' input[name=departurePassengerName]').val();
                        }
                    }

                }
            }
        }
        function getReturnSeatCode(seatCode) {
            if (!(currentPassengerSelected.indexOf("depart") > -1)){
                console.log("clicked!!: " + seatCode);
                console.log(currentPassengerSelected);
                let x = $('#' + currentPassengerSelected + ' input[name=returnSeatCode]').val();
                console.log(x);

                $('#' + currentPassengerSelected + ' input[name=returnSeatCode]').val(seatCode);
                let seatPossession = {
                    seatCode: "",
                    passengerName: ""
                };
                let count = 0;
                for (let m = 0; m < returnSeatPossession.length; m++) {
                    if (returnSeatPossession[m].passengerName == $('#' + currentPassengerSelected + ' input[name=returnPassengerName]').val()) {
                        count++;
                    }
                }

                if (count == 0) {
                    returnSeatPossession.push({
                        seatCode: $('#' + currentPassengerSelected + ' input').val(),
                        passengerName: $('#' + currentPassengerSelected + ' input[name=returnPassengerName]').val()
                    });
                } else {
                    for (let m = 0; m < returnSeatPossession.length; m++) {
                        if (returnSeatPossession[m].passengerName == $('#' + currentPassengerSelected + ' input[name=returnPassengerName]').val()) {
                            returnSeatPossession[m].passengerName = $('#' + currentPassengerSelected + ' input[name=returnPassengerName]').val();
                        }
                    }
                }
            }
        }
        function getSeatSelectionTurn(passengerId) {
            currentPassengerSelected = passengerId;
        }
    </script>
    <script>
        function sendPassengerDataWithSeatCodes() {
            let previousFlightPickerData = JSON.parse(sessionStorage.getItem(sessionId));
            previousFlightPickerData.departureTrip.departureSeatPossession = departureSeatPossession ;
            previousFlightPickerData.returnTrip.returnSeatPossession = returnSeatPossession;
            console.log("Clicked!!!");
            console.log(previousFlightPickerData);
            sessionStorage.setItem(sessionId, JSON.stringify(previousFlightPickerData));

            $.ajax({
                type: "POST",
                url: "flightPickerHandler",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(previousFlightPickerData),
                success: function (data, textStatus, jqXHR) {
                    console.log("send data to backend successfully: ");
                    console.log(data);
                    location.href ="paymentMethod";
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                    console.log("fail");
                }
            });
        }
    </script>
</head>
<body style="font-family: 'Poppins', sans-serif;">
<input type="hidden" id="sessionId" value="${sessionId}">
<div class="container">
    <div class="row">
        <div class="col-sm-3 mt-3">
            <ul class="nav nav-pills list-group" role="tablist">
                <div class="list-group">
                    <a href="#departure" data-toggle="pill" class="list-group-item">Departure Trip</a>
                    <c:if test="${flightReturn != null}">
                        <a href="#return" data-toggle="pill" class="list-group-item">Return Trip</a>
                    </c:if>
                </div>
            </ul>
        </div>

        <div class="col-sm-9">
            <div class="tab-content">
                <div id="departure" class="container tab-pane active"><br>
                    <div class="card shadow">
                        <div class="card-body">
                            <div class="row">
                                <%--Passenger's Seat Record:--%>
                                <div class="col-sm-5">
                                    <h5>Click your name to start selecting a seat.</h5>
                                    <ul style="list-style: none" id="departureNames">
                                        <c:forEach var="name" items="${passengerNames}">
                                            <li class="b-1 my-1">
                                                <button class="mb-1">${name}</button>
                                                <input type="hidden" value="${name}" name="departurePassengerName"/>
                                                <input type="text" readonly value="" name="departureSeatCode"/>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="col-sm-7">
                                    <h1 style="font-weight: 600;font-size: 35px;color: #f39c12" class="text-center">
                                        Departure Trip</h1>
                                    <div class="table-responsive" style="height: 80vh ;overflow-y: scroll">
                                        <table class="table table-borderless" id="departure-table">
                                            <thead>
                                            <tr>
                                                <th class="text-center px-0">A</th>
                                                <th class="text-center px-0">B</th>
                                                <th class="text-center px-0">C</th>
                                                <th class="text-center px-0"></th>
                                                <th class="text-center px-0">D</th>
                                                <th class="text-center px-0">E</th>
                                                <th class="text-center px-0">F</th>
                                            </tr>
                                            </thead>
                                            <tbody class="departure-seat-container">
                                            <c:forEach begin="1" end="${flightDeparture.aircraft.total_economy/6+1}">
                                                <tr class="seat-row">
                                                    <c:forEach begin="1" end="3">
                                                        <td align="center" style="padding: 0.0%">
                                                            <span class="btn btn-sm btn-outline departure-seat-item" name="departure-seat-item">
                                                                <button class="btn btn-info" style="padding: 0; border: none; background: none;">
                                                                    <img src="/resources/image/logo/s-couch.png" width="100%"/>
                                                                </button>
                                                            </span>
                                                        </td>
                                                    </c:forEach>
                                                    <td width="12%" style="text-align: center"></td>
                                                    <c:forEach begin="1" end="3">
                                                        <td align="center" style="padding: 0.0%">
                                                            <span class="btn btn-sm btn-outline departure-seat-item" name="departure-seat-item">
                                                                <button class="btn btn-info" style="padding: 0; border: none; background: none;">
                                                                    <img src="/resources/image/logo/s-couch.png" width="100%">
                                                                </button>
                                                            </span>
                                                        </td>
                                                    </c:forEach>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <c:if test="${flightReturn!=null}">
                    <div id="return" class="container tab-pane fade"><br>
                        <div class="card shadow">
                            <div class="card-body">
                                <div class="row">
                                    <%--Passenger's Seat Record:--%>
                                    <div class="col-sm-5">
                                        Say Hi Here!
                                        <ul style="list-style: none" id="returnNames">
                                            <c:forEach var="name" items="${passengerNames}">
                                                <li class="b-1 my-1">
                                                    <button class="mb-1">${name}</button>
                                                    <input type="hidden" value="${name}" name="returnPassengerName"/>
                                                    <br/>
                                                    <input type="text" readonly value="" name="returnSeatCode"/>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="col-sm-7">
                                        <h1 style="font-weight: 600;font-size: 35px;color: #f39c12" class="text-center">
                                            Return Trip</h1>
                                        <div class="table-responsive" style="height: 80vh;overflow-y: scroll">
                                            <table class="table table-borderless" id="return-table">

                                                <thead>
                                                <tr>
                                                    <th class="text-center px-0">A</th>
                                                    <th class="text-center px-0">B</th>
                                                    <th class="text-center px-0">C</th>
                                                    <th class="text-center px-0"></th>
                                                    <th class="text-center px-0">D</th>
                                                    <th class="text-center px-0">E</th>
                                                    <th class="text-center px-0">F</th>
                                                </tr>
                                                </thead>
                                                <tbody class="return-seat-container">
                                                <c:forEach begin="1" end="${flightReturn.aircraft.total_economy/6+1}">
                                                    <tr class="seat-row">
                                                        <c:forEach begin="1" end="3">
                                                            <td align="center" style="padding: 0.0%">
                                                                <span class="btn btn-sm btn-outline return-seat-item"
                                                                      name="return-seat-item">
                                                                    <button class="btn btn-info"
                                                                            style="padding: 0; border: none; background: none;">
                                                                        <img src="/resources/image/logo/s-couch.png"
                                                                             width="100%"/>
                                                                    </button>
                                                                </span>
                                                            </td>
                                                        </c:forEach>
                                                        <td width="12%" style="text-align: center"></td>
                                                        <c:forEach begin="1" end="3">
                                                            <td align="center" style="padding: 0.0%">
                                                                <span class="btn btn-sm btn-outline return-seat-item"
                                                                      name="return-seat-item">
                                                                    <button class="btn btn-info"
                                                                            style="padding: 0; border: none; background: none;">
                                                                        <img src="/resources/image/logo/s-couch.png"
                                                                             width="100%"/>
                                                                    </button>
                                                                </span>
                                                            </td>
                                                        </c:forEach>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="container">
            <button>Back</button>
            <%--<button id="continue"><a onclick="sendPassengerDataWithSeatCodes()" href="paymentMethod">Continue</a></button>--%>
            <button id="continue" onclick="sendPassengerDataWithSeatCodes()">Continue</button>
        </div>
    </div>
</div>

<br><br><br><br>
</body>
</html>


