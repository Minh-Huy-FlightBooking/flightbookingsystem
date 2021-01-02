<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/15/20
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<jsp:include page="_head.jsp"/>

<body>
<%--<jsp:include page="_sidebar.jsp"/>--%>
<%--<main class="l-main">--%>
<%--    <div class="content-wrapper content-wrapper--with-bg">--%>

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
                    <h3 style="color: #333333">Home</h3>
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

        </div>
    </div>
</div>
</body>
</html>
