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
<head>
    <title>Title</title>
</head>
<body>
    <h1>Aircraft Addition: </h1>
    <i>Please fill in the form to create a new aircraft</i>
    <div>
        <form:form action="handlingAircraftAddition" modelAttribute="aircraft">
            <c:if test="${status == 'Edit Aircraft'}">
                <div>
                    <h3>Id:</h3>
                    <form:input path="aircraftId" readonly="true"/>
                </div>
            </c:if>
            <div>
                <h3>Model Name:</h3>
                <form:input path="model"/>
            </div>
            <div>
                <h3>Total Business Seats:</h3>
                <form:input path="total_business"/>
            </div>
            <div>
                <h3>Total Economy Seats:</h3>
                <form:input path="total_economy"/>
            </div>
            <div>
                <h3>Enabled (0:inactive/ not ready; 1: active/ ready)</h3>
                <form:input path="enabled"/>
            </div>
            <div>
                <h3>Brand:</h3>
                <form:select path="brand.brandId" items="${brands}">

                </form:select>
            </div>
            <div>
                <h3>Airport:</h3>
                <form:select path="airport.airportId" items="${airports}">
                </form:select>
            </div>
            <div>
                <button type="submit">Add Aircraft</button>
            </div>

        </form:form>

    </div>
</body>
</html>
