<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery Seat Charts Plugin Demo</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,600;0,700;0,800;0,900;1,500&display=swap" rel="stylesheet">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

    <%--Javascript External Link is placed here--%>
    <jsp:include page="administration/_head.jsp"/>
    <link rel="stylesheet" type="text/css" href="/resources/js/seat-charts.js">
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body style="font-family: 'Poppins', sans-serif;">
<div class="container">
    <div class="row">

        <div class="col-sm-3 mt-3">
            <ul class="nav nav-pills list-group" role="tablist">
                <div class="list-group">
                    <a href="#departure" data-toggle="pill" class="list-group-item">Departure Trip</a>
                    <c:if test="${flightReturn!=null}">
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
                                <div class="col-sm-5">

                                </div>
                                <div class="col-sm-7">
                                    <h1 style="font-weight: 600;font-size: 35px;color: #f39c12" class="text-center">Departure Trip</h1>
                                    <div class="table-responsive"style="height: 400px;overflow-y: scroll">
                                        <table class="table table-borderless" >
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
                                            <tbody class="seat-container">
                                            <c:forEach begin="1" end="${flightDepature.aircraft.total_economy/6+1}">
                                                <tr class="seat-row">
                                                    <c:forEach begin="1" end="3">
                                                        <td align="center" style="padding: 0.0%"><span class="btn btn-sm btn-outline seat-item">
                                                <img src="/resources/image/logo/s-couch.png" width="100%"></span></td>
                                                    </c:forEach>
                                                    <td width="12%"></td>
                                                    <c:forEach begin="1" end="3">
                                                        <td align="center" style="padding: 0.0%">
                                                        <span class="btn btn-sm btn-outline seat-item">
                                                        <img src="/resources/image/logo/s-couch.png" width="100%">
                                                        </span></td>
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
                                    <div class="col-sm-5">

                                    </div>
                                    <div class="col-sm-7">
                                        <h1 style="font-weight: 600;font-size: 35px;color: #f39c12" class="text-center">Return Trip</h1>
                                        <div class="table-responsive" style="height: 400px;overflow-y: scroll">
                                            <table class="table table-borderless">

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

                                                <tbody class="seat-container">
                                                <c:forEach begin="1" end="${flightReturn.aircraft.total_economy/6+1}">
                                                    <tr class="seat-row">
                                                        <c:forEach begin="1" end="3">
                                                            <td align="center" style="padding: 0.0%">
                                                    <span class="btn btn-sm btn-outline seat-item">
                                                    <img src="/resources/image/logo/s-couch.png" width="100%">
                                                    </span>
                                                            </td>
                                                        </c:forEach>
                                                        <td width="12%"></td>
                                                        <c:forEach begin="1" end="3">
                                                            <td align="center" style="padding: 0.0%"><span class="btn btn-sm btn-outline seat-item">
                                                <img src="/resources/image/logo/s-couch.png" width="100%"></span></td>
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

    </div>
</div>

<br><br><br><br>
</body>
</html>

<%--
<%@ page import="javax.websocket.Session" %>&lt;%&ndash;
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/27/20
  Time: 1:56 PM
  To change this template use File | Settings | File Templates.
&ndash;%&gt;
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <script language="JavaScript">
    </script>
    <title>Title</title>

    <script>
        var $cart = $('#selected-seats'),
            $counter = $('#counter'),
            $total = $('#total'),
            sc = $('#seat-map').seatCharts({
                map: [
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaa__aaaaaaa',
                    'aaaaaaaaaaaaaaaaa'
                ],
                seats: {
                    a: {
                        price   : 50,
                        classes : 'first-class', //your custom CSS class
                        category: 'First Class'
                    }

                },
                naming : {
                    top : false,
                    getLabel : function (character, row, column) {
                        return firstSeatLabel++;
                    },
                },
                legend : {
                    node : $('#legend'),
                    items : [
                        [ 'a', 'available',   'First Class' ],
                        [ 'a', 'unavailable', 'Already Booked']

                    ]
                },
                click: function () {
                    if (this.status() == 'available') {
                        //let's create a new <li> which we'll add to the cart items
                        /*$('<li>'+this.data().category+' Seat # '+this.settings.label+': <b>$'+this.data().price+'</b> <a href="#" class="cancel-cart-item">[cancel]</a></li>')
                            .attr('id', 'cart-item-'+this.settings.id)
                            .data('seatId', this.settings.id)
                            .appendTo($cart);*/
                        $('<span class="badge badge-primary">'+this.settings.label+'</b></span>')
                            .attr('id', 'cart-item-'+this.settings.id)
                            .data('seatId', this.settings.id)
                            .appendTo($cart);
                        $counter.text(sc.find('selected').length+1);
                        $total.text(recalculateTotal(sc)+this.data().price);

                        return 'selected';
                    } else if (this.status() == 'selected') {
                        //update the counter
                        $counter.text(sc.find('selected').length-1);
                        //and total
                        $total.text(recalculateTotal(sc)-this.data().price);

                        //remove the item from our cart
                        $('#cart-item-'+this.settings.id).remove();

                        //seat has been vacated
                        return 'available';
                    } else if (this.status() == 'unavailable') {
                        //seat has been already booked
                        return 'unavailable';
                    } else {
                        return this.style();
                    }
                }
            });
    </script>
</head>
<body>
    <div>
        <div>

        </div>
    </div>
</body>
</html>
--%>
