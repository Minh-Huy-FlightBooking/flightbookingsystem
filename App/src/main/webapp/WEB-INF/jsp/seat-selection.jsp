<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery Seat Charts Plugin Demo</title>
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

    <%--Javascript External Link is placed here--%>
    <link rel="stylesheet" type="text/css" href="/resources/js/seat-charts.js">
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color:#fafafa;
        }
        a {
            color: #b71a4c;
        }
        .front-indicator {
            width: 145px;
            margin: 5px 32px 15px 32px;
            background-color: #f6f6f6;
            color: #adadad;
            text-align: center;
            padding: 3px;
            border-radius: 5px;
        }
        .wrapper {
            width: 100%;
            text-align: center;
            margin-top:150px;
        }
        .container {
            margin: 0 auto;
            width: 500px;
            text-align: left;
        }
        .booking-details {
            float: left;
            text-align: left;
            margin-left: 35px;
            font-size: 12px;
            position: relative;
            height: 401px;
        }
        .booking-details h2 {
            margin: 25px 0 20px 0;
            font-size: 17px;
        }
        .booking-details h3 {
            margin: 5px 5px 0 0;
            font-size: 14px;
        }
        div.seatCharts-cell {
            color: #182C4E;
            height: 25px;
            width: 25px;
            line-height: 25px;

        }
        div.seatCharts-seat {
            color: #FFFFFF;
            cursor: pointer;
        }
        div.seatCharts-row {
            height: 35px;
        }
        div.seatCharts-seat.available {
            background-color: #B9DEA0;

        }
        div.seatCharts-seat.available.first-class {
            /* 	background: url(vip.png); */
            background-color: #3a78c3;
        }
        div.seatCharts-seat.focused {
            background-color: #76B474;
        }
        div.seatCharts-seat.selected {
            background-color: #E6CAC4;
        }
        div.seatCharts-seat.unavailable {
            background-color: #472B34;
        }
        div.seatCharts-container {
            border-right: 1px dotted #adadad;
            width: 200px;
            padding: 20px;
            float: left;
        }
        div.seatCharts-legend {
            padding-left: 0px;
            position: absolute;
            bottom: 16px;
        }
        ul.seatCharts-legendList {
            padding-left: 0px;
        }
        span.seatCharts-legendDescription {
            margin-left: 5px;
            line-height: 30px;
        }
        .checkout-button {
            display: block;
            margin: 10px 0;
            font-size: 14px;
        }
        #selected-seats {
            max-height: 90px;
            overflow-y: scroll;
            /*overflow-x: none;*/
            width: 170px;
        }
    </style>
    <script type="text/javascript"><!--
    google_ad_client = "ca-pub-2783044520727903";
    /* jQuery_demo */
    google_ad_slot = "2780937993";
    google_ad_width = 728;
    google_ad_height = 90;
    //-->
    </script>

    <script type="text/javascript"
            src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
    </script>

    <script>
        var firstSeatLabel = 1;

        $(document).ready(function() {
            var $cart = $('#selected-seats'),
                $counter = $('#counter'),
                $total = $('#total'),
                sc = $('#seat-map').seatCharts({
                    map: [
                        'ff_ff',
                        'ff_ff',
                        'ee_ee',
                        'ee_ee',
                        'ee___',
                        'ee_ee',
                        'ee_ee',
                        'ee_ee',
                        'eeeee',
                    ],
                    seats: {
                        f: {
                            price   : 100,
                            classes : 'first-class', //your custom CSS class
                            category: 'First Class'
                        },
                        e: {
                            price   : 40,
                            classes : 'economy-class', //your custom CSS class
                            category: 'Economy Class'
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
                            [ 'f', 'available',   'First Class' ],
                            [ 'e', 'available',   'Economy Class'],
                            [ 'f', 'unavailable', 'Already Booked']
                        ]
                    },
                    click: function () {
                        if (this.status() == 'available') {
                            //let's create a new <li> which we'll add to the cart items
                            $('<li>'+this.data().category+' Seat # '+this.settings.label+': <b>$'+this.data().price+'</b> <a href="#" class="cancel-cart-item">[cancel]</a></li>')
                                .attr('id', 'cart-item-'+this.settings.id)
                                .data('seatId', this.settings.id)
                                .appendTo($cart);

                            /*
                             * Lets update the counter and total
                             *
                             * .find function will not find the current seat, because it will change its stauts only after return
                             * 'selected'. This is why we have to add 1 to the length and the current seat price to the total.
                             */
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

            //this will handle "[cancel]" link clicks
            $('#selected-seats').on('click', '.cancel-cart-item', function () {
                //let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
                sc.get($(this).parents('li:first').data('seatId')).click();
            });

            //let's pretend some seats have already been booked
            sc.get(['1_2', '4_1', '7_1', '7_2']).status('unavailable');

        });

        function recalculateTotal(sc) {
            var total = 0;

            //basically find every selected seat and sum its price
            sc.find('selected').each(function () {
                total += this.data().price;
            });

            return total;
        }

    </script>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>
</head>

<body><div id="jquery-script-menu">
    <div class="jquery-script-center">
        <div class="jquery-script-ads">
           </div>
        <div class="jquery-script-clear"></div>
    </div>
</div>
<div class="wrapper">
    <div class="container">
        <h1>jQuery Seat Charts Plugin Demo</h1>
        <div id="seat-map">
            <div class="front-indicator">Front</div>
        </div>
        <div class="booking-details">
            <h2>Booking Details</h2>
            <h3> Selected Seats (<span id="counter">0</span>):</h3>
            <ul id="selected-seats">
            </ul>
            Total: <b>$<span id="total">0</span></b>
            <button class="checkout-button">Checkout &raquo;</button>
            <div id="legend"></div>
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
