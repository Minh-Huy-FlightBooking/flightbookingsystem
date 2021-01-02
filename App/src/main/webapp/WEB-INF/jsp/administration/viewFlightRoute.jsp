<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/16/2020
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="_head.jsp"/>

<body>

<%--<jsp:include page="_sidebar.jsp"/>--%>

<%--<c:if test="${message!=null}">--%>
<%--    <script>--%>
<%--        $(document).ready(function(){--%>
<%--            $("#myModal").modal('show');--%>
<%--        });--%>
<%--    </script>--%>
<%--    <div id="myModal" class="modal fade">--%>
<%--        <div class="modal-dialog modal-login">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="alert alert-warning mb-0" role="alert">--%>
<%--                        ${message}--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</c:if>--%>

<%--<main class="l-main">--%>
<%--    <div class="content-wrapper content-wrapper--with-bg">--%>
<%--        &lt;%&ndash;        ------------&ndash;%&gt;--%>
<%--        <div id="page-content" style="padding: 0">--%>
<%--            <div class="card shadow">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Flight Route List&nbsp;&nbsp;&nbsp;--%>
<%--                        <a href="addFlightRoute" title="thêm mới" class="btn btn-sm mycolor">--%>
<%--                        <i class="fa fa-plus"></i></a>--%>
<%--                    </h5>--%>

<%--                    <div class="col-xs-12 col-sm-12 ">--%>
<%--                        <table id="example" class="table table-hover table-bordered w-100">--%>
<%--                            <thead>--%>
<%--                            <tr align="center">--%>
<%--                                <th>ID</th>--%>
<%--                                <th>Origin Airport</th>--%>
<%--                                <th>Destination Airport</th>--%>
<%--                                <th>Action</th>--%>
<%--                            </tr>--%>
<%--                            </thead>--%>
<%--                            <tbody>--%>
<%--                            <c:forEach items="${flightRouteList}" var="f">--%>
<%--                                <tr align="center">--%>
<%--                                    <td>${f.routeId}</td>--%>
<%--                                    <td>${f.originAirport.airportName}</td>--%>
<%--                                    <td>${f.destinationAirport.airportName}</td>--%>
<%--                                    <!-- Đây là các icon thao tác -->--%>
<%--                                    <td>--%>
<%--                                        <a href="editFlightRoute?id=${f.routeId}" class="btn btn-sm mycolor" title="chỉnh sửa"><i class='fa fa-pencil'></i></a>--%>
<%--                                        <a href="deleteFlightRoute?id=${f.routeId}" class="btn btn-sm mycolor" title="xóa"><i class="fa fa-trash-o"></i></a>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:forEach>--%>
<%--                            </tbody>--%>
<%--                        </table>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
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
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Flight Route</small></h3>
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
                            <h5 style="color: #333;font-weight: 600">Flight Route List&nbsp;&nbsp;&nbsp;
                                <a href="addFlightRoute" title="thêm mới" class="btn btn-sm mycolor">
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
                            <table id="example" class="table table-hover table-bordered w-100">
                                <thead>
                                <tr align="center">
                                    <th>ID</th>
                                    <th>Origin Airport</th>
                                    <th>Destination Airport</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${flightRouteList}" var="f">
                                    <tr align="center">
                                        <td>${f.routeId}</td>
                                        <td>${f.originAirport.airportName}</td>
                                        <td>${f.destinationAirport.airportName}</td>
                                        <!-- Đây là các icon thao tác -->
                                        <td>
                                            <a href="editFlightRoute?id=${f.routeId}" class="btn btn-sm mycolor" title="chỉnh sửa"><i class='fa fa-pencil'></i></a>
                                            <a href="deleteFlightRoute?id=${f.routeId}" class="btn btn-sm mycolor" title="xóa"><i class="fa fa-trash-o"></i></a>
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
