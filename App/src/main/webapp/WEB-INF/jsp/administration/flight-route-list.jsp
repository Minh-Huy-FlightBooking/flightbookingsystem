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

<body class="sidebar-is-reduced">
<jsp:include page="_sidebar.jsp"/>

<main class="l-main">
    <div class="content-wrapper content-wrapper--with-bg">
        <h1 class="page-title ml-3">All Flight Route</h1>
        <div class="page-content" style="background: #e67e22;color: #fff">
            <h1>Flight Route: </h1>
            <i>Please fill in the form to create a new aircraft</i>
        </div>
        <%--        --------------%>
        <div class="page-content" id="page-content" style="padding: 0">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Flight Route List&nbsp;&nbsp;&nbsp;<a href="addFlightRoute" title="thêm mới" class="btn btn-sm mycolor">
                        <i class="fa fa-plus"></i></a>
                        <p>${message}</p>
                    </h5>

                    <div class="col-xs-12 col-sm-12 ">
                        <table class="table table-condensed table-hover" id="myTable">
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
        <br>
        &nbsp;
    </div>

</main>
</body>
</html>
