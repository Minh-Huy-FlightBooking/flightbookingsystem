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
        <div class="content-wrapper content-wrapper--with-bg">
            <%--................--%>
            <div class="page-content" style="background: #e67e22;color: #fff">
                <h1>Aircraft Addition: </h1>
                <i>Please fill in the form to create a new aircraft</i>
            </div>
            <%----------------%>
            <div class="card"  style="padding: 2rem">
                <div class="card-body">
                    <form:form action="handlingAircraftAddition" modelAttribute="aircraft">
                        <c:if test="${status == 'Edit Aircraft'}">
                            <div class="form-group col-md-4 px-0">
                                <label for="">Id</label>
                                <form:input path="aircraftId" readonly="true" class="form-control" placeholder=""/>
                            </div>
                        </c:if>
                        <div class="form-group col-md-4 px-0">
                            <label for="">Model</label>
                            <form:input path="model"  class="form-control" id="" placeholder="model"/>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="">Total Business</label>
                                <form:input path="total_business" class="form-control" id="" placeholder="Email"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Total Economy</label>
                                <form:input path="total_economy" class="form-control" id="" placeholder="Password"/>
                            </div>
                        </div>
                        <div class="form-group col-md-4 px-0">
                            <label for="">Enabled (Active: true, Inactive: false</label>
                            <form:input path="enabled" class="form-control" id="" placeholder="1234 Main St"/>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="">Airport:</label>
                                <form:select path="airport.airportId" items="${airports}" class="form-control">
                                </form:select>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Brand:</label>
                                <form:select path="brand.brandId" items="${brands}" class="form-control">
                                </form:select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Aircraft</button>
                    </form:form>
                </div>
        </div>
            <br><br>
        </div>
    </main>
    <script>
        $(document).ready(function(){
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>

</body>
</html>
