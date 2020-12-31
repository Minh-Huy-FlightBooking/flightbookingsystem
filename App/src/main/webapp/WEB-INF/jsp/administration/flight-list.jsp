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

<body class="sidebar-is-reduced mb-3">
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm");
%>
<c:if test="${type!=null}">
<script>
    $(document).ready(function () {
        $("#myModal").modal('show');
    });
</script>
<div id="myModal" class="modal fade">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <c:if test="${type=='delete'}">
            <div class="alert alert-warning mb-0" role="alert">
                <h4 class="alert-heading">${message}</h4>
                <table class="table table-borderless">
                    <tbody>
                    <tr>
                        <td>ID</td>
                        <td class="font-weight-bold">
                            <del>${newFlight.flightId}</del>
                        </td>
                    </tr>
                    <tr>
                        <td>Flight Route</td>
                        <td class="font-weight-bold">
                            <del><small>From</small> ${newFlight.flightRoute.originAirport.airportName}
                                <small>To</small> ${newFlight.flightRoute.destinationAirport.airportName}</del>
                        </td>
                    </tr>
                    <tr>
                        <td>Departure time</td>
                        <td class="font-weight-bold">
                            <del>${newFlight._departureTime}</del>
                        </td>
                    </tr>
                    <tr>
                        <td>Arrival time</td>
                        <td class="font-weight-bold">
                            <del>${newFlight._arrivalTime}</del>
                        </td>
                    </tr>
                    <tr>
                        <td>Aircraft</td>
                        <td class="font-weight-bold">
                            <del>${newFlight.aircraft.model}, ${newFlight.aircraft.brand.brandName}</del>
                        </td>
                    </tr>
                    <tr>
                        <td>Economy Price</td>
                        <td class="font-weight-bold">
                            <del>${newFlight.economyPrice}</del>
                        </td>
                    </tr>
                    <tr>
                        <td>Business Price</td>
                        <td class="font-weight-bold">
                            <del>${newFlight.businessPrice}</del>
                        </td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td class="font-weight-bold">
                            <del>${newFlight.flightStatus}</del>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <hr>
                </c:if>
                <c:if test="${type=='add'}">
                <div class="alert alert-warning mb-0" role="alert">
                    <h4 class="alert-heading">${message}</h4>
                    <table class="table table-borderless">
                        <tbody>
                        <tr>
                            <td>Flight Route</td>
                            <td class="font-weight-bold">
                                <small>From</small> ${newFlight.flightRoute.originAirport.airportName}
                                <small>To</small> ${newFlight.flightRoute.destinationAirport.airportName} </td>
                        </tr>
                        <tr>
                            <td>Departure time</td>
                            <td class="font-weight-bold">${newFlight._departureTime}</td>
                        </tr>
                        <tr>
                            <td>Arrival time</td>
                            <td class="font-weight-bold">${newFlight._arrivalTime}</td>
                        </tr>
                        <tr>
                            <td>Aircraft</td>
                            <td class="font-weight-bold">${newFlight.aircraft.model}, ${newFlight.aircraft.brand.brandName}</td>
                        </tr>
                        <tr>
                            <td>Economy Price</td>
                            <td class="font-weight-bold">${newFlight.economyPrice}</td>
                        </tr>
                        <tr>
                            <td>Business Price</td>
                            <td class="font-weight-bold">${newFlight.businessPrice}</td>
                        </tr>
                        <tr>
                            <td>Status</td>
                            <td class="font-weight-bold">${newFlight.flightStatus}</td>
                        </tr>
                        </tbody>
                    </table>
                    <hr>
                    </c:if>
                    <c:if test="${type=='edit'}">
                    <div class="alert alert-info mb-0" role="alert">
                        <h4 class="alert-heading">${message}</h4>
                        <hr>
                        <h5>New Flight</h5>
                        <table class="table table-borderless">
                            <tbody>
                            <tr>
                                <td>Flight Route</td>
                                <td class="font-weight-bold">
                                    <small>From</small> ${newFlight.flightRoute.originAirport.airportName}
                                    <small>To</small> ${newFlight.flightRoute.destinationAirport.airportName} </td>
                            </tr>
                            <tr>
                                <td>Departure time</td>
                                <td class="font-weight-bold">${newFlight._departureTime}</td>
                            </tr>
                            <tr>
                                <td>Arrival time</td>
                                <td class="font-weight-bold">${newFlight._arrivalTime}</td>
                            </tr>
                            <tr>
                                <td>Aircraft</td>
                                <td class="font-weight-bold">${newFlight.aircraft.model}, ${newFlight.aircraft.brand.brandName}</td>
                            </tr>
                            <tr>
                                <td>Economy Price</td>
                                <td class="font-weight-bold">${newFlight.economyPrice}</td>
                            </tr>
                            <tr>
                                <td>Business Price</td>
                                <td class="font-weight-bold">${newFlight.businessPrice}</td>
                            </tr>
                            <tr>
                                <td>Status</td>
                                <td class="font-weight-bold">${newFlight.flightStatus}</td>
                            </tr>
                            </tbody>
                        </table>

                        </c:if>
                        <c:if test="${message1=='fail'}">
                            <div class="alert alert-danger mb-0" role="alert">
                                <h4 class="alert-heading">${message}</h4>
                                <p>May be: Flight On time Or Forence key</p>
                                <hr>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        </c:if>
        <jsp:include page="_sidebar.jsp"/>
        <main class="l-main">
            <div class="content-wrapper content-wrapper--with-bg">

                <div id="page-content" style="padding: 0;">
                    <%--<div class="container-fluid d-flex justify-content-center">--%>
                    <div class="card shadow">
                        <div class="card-body">
                            <h2 class="card-title ml-3">Flight List&nbsp;&nbsp;&nbsp;<a href="addFlight"
                                                                                        class="btn btn-sm mycolor">
                                <i class="fa fa-plus"></i></a>
                            </h2>

                            <div class="col-xs-12 col-sm-12 ">
                                <table class="table table-bordered table-hover" id="example">
                                    <thead>
                                    <tr align="center">
                                        <th>Departure time</th>
                                        <th>Arrival time</th>
                                        <th>Origin Airport</th>
                                        <th>Destination Airport</th>
                                        <th>Flight Status</th>
                                        <th>Aircraft</th>
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
                                            <td style="vertical-align: middle">${f.aircraft.model}<br>${f.aircraft.brand.brandName}
                                            </td>
                                            <td style="vertical-align: middle">${f.economyPrice}</td>
                                            <td style="vertical-align: middle">${f.businessPrice}</td>
                                            <!-- Đây là các icon thao tác -->
                                            <td style="vertical-align: middle">
                                                <a href="editFlight?id=${f.flightId}" class="btn btn-sm mycolor"
                                                   title="chỉnh sửa" style="margin: 1px;"><i
                                                        class='fa fa-pencil'></i></a>
                                                <a href="deleteFlight?id=${f.flightId}" class="btn btn-sm mycolor"
                                                   title="xóa" style="margin: 1px;"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%--</div>--%>
                </div>
                <br>
                &nbsp;
            </div>
        </main>
</body>
</html>

