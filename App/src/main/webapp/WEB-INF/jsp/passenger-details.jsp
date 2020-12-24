<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/23/20
  Time: 7:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jQuery Autocomplete</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="http://code.jquery.com/jquery-1.7.js"
            type="text/javascript"></script>
    <script
            src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
            type="text/javascript"></script>
    <link
            href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
            rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="container-fluid  bg-warning">Logo is here</div>

<div class="container-fluid bg-danger">
    Booking Process is displayed here
</div>
<div class="container border mt-2">
    <h3>
        Adult 1
    </h3>
    <h5>
        Please make sure that you enter the names of all passengers as shown on passports. This will avoid problems at
        the airport. Name changes are not permitted once the booking has been finalised.
    </h5>

    <form:form action="" modelAttribute="passenger">
        <div class="form-row">
            <div class="form-group col-md-1">
                <label for="title">Title</label>
                <form:select path="title" class="form-control" id="title">
                    <option value="Mr">Mr</option>
                    <option value="Mrs">Mrs</option>
                </form:select>
                    <%--<input type="email" class="form-control" id="inputEmail4" placeholder="Email">--%>
            </div>
            <div class="form-group col-md-2">
                <label for="firstName">First Name:</label>
                <form:input path="firstName" class="form-control" id="firstName" placeholder="First Name"/>
            </div>
            <div class="form-group col-md-2">
                <label for="lastName">Last Name</label>
                <form:input path="lastName" class="form-control" id="lastName" placeholder="Last Name"/>

            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="lastName">Gender</label>
                <form:select path="gender"  class="form-control" id="gender">
                    <option>Male</option>
                    <option>Female</option>
                    <option>Homosexuality</option>
                </form:select>
            </div>
            <div class="form-group col-md-2">
                <label for="dateOfBirth">Date Of Birth</label>
                <form:input path="dateOfBirth" type="date" class="form-control" id="dateOfBirth"/>
            </div>
            <div class="form-group col-md-2">
                <label for="firstName">Nationality</label>
                <form:select path="nationality"  class="form-control" id="nationality">
                    <option>Vietnam</option>
                    <option>USA</option>
                </form:select>
            </div>

        </div>
        <div class="form-row">
            <div class="form-group col-md-3">
                <label for="email">Email:</label>
                <form:input path="email" class="form-control" id="email"/>
            </div>
            <div class="form-group col-md-3">
                <label for="phoneNumber">Phone Number:</label>
                <form:input path="phoneNumber"  class="form-control" id="phoneNumber"/>
            </div>
        </div>
        <div class="form-group">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                <label class="form-check-label" for="invalidCheck">
                    Send Booking Data to this Email
                </label>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-3">
                <label for="lastName">Passport Number:</label>
                <form:input path="passportNumber" class="form-control"/>
            </div>
            <div class="form-group col-md-2">
                <label for="dateOfBirth">Expiry Date:</label>
                <form:input path="expiryDate" type="date" class="form-control"/>
            </div>
        </div>
        <button type="submit" class="btn btn-primary" style="width: 100px">Back</button>
        <button type="submit" class="btn btn-primary" style="width: 100px">Continue</button>
    </form:form>

</div>
<%--<div class="container border mt-2">

</div>--%>
</body>
</html>
