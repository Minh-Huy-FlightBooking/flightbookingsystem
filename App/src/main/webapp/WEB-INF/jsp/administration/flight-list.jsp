<%--
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
<c:if test="${message!=null}">
    <script>
        $(document).ready(function(){
            $("#myModal").modal('show');
        });
    </script>
    <div id="myModal" class="modal fade">
        <div class="modal-dialog modal-login">
            <div class="modal-content">
                <div class="alert alert-warning mb-0" role="alert">
                    ${message}
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
                        <h2 class="card-title ml-3">Flight List&nbsp;&nbsp;&nbsp;<a href="addFlight" class="btn btn-sm mycolor"  >
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
                                    <tr align="center">
                                        <td>${f.departureTime}</td>
                                        <td>${f.arrivalTime}</td>
                                        <td>${f.flightRoute.originAirport.airportName}</td>
                                        <td>${f.flightRoute.destinationAirport.airportName}</td>
                                        <td>${f.flightStatus}</td>
                                        <td>${f.aircraft.brand.brandName}</td>
                                        <td>${f.economyPrice}</td>
                                        <td>${f.businessPrice}</td>
                                        <!-- Đây là các icon thao tác -->
                                        <td>
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
            <%--</div>--%>
        </div>
        <br>
        &nbsp;
    </div>
</main>
</body>
</html>

