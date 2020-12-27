<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/16/2020
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<jsp:include page="_head.jsp"/>

<body class="sidebar-is-reduced">

<jsp:include page="_sidebar.jsp"/>

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

<main class="l-main">
    <div class="content-wrapper content-wrapper--with-bg">
        <div id="page-content" style="padding: 0">
            <!-- phần này view cả panel -->
            <div class="container mt-5 col-sm-6">
                <div class="card shadow border-0">
                    <div class="card-body ">
                        <form:form action="handlingSaveFlightRoute" modelAttribute="flightRoute">
                            <table class="table table-borderless">
                                <c:if test="${type=='edit'}">
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
                                            <a href="/admin/flightRouteList"class="btn btn-sm btn-outline-danger w-100 ml-2">Cancel</a>
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
</main>

</body>
</html>
