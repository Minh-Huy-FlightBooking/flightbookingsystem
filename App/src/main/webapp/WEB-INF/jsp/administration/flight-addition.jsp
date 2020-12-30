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
<c:if test="${message!=null}">
    <div id="myModal" class="modal fade">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="alert alert-danger mb-0" role="alert">
                    <h4 class="alert-heading">Warning!</h4>
                    <h2>Invalid value. May be:</h2>
                    <p class="mt-1"> <br>- Departure time After Arrival time
                        <script>
                            $(document).ready(function(){
                                $("#myModal").modal('show');
                            });
                        </script>
                        <br>- Aircraft is activated
                        <br>- This Flight is existed</p>
                    <hr>
                    <p class="mb-0">Please fill data again!!! Thanks.</p>
                </div>
            </div>
        </div>
    </div>
</c:if>
<main class="l-main">
    <div class="content-wrapper bg-white">
    <%----------------%>
        <div id="page-content" style="padding: 2rem">
            <div class="card">
                <div class="card-body">
                    <div id="fil"></div>
                </div>
            </div>
            <div class="container mt-5 col-sm-7">
                <div class="card shadow border-0">
                    <div class="card-body ">
                        <form:form action="handlingFLightAddition" modelAttribute="flight">
                            <table class="table table-borderless border-0">
                                <c:if test="${type=='edit'}">
                                    <tr>
                                        <td>Id</td>
                                        <td>
                                            <form:input path="flightId" cssClass="form-control" readonly="true"/>
                                        </td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <th>Flight Route</th>
                                    <td>
                                        <form:select id="flightRouteId" path="flightRoute"  cssClass="form-control" items="${flightRouteList}" required="true"/>
                                    </td>
                                </tr>
                                <tr>
                                <th>Departure Time</th>
                                <td>
                                    <form:input path="departureTime" type="datetime-local" cssClass="form-control" required="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Arrival Time</th>
                                <td>
                                    <form:input path="arrivalTime" type="datetime-local" cssClass="form-control" required="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Aircraft</th>
                                <td>
<%--                                    <form:select path="aircraft" cssClass="form-control" items="${aircraft}" itemLabel="model" required="true"/>--%>
                                </td>
                            </tr>
                            <tr>
                                <th>Economy Price</th>
                                <td>
                                    <form:input path="economyPrice" cssClass="form-control" required="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Business Price</th>
                                <td>
                                    <form:input path="businessPrice" cssClass="form-control" required="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Status</th>
                                <td class="d-flex flex-row">
                                    <span class="border pl-2 pt-2 rounded mr-2 mb-1 bg-warning">
                                        <label class="form-check form-check-inline">
                                        <span class="form-check-label mr-5" style="font-size: 18px"> Delay </span>
                                        <form:radiobutton path="flightStatus" cssClass="form-check-input" value="Delay"/>
                                        </label>
                                    </span>
                                    <span class="border pl-2 pt-2 rounded mr-2 mb-1 bg-success">
                                        <label class="form-check form-check-inline">
                                        <span class="form-check-label mr-5" style="font-size: 18px"> On time </span>
                                        <form:radiobutton path="flightStatus" cssClass="form-check-input" value="On time"/>
                                        </label>
                                    </span>
                                    <span class="border pl-2 pt-2 rounded mr-2 mb-1 bg-danger">
                                        <label class="form-check form-check-inline">
                                        <span class="form-check-label mr-5" style="font-size: 18px"> Cancel </span>
                                        <form:radiobutton path="flightStatus" cssClass="form-check-input" value="Cancel" onclick="doGetJSON()"/>
                                        </label>
                                    </span>

                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <div class="button mt-2 d-flex flex-row align-items-center">
                                        <input type="submit" class="btn btn-sm btn-outline-primary w-100" value="Save"/>
                                        <a href="/admin/flightList"class="btn btn-sm btn-outline-danger w-100 ml-2">Cancel</a>
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
