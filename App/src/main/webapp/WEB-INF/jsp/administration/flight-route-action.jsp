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

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- Chỉnh lại tiếng việt nếu muốn -->
    <title>User Cart View</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        .mycolor{
            background-color: #0dd6b8;
            border-color: #0dd6b8;
            color: white
        }
    </style>
</head>
<body>
    <form:form action="handlingSaveFlightRoute" modelAttribute="flightRoute">
        <!-- phần này view cả panel -->
        <div class="container" style="margin-top: 30px;">
            <div class="card">
                <div class="card-header">
                    <!-- Đây là nút thêm mới -->
                    <h3>Admin<a href="admin_productManager_add"  class="btn btn-sm float-right mycolor" title="thêm mới" ><i class="fa fa-plus"></i></a></h3>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Add New Flight Route</h5>

                    <div class="col-xs-12 col-sm-12 ">
                        <table class="table table-condensed table-hover" id="myTable">
                            <thead>
                            <tr align="center">
                                <c:if test="${message=='edit'}">
                                    <th>Route Id</th>
                                </c:if>
                                <th>Origin Airport</th>
                                <th>Destination Airport</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr align="center">
                                <c:if test="${message=='edit'}">
                                    <td>
                                        <form:input path="routeId" type="text" readonly="true"/>
                                    </td>
                                </c:if>
                                <td>
                                    <form:select path="originAirport" class="form-control">
                                        <form:options items="${originAirport}" itemLabel="airportName" />
                                    </form:select>
                                </td>
                                <td>
                                    <form:select path="destinationAirport" class="form-control">
                                        <form:options items="${destinationAirport}" itemLabel="airportName"/>
                                    </form:select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <input type="submit" class="btn btn-sm btn-success" value="Save">
                    </div>
                </div>
            </div>
        </div>
    </form:form>
<!-- Phần này script phần tìm kiếm -->
<script>
    function myFunction() {
        var input, filter, table, tr, td, i;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    };
</script>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
</body>
</html>
