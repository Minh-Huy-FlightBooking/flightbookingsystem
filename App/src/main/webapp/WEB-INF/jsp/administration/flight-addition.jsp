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

<body class="sidebar-is-reduced">
<jsp:include page="_sidebar.jsp"/>
<main class="l-main">
    <div class="content-wrapper bg-white">
        <%----------------%>
        <div id="page-content" style="padding: 2rem">

        <div class="container mt-5 col-sm-6">
            <div class="card shadow border-0">
                <div class="card-body ">
                    <form:form action="handlingFLightAddition" modelAttribute="flight">
                        <table class="table table-borderless border-0">
                            <tr>
                                <th>Flight Route</th>
                                <td>
                                    <form:select path="flightRoute" cssClass="form-control" items="${flightRouteList}"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Departure Time</th>
                                <td>
                                    <form:input path="departureTime" type="datetime-local" cssClass="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Arrival Time</th>
                                <td>
                                    <form:input path="arrivalTime" type="datetime-local" cssClass="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Aircraft</th>
                                <td>
                                    <form:select path="aircraft" cssClass="form-control" items="${aircraft}"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Economy Price</th>
                                <td>
                                    <form:input path="economyPrice" type="number" cssClass="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Business Price</th>
                                <td>
                                    <form:input path="businessPrice" type="number" cssClass="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Status</th>
                                <td>
                                    <form:select type="select" cssClass="form-control" path="flightStatus">
                                        <form:option value="Delay">Delay</form:option>
                                        <form:option value="On time">On time</form:option>
                                        <form:option value="Canceled">Canceled</form:option>
                                    </form:select>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <div class="form-inline">
                                        <input type="submit" class="btn btn-outline-primary w-50" value="Save"/>
                                        <a href="/admin/flightList" class="btn btn-outline-danger w-50">Cancel</a>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form:form>
                </div>
            </div>
        </div>
        </div>
        <br><br>
    </div>
</main>

</body>
</html>
