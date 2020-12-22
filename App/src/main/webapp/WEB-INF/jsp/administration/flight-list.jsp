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
<jsp:include page="_sidebar.jsp"/>
<main class="l-main">
    <div class="content-wrapper content-wrapper--with-bg">
        <h1 class="page-title ml-2">Flight Manager</h1>
        <%--................--%>
        <div class="page-content" style="background: #e67e22;color: #fff">
            <h1>Flight: </h1>
            <i>Please fill in the form to create a new flight</i>
        </div>

        <div class="page-content" id="page-content" style="padding: 2rem">
            <div class="container d-flex justify-content-center">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Flight Route List&nbsp;&nbsp;&nbsp;<a href="addFlight" title="thêm mới" class="btn btn-sm mycolor"  >
                            <i class="fa fa-plus"></i></a>
                            <c:if test="${message!=null}"><p>${message}</p></c:if>
                        </h5>

                        <div class="col-xs-12 col-sm-12 ">
                            <table class="table table-condensed table-hover" id="myTable">
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
                                            <a href="editFligh?id=${f.flightId}" class="btn btn-sm mycolor" title="chỉnh sửa"><i class='fa fa-pencil'></i></a>
                                            <a href="deleteFlight?id=${f.flightId}" class="btn btn-sm mycolor" title="xóa"><i class="fa fa-trash-o"></i></a>
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
        <br>
        &nbsp;
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

