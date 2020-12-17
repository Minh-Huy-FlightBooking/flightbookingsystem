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
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
            <%--Adding Button--%>
            <h3>Admin<a href="addFlightRoute" title="new addition" class="btn btn-sm float-right mycolor"  ><i class="fa fa-plus"></i></a></h3>
        </div>
        <div class="card-body">
            <h5 class="card-title">Aircraft List
                <div class="input-group col-sm-4 mb-4 float-right">
                                        <input class="form-control" id="myInput" type="text"
                                               placeholder="searching" aria-label="Search"
                                               onkeyup="myFunction()" title="tìm kiếm theo tên sản phẩm">
                </div>
                <p class="col">${message}</p>
            </h5>

            <div class="col-xs-12 col-sm-12 ">
                <table class="table table-condensed table-hover" id="myTable">
                    <thead>
                    <tr align="center">
                        <th scope="col">Id</th>
                        <th scope="col">Model</th>
                        <th scope="col">Total Economy Seats</th>
                        <th scope="col">Total Business Seats</th>
                        <th scope="col">Enabled</th>
                        <th scope="col">Brand</th>
                        <th scope="col">Airport</th>
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
                            <td>${a.airport.airportName}</td>

                            <td>
                                <a href="editAircraft?aircraftId=${a.aircraftId}" class="btn btn-sm mycolor" title="Edit"><i class='fa fa-pencil'></i></a>
                                <a href="deleteAircraft?aircraftId=${a.aircraftId}" class="btn btn-sm mycolor" title="Delete"><i class="fa fa-trash-o"></i></a>
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
            td = tr[i].getElementsByTagName("td")[0];
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
