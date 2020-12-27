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
                        <form:form action="handlingAircraftAddition" modelAttribute="aircraft">
                            <table class="table table-borderless">
                                <c:if test="${type=='edit'}">
                                    <tr>
                                        <th>ID</th>
                                        <td>
                                            <form:input path="aircraftId" readonly="true" class="form-control" placeholder=""/>
                                        </td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <th>Model</th>
                                    <td>
                                        <form:input path="model"  class="form-control" id=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Total business</th>
                                    <td>
                                        <form:input path="total_business" class="form-control" id="" placeholder="Email"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Total Economy</th>
                                    <td>
                                        <form:input path="total_economy" class="form-control" id="" placeholder="Password"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Enabled <br><p class="text-muted mb-0">(Active: true, Inactive: false)</p></th>
                                    <td>
                                        <form:input path="enabled" class="form-control" id=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Brand</th>
                                    <td>
                                        <form:select path="brand.brandId" items="${brands}" class="form-control">
                                        </form:select>                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td>
                                        <div class="form-inline">
                                            <input type="submit" class="btn btn-outline-primary w-50" value="Save"/>
                                            <a href="/admin/flightRouteList" class="btn btn-outline-danger w-50">Cancel</a>
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
