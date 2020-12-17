<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/16/2020
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Product Manager</title>
    <style>
        .mycolor{
            background-color: #0dd6b8;
            border-color: #0dd6b8;
            color: white
        }
    </style>
</head>
<body>
<div class="container" style="margin-top: 30px;">
       
    <div class="card">
        <div class="card-header">
<%--            Adding Button--%>
            <h3>Admin<a href="addFlightRoute" title="new addition" class="btn btn-sm float-right mycolor"  ><i class="fa fa-plus"></i></a></h3>
        </div>
        <div class="card-body">
            <h5 class="card-title">Flight Route List
                <div class="input-group col-sm-4 mb-4 float-right">
                                        <input class="form-control" id="myInput" type="text"
                                               placeholder="Tìm kiếm" aria-label="Search"
                                               onkeyup="myFunction()" title="tìm kiếm theo tên sản phẩm">
                </div>
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
    <%--    Searching Engine--%>
    <script>
        function myFunction() {
            let input, filter, table, tr, td, i;
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
</body>
</html>
