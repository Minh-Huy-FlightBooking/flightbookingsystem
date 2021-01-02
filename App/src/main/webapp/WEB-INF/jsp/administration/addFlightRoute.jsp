
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/16/2020
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<%--        <div id="page-content" style="padding: 0">--%>
<%--            <!-- phần này view cả panel -->--%>
<%--            <div class="container mt-5 col-sm-6">--%>
<%--                <div class="card shadow border-0">--%>
<%--                    <div class="card-body ">--%>
<%--                        <form:form action="handlingSaveFlightRoute" modelAttribute="flightRoute">--%>
<%--                            <table class="table table-borderless">--%>
<%--                                <c:if test="${type=='edit'}">--%>
<%--                                    <tr>--%>
<%--                                        <th>ID</th>--%>
<%--                                        <td>--%>
<%--                                            <form:input path="routeId" cssClass="form-control" readonly="true"/>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                </c:if>--%>
<%--                                <tr>--%>
<%--                                    <th>Origin Airport</th>--%>
<%--                                    <td>--%>
<%--                                        <form:select path="originAirport" cssClass="form-control" items="${originAirport}" itemLabel="airportName"/>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <th>Destination Airport</th>--%>
<%--                                    <td>--%>
<%--                                        <form:select path="destinationAirport" cssClass="form-control" items="${destinationAirport}" itemLabel="airportName"/>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <th></th>--%>
<%--                                    <td>--%>
<%--                                        <div class="button mt-2 d-flex flex-row align-items-center">--%>
<%--                                            <input type="submit" class="btn btn-sm btn-outline-primary w-100" value="Save"/>--%>
<%--                                            <a href="/admin/flightRouteList"class="btn btn-sm btn-outline-danger w-100 ml-2">Cancel</a>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </table>--%>
<%--                        </form:form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
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
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Flight Route / ${type}</small></h3>
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
                    <a href="/admin/viewFlightRoute" class="list-group-item">FLight Route</a>
                    <a href="/admin/viewAircraft" class="list-group-item">Aircraft</a>
                    <a href="#" class="list-group-item">Airport</a>
                    <a href="#" class="list-group-item">Customer</a>
                    <a href="#" class="list-group-item" disabled>Brand</a>
                </div>
            </ul>
        </div>
        <div class="col-sm-10">
            <div class="container col-sm-6">
                <div class="card border">
                    <div class="card-body ">
                        <form:form action="handlingSaveFlightRoute" modelAttribute="flightRoute">
                            <div class="row">
                                <c:if test="${message=='Save successed.'}">
                                    <div class="alert col-sm-12" style="background-color:#b7eb8f;color: #333">${message}</div>
                                </c:if>
                                <c:if test="${message=='Data is existed.'||message=='Invalid value.'||message=='Save failed.'}">
                                    <div class="alert col-sm-12" style="background-color:#ffccc7;color: #333">${message}</div>
                                </c:if>
                            </div>
                            <table class="table table-borderless">
                                <c:if test="${type=='Edit'}">
                                    <tr>
                                        <th>ID</th>
                                        <td>
                                            <form:input path="routeId" cssClass="form-control" readonly="true"/>
                                        </td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <th>Origin Airport</th>
                                    <td>
                                        <form:select path="originAirport" cssClass="form-control" items="${originAirport}" itemLabel="airportName"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Destination Airport</th>
                                    <td>
                                        <form:select path="destinationAirport" cssClass="form-control" items="${destinationAirport}" itemLabel="airportName"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td>
                                        <div class="button mt-2 d-flex flex-row align-items-center">
                                            <input type="submit" class="btn btn-sm btn-outline-primary w-100" value="Save"/>
                                            <a href="/admin/viewFlightRoute"class="btn btn-sm btn-outline-danger w-100 ml-2">Cancel</a>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
