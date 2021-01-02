<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/26/2020
  Time: 7:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title></title>
    <jsp:include page="css.jsp"/>
    <style>
        a.active{
            background-color: #f7f7f7;
            font-weight: bold;
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
        #login-btn{
            background-color: #ffffff;
            font-weight: 600;
            color: #9a9a9d;
            min-width: 95px;
            font-size: 15px;
            line-height: 17px;
            padding: 10px 15px;
        }
        #login-btn:hover{
            background-color: #f2f2f2;
            border-color: transparent;
            color: #9a9a9d;
        }
        .carousel-indicators li {
            width: 20px;
            height: 20px;
            border-radius: 100%;
        }
        .carousel-container{
            background: linear-gradient(180deg,transparent 79.81%,rgba(0,0,0,.3)),linear-gradient(256.23deg,#cf3c3f -1.09%,#f48c83 46.25%,#d82f33 101.02%);
        }
        .navbar-toggler-icon {
            color: rgba(0,0,0,.5);
            border-color: rgba(0,0,0,.1);
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255,102,203, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 8h24M4 16h24M4 24h24'/%3E%3C/svg%3E");
        }
        .city-input-label{
            font-size: 14px;
            line-height: 17px;
            font-weight: 700;
        }
        .airport-input{
            font-size: 12px;
            line-height: 14px;
            font-weight: 400;
        }
        input[type='text'],input[type='date'],input[type='number']{
            font-weight: 700;
            font-size: 14px;
            line-height: 17px;
            color: #59595b;
        }
    </style>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
        $(function () {
            $('[data-toggle="popover"]').popover()
        })
        $(document).click( function(){
            $('.dropdown-menu').hide();
        });
    </script>
</head>

<body style="min-height: 1500px;font-family: 'Poppins', sans-serif;">
<%--fixed navbar--%>
<nav class="navbar navbar-expand-md fixed-top bg-white border-bottom" style="height: 75px;padding: 0 10vw 0 10vw;">
    <a class="navbar-brand" href="#" style="font-size: 40px;font-weight: 600;color: #f39c12">
        Airpaz
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item py-3 active">
                <a class="nav-link" href="#">Flight</a>
            </li>
            <li class="nav-item py-3">
                <a class="nav-link" href="#">Promo</a>
            </li>
            <li class="nav-item py-3">
                <a class="nav-link" href="#">Order</a>
            </li>
            <li class="nav-item py-3">
                <a class="nav-link" href="#">Booking</a>
            </li>
        </ul>
        <div class="mt-2 mt-md-0">
            <a href="/login" class="btn my-2 my-sm-0 shadow-sm" id="login-btn">Login</a>
        </div>
    </div>
</nav>
<%--end nav--%>
<%--slider--%>
<div class="container-fluid px-0 carousel-container" style="margin-top: 75px">
    <div id="myCarousel" class="carousel slide" style="width: 50%;margin-left: 22.5%;padding: 5% 0 5% 0" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner shadow-lg">
            <div class="carousel-item active">
                <img src="https://cdn.airpaz.com/banner/find-cheap-flight-tickets-on-Airpaz.com-NL-3.jpg" class="img-fluid rounded-lg">
            </div>
            <div class="carousel-item">
                <img src="https://cdn.airpaz.com/banner/Bamboo-Airways-NL-8797.jpg" class="img-fluid rounded-lg">
            </div>
            <div class="carousel-item">
                <img src="https://cdn.airpaz.com/banner/Airpaz-booking-hotel-online-hdesktop1.jpg" class="img-fluid rounded-lg">
            </div>
        </div>
        <!-- Controls -->
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<%--end slider--%>
<%--Search flight--%>
<div class="container-fluid px-0 bg-white shadow" style="height: 10%">
<%--    Choose flight style--%>
    <div class="row" style="height: 42%;margin: 0 9% 0 9%">
        <div class="custom-control custom-radio pl-0" style="margin: 1rem 0 0 0">
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" class="custom-control-input" id="customRadio" name="example" value="customEx" checked>
                <label class="custom-control-label" for="customRadio">One way</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" class="custom-control-input" id="customRadio2" name="example" value="customEx">
                <label class="custom-control-label" for="customRadio2">Round Trip</label>
            </div>
        </div>
    </div>
<%--    end--%>
<%--    Enter infor flight--%>
    <div class="row d-flex border rounded-lg" style="height: 47%;margin: 0 9% 0 9%">
        <div class="form-group col-sm-2 border-right h-100">
            <label><small class="form-text text-muted">From</small></label>
            <input type="text" class="form-control form-control-sm border-0 dropdown-toggle" data-toggle="dropdown" placeholder="Select Departure City">
            <div class="dropdown-menu keep-open p-0" style="width: 259%;height: 440%;overflow-y: auto;user-select: none;">
<%--                departure city--%>
                <div class="dropdown-item pt-2 pl-3" style="background-color: #f7f7f7">
                    <div class="d-flex flex-row" style="width: 100%;height: 48px">
                        <label style="font-size: 18px;line-height: 22px;font-weight: 700;color: #59595b">Select Departure City</label>
                    </div>
                </div>
                <div class="dropdown-item p-0">
                    <div class="d-flex flex-row align-items-center" style="width: 100%;height: 68px">
                        <div class="col-sm-2">
                            <i class="fa fa-paper-plane-o fa-2x" aria-hidden="true"></i>
                        </div>
                        <div class="col-sm-8">
                            <label class="city-input-label pt-2">Ho Chi Minh City, Viet Nam</label>
                            <p class="airport-input text-muted">Tan Son Nhat Airport</p>
                        </div>
                        <div class="col-sm-2">SGN</div>
                    </div>
                </div>
                <div class="dropdown-item p-0">
                    <div class="d-flex flex-row align-items-center" style="width: 100%;height: 68px">
                        <div class="col-sm-2">
                            <i class="fa fa-paper-plane-o fa-2x" aria-hidden="true"></i>
                        </div>
                        <div class="col-sm-8">
                            <label class="city-input-label pt-2">Hanoi, Viet Nam</label>
                            <p class="airport-input text-muted">Noi Bai Airport</p>
                        </div>
                        <div class="col-sm-2">HAN</div>
                    </div>
                </div>
                <div class="dropdown-item p-0">
                    <div class="d-flex flex-row align-items-center" style="width: 100%;height: 68px">
                        <div class="col-sm-2">
                            <i class="fa fa-paper-plane-o fa-2x" aria-hidden="true"></i>
                        </div>
                        <div class="col-sm-8">
                            <label class="city-input-label pt-2">Hue, Viet Nam</label>
                            <p class="airport-input text-muted">Phu Bai Airport</p>
                        </div>
                        <div class="col-sm-2">HUI</div>
                    </div>
                </div>
<%--                end departure--%>
            </div>
        </div>
        <div class="form-group col-sm-2 border-right h-100">
            <label><small class="form-text text-muted">To</small></label>
            <input type="text" class="form-control form-control-sm border-0 dropdown-toggle" data-toggle="dropdown" placeholder="Select Destination City">
            <div class="dropdown-menu keep-open p-0" style="width: 259%;height: 440%;overflow-y: auto;user-select: none;">
<%--                destination city--%>
                <div class="dropdown-item pt-2 pl-3" style="background-color: #f7f7f7">
                    <div class="d-flex flex-row" style="width: 100%;height: 48px">
                        <label class="font-weight-bold" style="font-size: 18px;line-height: 22px;font-weight: 700;color: #59595b">Select Destination City</label>
                    </div>
                </div>
                <div class="dropdown-item p-0">
                    <div class="d-flex flex-row align-items-center" style="width: 100%;height: 68px">
                        <div class="col-sm-2">
                            <i class="fa fa-paper-plane-o fa-2x" aria-hidden="true"></i>
                        </div>
                        <div class="col-sm-8">
                            <label class="city-input-label pt-2">Ho Chi Minh City, Viet Nam</label>
                            <p class="airport-input text-muted">Tan Son Nhat Airport</p>
                        </div>
                        <div class="col-sm-2">SGN</div>
                    </div>
                </div>
                <div class="dropdown-item p-0">
                    <div class="d-flex flex-row align-items-center" style="width: 100%;height: 68px">
                        <div class="col-sm-2">
                            <i class="fa fa-paper-plane-o fa-2x" aria-hidden="true"></i>
                        </div>
                        <div class="col-sm-8">
                            <label class="city-input-label pt-2">Hanoi, Viet Nam</label>
                            <p class="airport-input text-muted">Noi Bai Airport</p>
                        </div>
                        <div class="col-sm-2">HAN</div>
                    </div>
                </div>
                <div class="dropdown-item p-0">
                    <div class="d-flex flex-row align-items-center" style="width: 100%;height: 68px">
                        <div class="col-sm-2">
                            <i class="fa fa-paper-plane-o fa-2x" aria-hidden="true"></i>
                        </div>
                        <div class="col-sm-8">
                            <label class="city-input-label pt-2">Hue, Viet Nam</label>
                            <p class="airport-input text-muted">Phu Bai Airport</p>
                        </div>
                        <div class="col-sm-2">HUI</div>
                    </div>
                </div>
<%--                end destination city--%>
            </div>
        </div>
<%--        Departure in One way--%>
<%--                <div class="form-group col-sm-4 border-right h-100">--%>
<%--                    <label for=""><small class="form-text text-muted">Departure Date</small></label>--%>
<%--                    <input type="date" class="form-control form-control-sm border-0">--%>
<%--                </div>--%>
<%--        end departure date one way--%>
        <%--        Date departure and return in Round Trip--%>
        <div class="form-group col-sm-2 border-right h-100">
            <label><small class="form-text text-muted">Departure Date</small></label>
            <input type="date" class="form-control form-control-sm border-0">
        </div>
        <div class="form-group col-sm-2 border-right h-100">
            <label><small class="form-text text-muted">Return Date</small></label>
            <input type="date" class="form-control form-control-sm border-0">
        </div>
        <%--        end departure and return--%>
<%--                Travel Class--%>
        <div class="form-group col-sm-1 border-right h-100">
            <label><small class="form-text text-muted">Class</small></label>
            <input  type="text" id="travelClass" class="form-control form-control-sm border-0 bg-white dropdown-toggle" data-toggle="dropdown" placeholder="All" readonly="true"/>
            <div class="dropdown-menu keep-open p-0" style="width: 120px;user-select: none;">
                <div class="dropdown-item pt-2" style="background-color: #f7f7f7">
                    <div class="d-flex flex-column" style="width: 100%;height: 48px">
                        <label class="font-weight-bold" style="font-size: 18px;line-height: 22px;font-weight: 700;color: #59595b">Travel Class</label>
                    </div>
                </div>
                <a class="dropdown-item p-0">
                    <div class="d-flex flex-column align-items-center" id="travel-class-all" style="width: 100%;height: 48px">
                        <div class="p-2">All</div>
                    </div>
                </a>
                <a class="dropdown-item p-0">
                    <div class="d-flex flex-column align-items-center" id="travel-class-economy" style="width: 100%;height: 48px">
                        <div class="p-2">Economy</div>
                    </div>
                </a>
                <a class="dropdown-item p-0">
                    <div class="d-flex flex-column align-items-center" id="travel-class-business" style="width: 100%;height: 48px">
                        <div class="p-2">Business</div>
                    </div>
                </a>
            </div>
        </div>
<%--                end travel class--%>
<%--                Passenger--%>
        <div class="form-group col-sm-2 border-right h-100">
            <label><small class="form-text text-muted">Passenger</small></label>
            <input type="text" id="quantity-passengers" class="form-control form-control-sm border-0 bg-white dropdown-toggle" data-toggle="dropdown" value="1 Passenger" readonly>
            <div class="dropdown-menu keep-open p-0" style="width: 400px;user-select: none;">
                <div class="list-group-item pt-2" style="background-color: #f7f7f7">
                    <div class="d-flex flex-column" style="width: 100%;height: 45px">
                        <label style="font-size: 18px;line-height: 22px;font-weight: 700;color: #59595b">Passengers</label>
                    </div>
                </div>
                <div class="dropdown-item p-0">
                    <div class="d-flex flex-row align-items-center p-1 mt-2" style="width: 100%;height: 51px">
                        <div class="col-sm-7">
                            <label style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b" class="pt-2">Adults</label>
                            <p class="text-muted" style="font-size: 12px;line-height: 14px;font-weight: 400;">Age 12+</p>
                        </div>
                        <div class="col-sm-5">
                            <div class="d-flex flex-row">
                                <button type="button" class="btn btn-sm btn-outline-danger py-0 minus-adults disabled" style="height: 28px"><i class="fa fa-minus"></i></button>
<%--                                <form:input path="adults" id="adults" type="text" class="form-control mx-1 text-center bg-white" style="height: 28px" value="0" readonly="true"/>--%>
                                <input  type="text" id="quantity-adults" class="form-control mx-1 text-center bg-white" style="height: 28px" value="1">
                                <button type="button" class="btn btn-sm btn-outline-danger py-0 plus-adults" style="height: 28px"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="my-0">
                <div class="dropdown-item p-0">
                    <div class="d-flex flex-row align-items-center p-1 mt-2" style="width: 100%;height: 51px">
                        <div class="col-sm-7">
                            <label style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b" class="pt-2">Childrens</label>
                            <p class="text-muted" style="font-size: 12px;line-height: 14px;font-weight: 400;">Age 2-11</p>
                        </div>
                        <div class="col-sm-5">
                            <div class="d-flex flex-row">
                                <button type="button" class="btn btn-sm btn-outline-danger py-0 minus-childrens disabled" style="height: 28px"><i class="fa fa-minus"></i></button>
<%--                                <form:input path="children" id="childrens" type="text" class="form-control mx-1 text-center bg-white" style="height: 28px;" value="0" readonly="true" />--%>
                                <input type="text" id="quantity-childrens" class="form-control mx-1 text-center bg-white" style="height: 28px;" value="0" readonly="true" />
                                <button type="button" class="btn btn-sm btn-outline-danger py-0 plus-childrens" style="height: 28px"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="my-0">
                <div class="dropdown-item p-0">
                    <div class="d-flex flex-row align-items-center p-1 mt-2" style="width: 100%;height: 51px">
                        <div class="col-sm-7">
                            <label style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b" class="pt-2">Infants</label>
                            <p class="text-muted" style="font-size: 12px;line-height: 14px;font-weight: 400;"><2 years</p>
                        </div>
                        <div class="col-sm-5">
                            <div class="d-flex flex-row">
                                <button type="button" class="btn btn-sm btn-outline-danger py-0 minus-infants disabled" style="height: 28px"><i class="fa fa-minus"></i></button>
<%--                                <form:input path="infant" id="infants" type="text" class="form-control mx-1 text-center bg-white" style="height: 28px" value="0"  readonly="true"/>--%>
                                <input type="text" id="quantity-infants" class="form-control mx-1 text-center bg-white" style="height: 28px" value="0"  readonly="true"/>
                                <button type="button" class="btn btn-sm btn-outline-danger py-0 plus-infants" style="height: 28px"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--        end passenger--%>
<%--        Button Search--%>
        <div class="form-group col-sm-1 rounded-right h-100 p-0">
            <button type="submit" class="btn btn-danger rounded-0 border-0 h-100 w-100" placeholder="Select Return City">
                <i class="fa fa-search fa-2x"></i>
            </button>
        </div>
<%--        end button search--%>
    </div>
<%--    end enter infor flight--%>
</div>
<%--end search flight--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/home-page.js"></script>
<script>
    $('.dropdown-toggle').on('click', function (e) {
        $(this).next().toggle();
    });
    $('.dropdown-menu.keep-open').on('click', function (e) {
        e.stopPropagation();
    });
</script>
</body>
</html>
