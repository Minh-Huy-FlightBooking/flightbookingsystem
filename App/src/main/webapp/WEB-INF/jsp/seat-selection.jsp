<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery Seat Charts Plugin Demo</title>
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

    <%--Javascript External Link is placed here--%>
    <jsp:include page="administration/_head.jsp"/>
    <%--<link rel="stylesheet" type="text/css" href="/resources/js/seat-charts.js">--%>
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

    <script>
        $(document).ready(function () {
            /*var rowCount = $('#myTable tr').length;*/
        })
    </script>
</head>

<body>

<input type="hidden" value="${sessionId}" id="sessionId">
<div class="container-fluid">
    <div class="container">
        <div class="card shadow">
            <div class="card-body">
                <table class="table-borderless">
                    <thead>
                        <th>A</th>
                        <th>B</th>
                        <th>C</th>
                        <th></th>
                        <th>D</th>
                        <th>E</th>
                        <th>F</th>
                    </thead>
                    <tbody>
                        <c:forEach begin="1" end="${flight.aircraft.total_economy/6+1}">
                            <tr>
                                <c:forEach begin="1" end="6">
                                    <td align="center">${flight.aircraft.total_economy}</td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
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
