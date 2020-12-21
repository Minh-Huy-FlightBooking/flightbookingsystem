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
    <title>User Cart View</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/adminHome.css"/>"/>
    <script src="<c:url value="/resources/js/adminHome.js"/>"></script>
    <style>
        Dashboard function button
        a.functionButton {
            color: white;
            text-decoration: none;
        }

        a.functionButton:hover {
            color: white;
            text-decoration: none;
        }

        .mycolor {
            background-color: #0dd6b8;
            border-color: #0dd6b8;
            color: white
        }
    </style>
</head>
<body>

<body class="sidebar-is-reduced">
<header class="l-header">
    <div class="l-header__inner clearfix">
        <div class="c-header-icon js-hamburger">
            <div class="hamburger-toggle"><span class="bar-top"></span><span class="bar-mid"></span><span
                    class="bar-bot"></span></div>
        </div>
        <div class="c-header-icon has-dropdown"><span class="c-badge c-badge--header-icon animated shake">87</span><i
                class="fa fa-bell"></i>
            <div class="c-dropdown c-dropdown--notifications">
                <div class="c-dropdown__header"></div>
                <div class="c-dropdown__content"></div>
            </div>
        </div>
        <div class="c-search">
            <input class="c-search__input u-input" placeholder="Search..." type="text"/>
        </div>
        <div class="header-icons-group">
            <div class="c-header-icon basket"><span class="c-badge c-badge--header-icon animated shake">12</span><i
                    class="fa fa-shopping-basket"></i></div>
            <div class="c-header-icon logout"><i class="fa fa-power-off"></i></div>
        </div>
    </div>
</header>
<div class="l-sidebar" style="position:fixed">
    <div class="logo">
        <div class="logo__txt">D</div>
    </div>
    <div class="l-sidebar__content">
        <nav class="c-menu js-menu">
            <ul class="u-list">
                <li class="c-menu__item is-active" data-toggle="tooltip" title="Flights">
                    <div class="c-menu__item__inner" id="content-flight-route"><i class="fa fa-plane"></i>
                        <div class="c-menu-item__title"><span>Flights</span></div>
                    </div>
                </li>
                <li class="c-menu__item has-submenu" data-toggle="tooltip" title="Modules">
                    <div class="c-menu__item__inner"><i class="fa fa-puzzle-piece"></i>
                        <div class="c-menu-item__title"><span>Modules</span></div>
                        <div class="c-menu-item__expand js-expand-submenu"><i class="fa fa-angle-down"></i></div>
                    </div>
                    <ul class="c-menu__submenu u-list">
                        <li>Payments</li>
                        <li>Maps</li>
                        <li>Notifications</li>
                    </ul>
                </li>
                <li class="c-menu__item has-submenu" data-toggle="tooltip" title="Statistics">
                    <div class="c-menu__item__inner"><i class="fa fa-bar-chart"></i>
                        <div class="c-menu-item__title"><span>Statistics</span></div>
                    </div>
                </li>
                <li class="c-menu__item has-submenu" data-toggle="tooltip" title="Gifts">
                    <a href="flightRouteList" class="functionButton">
                        <div class="c-menu__item__inner"><i class="fa fa-gift"></i>
                            <div class="c-menu-item__title"><span>FLight Route</span></div>
                        </div>
                    </a>
                </li>
                <li class="c-menu__item has-submenu" data-toggle="tooltip" title="Gifts">
                    <a href="addAircraft" class="functionButton">
                        <div class="c-menu__item__inner"><i class="fa fa-gift"></i>
                            <div class="c-menu-item__title"><span>Add Aircraft</span></div>
                        </div>
                    </a>
                </li>
                <li class="c-menu__item has-submenu" data-toggle="tooltip" title="Gifts">
                    <a href="viewAircraft" class="functionButton">
                        <div class="c-menu__item__inner"><i class="fa fa-plane" aria-hidden="true"></i>
                            <div class="c-menu-item__title"><span>View Aircraft</span></div>
                        </div>
                    </a>
                </li>
                <li class="c-menu__item has-submenu" data-toggle="tooltip" title="View Route">
                    <a href="flightRouteList" class="functionButton">
                        <div class="c-menu__item__inner"><i class="fa fa-road" aria-hidden="true"></i>
                            <div class="c-menu-item__title"><span>Route</span></div>
                        </div>
                    </a>
                </li>
                <li class="c-menu__item has-submenu" data-toggle="tooltip" title="Settings">
                    <div class="c-menu__item__inner"><i class="fa fa-cogs"></i>
                        <div class="c-menu-item__title"><span>Settings</span></div>
                    </div>
                </li>
            </ul>
        </nav>
    </div>
</div>
<main class="l-main">
    <div class="content-wrapper content-wrapper--with-bg">
        <h1 class="page-title">Dashboard</h1>
        <div class="page-content" id="page-content" style="padding: 0">
            <!-- phần này view cả panel -->
            <div class="card">
                <div class="card-header">
                    <!-- Đây là nút thêm mới -->
                    <h3>Admin<a href="admin_productManager_add" class="btn btn-sm float-right mycolor" title="thêm mới"><i
                            class="fa fa-plus"></i></a></h3>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Add New Flight Route <span>${message}</span></h5>
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
    "use strict";
    let Dashboard = function () {
        let global = {
            tooltipOptions: {
                placement: "right"
            },
            menuClass: ".c-menu"
        };

        let menuChangeActive = function menuChangeActive(el) {
            let hasSubmenu = $(el).hasClass("has-submenu");
            $(global.menuClass + " .is-active").removeClass("is-active");
            $(el).addClass("is-active");

            // if (hasSubmenu) {
            // 	$(el).find("ul").slideDown();
            // }
        };

        let sidebarChangeWidth = function sidebarChangeWidth() {
            let $menuItemsTitle = $("li .menu-item__title");

            $("body").toggleClass("sidebar-is-reduced sidebar-is-expanded");
            $(".hamburger-toggle").toggleClass("is-opened");

            if ($("body").hasClass("sidebar-is-expanded")) {
                $('[data-toggle="tooltip"]').tooltip("destroy");
            } else {
                $('[data-toggle="tooltip"]').tooltip(global.tooltipOptions);
            }
        };

        return {
            init: function init() {
                $(".js-hamburger").on("click", sidebarChangeWidth);

                $(".js-menu li").on("click", function (e) {
                    menuChangeActive(e.currentTarget);
                });

                $('[data-toggle="tooltip"]').tooltip(global.tooltipOptions);
            }
        };
    }();

    Dashboard.init();
    //# sourceURL=pen.js
</script>
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
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
</body>
</html>
