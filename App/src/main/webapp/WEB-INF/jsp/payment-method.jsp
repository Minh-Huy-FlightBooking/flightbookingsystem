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
    <title>Title</title>
    <jsp:include page="administration/_head.jsp"/>
    <script>
        $(document).ready(function () {
            //Number of Rows and number of columns per row
            let numberOfColumns = $('#departure-table .seat-container td').length;
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
                    td.setAttribute("id", "seatCode-" + alphabet[j] + i);
                    if (j != 3) {
                        td.getElementsByTagName("button").namedItem("seat-item").setAttribute("onclick", "getSeatCode('" + "seatCode-" + alphabet[j] + i + "')");
                        td.append("" + alphabet[j] + i);
                        let key = "seatCode-" + alphabet[j] + i;
                        seatBookedData.push({key: key, value: true});
                    }
                    if (j == 3) {
                        td.innerHTML = "" + i;
                    }
                }
            }
            console.log(seatBookedData);


        })

        let seatBookedData = [];
        /*let x = {
            key : "",
            value: true
        }*/
        /*let numberOfPassengers = 2;
        let seatCodeIsClicked = "";*/
        function getSeatCode(seatCode) {
            console.log("clicked!!: " + seatCode);
            /*$('#' + seatCode + ' button').attr("style","background: red");*/

            for (let m = 0; m < seatBookedData.length; m++) {
                if (seatBookedData[m].key == seatCode && seatBookedData[m].value == true) {
                    console.log("HI!!");
                    seatBookedData[m].value = false;
                    /*if (seatCodeIsClicked != "") {
                        $('#' + seatCodeIsClicked + ' button').attr("style","background: white");
                    }*/
                    $('#' + seatCode + ' button').attr("style", "background: red");
                } else if (seatBookedData[m].key == seatCode && seatBookedData[m].value == false) {
                    $('#' + seatCode + ' button').attr("style", "background: white");
                    seatBookedData[m].value = true;
                }
            }
            /*let count = 0;
            for (let n = 0; n < seatBookedData.length; n++) {
                if (seatBookedData[n].value == false){
                    count++;
                }
            }

            console.log(count)
            if (count < numberOfPassengers) {
                for (let m = 0; m < seatBookedData.length; m++) {
                    if (seatBookedData[m].key == seatCode && seatBookedData[m].value == true){
                        console.log("HI!!");
                        seatBookedData[m].value = false;
                        $('#' + seatCode + ' button').attr("style","background: red");
                    } else if (seatBookedData[m].key == seatCode && seatBookedData[m].value == false){
                        $('#' + seatCode + ' button').attr("style","background: white");
                        seatBookedData[m].value = true;
                    }
                }
            } else if (count >= numberOfPassengers){
                for (let m = 0; m < seatBookedData.length; m++) {
                    if (seatBookedData[m].key == seatCode && seatBookedData[m].value == true){
                        console.log("HI!!");
                        seatBookedData[m].value = false;
                        if (seatCodeIsClicked != "") {
                            $('#' + seatCodeIsClicked + ' button').attr("style","background: white");
                        }
                        $('#' + seatCode + ' button').attr("style","background: red");
                    } else if (seatBookedData[m].key == seatCode && seatBookedData[m].value == false){
                        $('#' + seatCode + ' button').attr("style","background: white");
                        seatBookedData[m].value = true;
                    }
                }
            }

            seatCodeIsClicked = seatCode;*/
        }
    </script>
</head>
<body>
<h1>Payment Page</h1>
<h1>Pay through credit card</h1>
<button>Online bank</button>

<div class="container" id="departure-table">
    <div class="card shadow col-sm-6">
        <div class="card-body">
            <table class="table table-borderless">
                <thead>
                <th class="text-center" width="100" height="50">A</th>
                <th class="text-center" width="100" height="50">B</th>
                <th class="text-center" width="100" height="50">C</th>
                <th class="text-center" width="100" height="50"></th>
                <th class="text-center" width="100" height="50">D</th>
                <th class="text-center" width="100" height="50">E</th>
                <th class="text-center" width="100" height="50">F</th>
                </thead>
                <tbody class="seat-container">
                <c:forEach begin="1" end="10">
                    <tr class="seat-row">
                        <c:forEach begin="1" end="3">
                            <td align="center">
                                <button class="btn btn-sm btn-outline-primary seat-item" name="seat-item"></button>
                            </td>
                        </c:forEach>

                        <td></td>

                        <c:forEach begin="1" end="3">
                            <td align="center">
                                <button class="btn btn-sm btn-outline-primary seat-item" name="seat-item"></button>
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
