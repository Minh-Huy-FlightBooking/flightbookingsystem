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
    <div class="content-wrapper content-wrapper--with-bg">
        <h1 class="page-title">Add Aircraft</h1>
        <%--................--%>
        <div class="page-content" style="background: #e67e22;color: #fff">
            <h1>Flight Addition: </h1>
            <i>Please fill in the form to create a new flight</i>
        </div>
        <%----------------%>
        <div class="page-content" id="page-content" style="padding: 2rem">
            <div class="container d-flex justify-content-center">
                <form:form action="handlingFLightAddition" modelAttribute="flight">
                            <c:if test="${status == 'Edit Flight'}">
                                <div class="form-group">
                                    <label for="">Id</label>
                                    <form:input path="flightId" readonly="true" class="form-control" placeholder=""/>
                                </div>
                            </c:if>

                            <div class="form-group">
                                <label for="">Flight_Route:</label>
                                <form:select path="flightRoute" class="form-control">
                                    <c:forEach var="route" items="${flightRouteList}">
                                        <form:option value="${route.routeId}"><c:out value="${route.originAirport.airportName}"/>&rarr;&nbsp;<c:out value="${route.destinationAirport.airportName}"/></form:option>
                                    </c:forEach>
                                </form:select>
                            </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="">Departure Time: &nbsp;<img src="/resources/image/logo/clock.png" alt="clock" width="18" height="18"></label>
                                <form:input path="departureTime" type="datetime-local" class="form-control" id="" placeholder="model"/>
                            </div>
                            <div class="form-group ml-2">
                                <label for="">Arrival Time: &nbsp;<img src="/resources/image/logo/clock.png" alt="clock" width="18" height="18"></label>
                                <form:input path="arrivalTime" type="datetime-local" class="form-control" id=""/>
                            </div>
                        </div>
                            <div class="form-group">
                                <label for="">Aircraft &nbsp; <img src="/resources/image/logo/travel-airport-landing-calzjk7rnfq70wow8vakd4.png" alt="plane" width="21" height="21"></label>
                                <form:select path="aircraft.aircraftId" class="form-control" items="${aircraft}">
                                </form:select>
                            </div>
                            <div class="form-group">
                                <label for="">Flight Status:</label>
                                <form:input path="flightStatus" class="form-control" id="" placeholder="Delay/ Onprogress/ ..."/>
                            </div>
                            <div class="form-group">
                                <div class="d-flex justify-content-center">
                                    <input type="submit" class="btn col-sm-4 form-control" style="background-color: #34495e;color: #fff;border-radius: 20px" onMouseOut="this.style.background='#40739e'"
                                           onMouseOver="this.style.background='#102c58'" value="Add Flight">
                                </div>
                            </div>
                        </form:form>
            </div>
        </div>
        <br><br>
    </div>
</main>
<script>
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>

</body>
</html>
