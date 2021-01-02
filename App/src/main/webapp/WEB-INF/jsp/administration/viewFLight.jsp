<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/16/2020
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/16/20
  Time: 7:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="_head.jsp"/>

<body>
<%--<jsp:include page="_sidebar.jsp"/>--%>
<%--<main class="l-main">--%>
<%--    <div class="content-wrapper content-wrapper--with-bg">--%>

<%--        <div id="page-content" style="padding: 0;">--%>
<%--            &lt;%&ndash;<div class="container-fluid d-flex justify-content-center">&ndash;%&gt;--%>
<%--                <div class="card shadow">--%>
<%--                    <div class="card-body">--%>
<%--                        <h2 class="card-title ml-3">Flight List&nbsp;&nbsp;&nbsp;<a href="addFlight" class="btn btn-sm mycolor"  >--%>
<%--                            <i class="fa fa-plus"></i></a>--%>
<%--                        </h2>--%>

<%--                        <div class="col-xs-12 col-sm-12 ">--%>
<%--                            <table class="table table-bordered table-hover" id="example">--%>
<%--                                <thead>--%>
<%--                                <tr align="center">--%>
<%--                                    <th>Departure time</th>--%>
<%--                                    <th>Arrival time</th>--%>
<%--                                    <th>Origin Airport</th>--%>
<%--                                    <th>Destination Airport</th>--%>
<%--                                    <th>Flight Status</th>--%>
<%--                                    <th>Aircraft</th>--%>
<%--                                    <th>Economy Price</th>--%>
<%--                                    <th>Business Price</th>--%>
<%--                                    <th>Action</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody>--%>
<%--                                <c:forEach items="${flightList}" var="f">--%>
<%--                                    <tr align="center" style="height: 100px">--%>
<%--                                        <td style="vertical-align: middle; width: 11.6%">${f._departureTime}</td>--%>
<%--                                        <td style="vertical-align: middle; width: 11.6%">${f._arrivalTime}</td>--%>
<%--                                        <td style="vertical-align: middle">${f.flightRoute.originAirport.airportName}</td>--%>
<%--                                        <td style="vertical-align: middle">${f.flightRoute.destinationAirport.airportName}</td>--%>
<%--                                        <td style="vertical-align: middle">${f.flightStatus}</td>--%>
<%--                                        <td style="vertical-align: middle">${f.aircraft.model}<br>${f.aircraft.brand.brandName}</td>--%>
<%--                                        <td style="vertical-align: middle">${f.economyPrice}</td>--%>
<%--                                        <td style="vertical-align: middle">${f.businessPrice}</td>--%>
<%--                                        <!-- Đây là các icon thao tác -->--%>
<%--                                        <td style="vertical-align: middle">--%>
<%--                                            <a href="editFlight?id=${f.flightId}" class="btn btn-sm mycolor" title="chỉnh sửa" style="margin: 1px;"><i class='fa fa-pencil' ></i></a>--%>
<%--                                            <a href="deleteFlight?id=${f.flightId}" class="btn btn-sm mycolor" title="xóa" style="margin: 1px;"><i class="fa fa-trash-o" ></i></a>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                </c:forEach>--%>
<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            &lt;%&ndash;</div>&ndash;%&gt;--%>
<%--        </div>--%>
<%--        <br>--%>
<%--    </div>--%>
<%--</main>--%>
<div class="container-fluid">
    <div class="row mt-2">
        <div class="col-sm-2">
            <div class="card">
                <div class="card-body d-flex justify-content-center">
                    <h1 style="color: #d592ff;font-weight: 900">ADMIN</h1>
                </div>
            </div>
        </div>
        <div class="col-sm-10">
            <div class="card">
                <div class="card-body">
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Flight</small></h3>
                </div>
            </div>
        </div>
    </div>
    <hr class="mb-4">
    <div class="row">
        <div class="col-sm-2">
            <ul class="list-group">
                <div class="list-group">
                    <a href="/admin/viewFlight" class="list-group-item">Flight</a>
                    <a href="/admin/viewFlightRoute" class="list-group-item" >FLight Route</a>
                    <a href="/admin/viewAircraft" class="list-group-item">Aircraft</a>
                    <a href="#" class="list-group-item">Airport</a>
                    <a href="#" class="list-group-item">Customer</a>
                    <a href="#" class="list-group-item" disabled>Brand</a>
                </div>
            </ul>
        </div>
        <div class="col-sm-10">
            <div class="card shadow">
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-sm-5">
                            <h5 style="color: #333;font-weight: 600">Flight List&nbsp;&nbsp;&nbsp;
                                <a href="/admin/addFlight" class="btn btn-sm mycolor">
                                    <i class="fa fa-plus"></i></a>
                            </h5>
                        </div>
                        <div class="col-sm-7">
                            <c:if test="${message=='Delete successed.'}">
                                <div class="alert" style="background-color:#b7eb8f;color: #333">${message}</div>
                            </c:if>
                            <c:if test="${message=='Delete failed.'}">
                                <div class="alert" style="background-color:#ffccc7;color: #333">${message}</div>
                            </c:if>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12 ">
                            <table class="table table-bordered table-hover" id="example">
                                <thead>
                                <tr align="center">
                                    <th>Departure time</th>
                                    <th>Arrival time</th>
                                    <th style="width: 14%">Origin Airport</th>
                                    <th style="width: 14%">Destination Airport</th>
                                    <th>Flight Status</th>
                                    <th style="width: 14%">Aircraft</th>
                                    <th>Economy Price</th>
                                    <th>Business Price</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${flightList}" var="f">
                                    <tr align="center" style="height: 100px">
                                        <td style="vertical-align: middle; width: 11.6%">${f._departureTime}</td>
                                        <td style="vertical-align: middle; width: 11.6%">${f._arrivalTime}</td>
                                        <td style="vertical-align: middle">${f.flightRoute.originAirport.airportName}</td>
                                        <td style="vertical-align: middle">${f.flightRoute.destinationAirport.airportName}</td>
                                        <td style="vertical-align: middle">${f.flightStatus}</td>
                                        <td style="vertical-align: middle">${f.aircraft.model}<br> <small>${f.aircraft.brand.brandName}</small></td>
                                        <td style="vertical-align: middle">${f.economyPrice}</td>
                                        <td style="vertical-align: middle">${f.businessPrice}</td>
                                        <!-- Đây là các icon thao tác -->
                                        <td style="vertical-align: middle">
                                            <a href="editFlight?id=${f.flightId}" class="btn btn-sm mycolor" title="chỉnh sửa" style="margin: 1px;"><i class='fa fa-pencil' ></i></a>
                                            <a href="deleteFlight?id=${f.flightId}" class="btn btn-sm mycolor" title="xóa" style="margin: 1px;"><i class="fa fa-trash-o" ></i></a>
                                        </td>
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
</div>
<br><br><br>
</body>
</html>

