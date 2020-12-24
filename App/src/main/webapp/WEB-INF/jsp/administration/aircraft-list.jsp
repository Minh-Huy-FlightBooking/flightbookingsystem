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
        <div class="page-content" style="background: #e67e22;color: #fff">
            <h1>Aircraft Information: </h1>
            <i>Please fill in the form to create a new flight</i>
        </div>
<%--        --------------%>
        <div class="page-content" id="page-content" style="padding: 0;">
<%--            Content Goes Here--%>
            <div class="card">
<%--                <div class="card-header">--%>
<%--                    &lt;%&ndash;Adding Button&ndash;%&gt;--%>
<%--                    <h3>Admin</h3>--%>
<%--                </div>--%>
                <div class="card-body">
                    <div class="col-xs-12 col-sm-12 ">
                        <table class="table table-bordered table-hover" id="example">
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
<script>
    $(document).ready(function(){
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tbody tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
</body>
</html>
