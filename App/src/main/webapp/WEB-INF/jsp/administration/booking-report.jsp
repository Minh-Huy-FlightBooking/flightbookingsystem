<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01/05/21
  Time: 3:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.debug.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>

    <jsp:include page="_head.jsp"/>
    <script>
        let totalPrice;
        $(document).ready(function () {
        })

    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row mt-2">
        <div class="col-sm-2">
            <div class="card">
                <div class="card-body d-flex justify-content-center">
                    <h1 style="color: #d592ff;font-weight: 900">ADMIN</h1>
                </div>
            </div>
        </div>
        <div class="col-sm-10">
            <div class="card">
                <div class="card-body">
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Brand</small></h3>
                </div>
            </div>
        </div>
    </div>
    <hr class="mb-4">
    <div class="row">
        <div class="col-sm-2">
            <ul class="list-group">
                <div class="list-group">
                    <a href="/admin/viewFlight" class="list-group-item">Flight</a>
                    <a href="/admin/viewFlightRoute" class="list-group-item">FLight Route</a>
                    <a href="/admin/viewAircraft" class="list-group-item">Aircraft</a>
                    <a href="/admin/viewAirport" class="list-group-item">Airport</a>
                    <a href="#" class="list-group-item">Customer</a>
                    <a href="/admin/viewBrand" class="list-group-item" disabled>Brand</a>
                </div>
            </ul>
        </div>
        <div class="col-sm-10">
            <div class="card shadow">
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-sm-5">
                            <h5 style="color: #333;font-weight: 600">Booking List&nbsp;&nbsp;&nbsp;
                                <a href="/admin/addBrand" title="Add a new Ticket" class="btn btn-sm mycolor">
                                    <i class="fa fa-plus"></i></a>
                                <span>
                                    <form>
                                        <input type="date" alt="date-from" placeholder="Date From">
                                        <input type="date" alt="date-to" placeholder="Date To">
                                        <button type="submit">Search</button>
                                    </form>
                                </span>
                            </h5>
                        </div>
                        <div class="col-sm-7">
                            <c:if test="${message=='Delete successed.'}">
                                <div class="alert" style="background-color:#b7eb8f;color: #333">${message}</div>
                            </c:if>
                            <c:if test="${message=='Delete failed.'}">
                                <div class="alert" style="background-color:#ffccc7;color: #333">${message}</div>
                            </c:if>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12 " id="report-table-container">
                            <table id="booking-table-container" class="table table-hover table-bordered w-100">
                                <thead>
                                <tr align="center">
                                    <th>ID</th>
                                    <th>
                                        Payment <br/> Status
                                    </th>
                                    <th>
                                        Payment <br/> Method
                                    </th>
                                    <th>
                                        Card <br/> Number
                                    </th>
                                    <th>
                                        Email
                                    </th>
                                    <th>
                                        Name
                                    </th>
                                    <th>
                                        Payment <br/> Date
                                    </th>
                                    <th>
                                        Total <br/> Payment
                                    </th>
                                    <%--<th>Edit</th>--%>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${bookings}" var="b">
                                    <tr align="center">
                                        <td>${b.bookingId}</td>
                                        <td>${b.payment.status}</td>
                                        <td>${b.payment.paymentMethod}</td>
                                        <td>${b.payment.creditCard.cardNumber}</td>
                                        <td>${b.guest.email}</td>
                                        <td>
                                                ${b.guest.firstName} &nbsp; ${b.guest.lastName}
                                            <br/>
                                                ${b.guest.guestId}
                                        </td>
                                        <td>
                                                ${b.payment.paymentId}
                                                ${b.payment.paymentDate}
                                        </td>
                                        <td>${b.payment.totalPayment} <pan id="unit">$</pan></td>
                                       <%-- <td>
                                            <a href="/admin/deleteBooking?id=${b.bookingId}" class="btn btn-sm mycolor"><i
                                                    class="fa fa-trash-o"></i></a>
                                        </td>--%>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="7">Total:</td>
                                    <td id="totalPrice">${totalPrice} <span class="unit">$</span></td>
                                </tr>
                                <tr>
                                    <td colspan="6"></td>
                                    <td>
                                        <button onclick="">
                                            Print Pdf
                                        </button>
                                    </td>
                                    <td>
                                        <button onclick="">
                                            Get Excel
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br><br>
</body>
</html>
