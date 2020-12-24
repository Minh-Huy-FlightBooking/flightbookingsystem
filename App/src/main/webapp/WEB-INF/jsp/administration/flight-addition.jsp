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
<main class="l-main">
    <div class="content-wrapper bg-white">
        <%----------------%>
        <div id="page-content" style="padding: 2rem">

        <div class="container mt-5 col-sm-6">
            <div class="card shadow-lg p-3 border-0">
                <div class="card-body ">
                    <form:form action="handlingFLightAddition" modelAttribute="flight">
                        <table class="table table-borderless border-0">
                            <tr>
                                <th>Flight Route</th>
                                <td>
                                    <form:select path="flightRoute" class="form-control" items="${flightRouteList}"/>
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
<script>
    // $(document).ready(function () {
    //     $("#myInput").on("keyup", function () {
    //         var value = $(this).val().toLowerCase();
    //         $("#myTable tr").filter(function () {
    //             $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    //         });
    //     });
    // });
    // $(function () {
    //     $('#datetimepicker1').datetimepicker();
    // });
</script>

</body>
</html>
