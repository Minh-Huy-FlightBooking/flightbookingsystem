<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/16/20
  Time: 9:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<jsp:include page="_head.jsp"/>

<body class="sidebar-is-reduced">

<jsp:include page="_sidebar.jsp"/>

<main class="l-main" >
    <div class="content-wrapper content-wrapper--with-bg">
        <div id="page-content" style="padding: 0;">
            <div class="card shadow">
                <div class="card-body">
                    <h5 class="card-title">Aircraft List&nbsp;&nbsp;
                        <a href="/admin/addAircraft" class="btn btn-sm mycolor">
                            <i class="fa fa-plus"></i></a>
                    </h5>

                    <div class="col-xs-12 col-sm-12 ">
                        <table id="example" class="table table-hover table-bordered w-100">
                            <thead>
                            <tr align="center">
                                <th scope="col">Id</th>
                                <th scope="col">Model</th>
                                <th scope="col">Total Economy Seats</th>
                                <th scope="col">Total Business Seats</th>
                                <th scope="col">Enabled</th>
                                <th scope="col">Brand</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="a" items="${aircraft}">
                                <tr align="center">
                                    <td scope="row">${a.aircraftId}</td>
                                    <td>${a.model}</td>
                                    <td>${a.total_economy}</td>
                                    <td>${a.total_business}</td>
                                    <td>${a.enabled}</td>
                                    <td>${a.brand.brandName}</td>
                                    <td>
                                        <a href="editAircraft?aircraftId=${a.aircraftId}" class="btn btn-sm mt-1 mycolor" title="Edit"><i class='fa fa-pencil'></i></a>
                                        <a href="deleteAircraft?aircraftId=${a.aircraftId}" class="btn btn-sm mycolor mt-1" title="Delete"><i class="fa fa-trash-o"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
    </div>
</main>
</body>
</html>
