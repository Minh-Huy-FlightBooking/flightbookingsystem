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
<jsp:include page="_head.jsp"/>
<body class="sidebar-is-reduced">
<jsp:include page="_sidebar.jsp"/>
<main class="l-main">
    <div class="content-wrapper content-wrapper--with-bg">
        <h1 class="page-title">Add Flight Route</h1>
        <div class="page-content" style="background: #e67e22;color: #fff">
            <h1>Flight Route Action: </h1>
            <i>Please fill in the form to create a new aircraft</i>
        </div>
        <div class="page-content" id="page-content" style="padding: 0">
            <!-- phần này view cả panel -->
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Add New Flight Route &nbsp;&nbsp;&nbsp;<a href="admin_productManager_add" class="btn btn-sm mycolor" title="thêm mới"><i
                            class="fa fa-plus"></i></a> <span>${message}</span></h5>
                    <form:form action="handlingSaveFlightRoute" modelAttribute="flightRoute">
                        <div class="col-xs-12 col-sm-12 ">
                            <table class="table table-condensed table-hover" id="myTable">
                                <thead>
                                <tr align="center">
                                    <c:if test="${type=='edit'}">
                                        <th>Route Id</th>
                                    </c:if>
                                    <th>Origin Airport</th>
                                    <th>Destination Airport</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr align="center">
                                    <c:if test="${type=='edit'}">
                                        <td>
                                            <form:input path="routeId" type="text" readonly="true"/>
                                        </td>
                                    </c:if>
                                    <td>
                                        <form:select path="originAirport" class="form-control">
                                            <form:options items="${originAirport}" itemLabel="airportName"/>
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
                    </form:form>
                </div>
            </div>

        </div>
    </div>
</main>
</body>

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
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
</body>
</html>
