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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/adminHome.css"/>"/>
    <script src="<c:url value="/resources/js/adminHome.js"/>"></script>
    <style>
        .mycolor{
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
            <div class="hamburger-toggle"><span class="bar-top"></span><span class="bar-mid"></span><span class="bar-bot"></span></div>
        </div>
        <div class="c-header-icon has-dropdown"><span class="c-badge c-badge--header-icon animated shake">87</span><i class="fa fa-bell"></i>
            <div class="c-dropdown c-dropdown--notifications">
                <div class="c-dropdown__header"></div>
                <div class="c-dropdown__content"></div>
            </div>
        </div>
        <div class="c-search">
            <input class="c-search__input u-input" placeholder="Search..." type="text" />
        </div>
        <div class="header-icons-group">
            <div class="c-header-icon basket"><span class="c-badge c-badge--header-icon animated shake">12</span><i class="fa fa-shopping-basket"></i></div>
            <div class="c-header-icon logout"><a href="/logout"><i class="fa fa-power-off"></i></a></div>
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
                    <div class="c-menu__item__inner"><i class="fa fa-plane"></i>
                        <div class="c-menu-item__title" id="content-flight-route"><span>Flights</span></div>
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
                    <div class="c-menu__item__inner"><i class="fa fa-gift"></i>
                        <div class="c-menu-item__title"><span>Gifts</span></div>
                    </div>
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
                        <div class="c-menu__item__inner"><i class="fa fa-gift"></i>
                            <div class="c-menu-item__title"><span>View Aircraft</span></div>
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
</body>
<main class="l-main">
    <div class="content-wrapper content-wrapper--with-bg">
        <h1 class="page-title">Dashboard</h1>
        <%--................--%>
        <div class="page-content" style="background: rgb(180,180,180)">
            <h1>Flight Addition: </h1>
            <i>Please fill in the form to create a new flight</i>
        </div>
        <%----------------%>
        <div class="page-content" id="page-content" style="padding: 2rem">
            <form:form action="handlingAircraftAddition" modelAttribute="flight">
                <c:if test="${status == 'Edit Flight'}">
                    <div class="form-group col-md-4 px-0">
                        <label for="">Id</label>
                        <form:input path="flightId" readonly="true" class="form-control" placeholder=""/>
                    </div>
                </c:if>
<%--                <div class="form-group col-md-4 px-0">--%>
<%--                    <label for="">Model</label>--%>
<%--                    <form:input path="departureTime"  class="form-control" id="" placeholder="model"/>--%>
<%--                </div>--%>
                <%--<div class="form-row">
                    <div class="form-group col-md-4">
                        <form:select path="flightRoute" class="form-control">
                            <form:options items="${originAirport}" itemLabel="airportName"/>
                        </form:select>

                    </div>
                    <div class="form-group col-md-4">
                        <label for="">Total Economy</label>
                        <form:select path="destinationAirport" class="form-control">
                            <form:options items="${destinationAirport}" itemLabel="airportName"/>
                        </form:select>
                    </div>
                </div>--%>

<%--                <div class="form-row">--%>
<%--                    <div class="form-group col-md-2">--%>
<%--                        <label for="">Departure Time:</label>--%>
<%--                        <form:input path="" class="form-control" id="" placeholder="model"/>--%>
<%--                    </div>--%>
<%--                    <div class="form-group col-md-2">--%>
<%--                        <label for="">Arrival Time:</label>--%>
<%--                        <form:input path="" class="form-control" id="" placeholder="1234 Main St"/>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label for="">Departure Time:</label>
                        <form:input path="departureTime" type="date" class="form-control" id="" placeholder="model"/>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="">Arrival Time:</label>
                        <form:input path="arrivalTime" type="date" class="form-control" id="" placeholder="1234 Main St"/>
                    </div>
                </div>
                <div class="form-group col-md-4 px-0">
                    <label for="">Aircraft</label>
                    <form:select path="aircraft" class="form-control" items="${aircraft}">
<%--                        <form:options items="${aircraft}" itemLabel="airportName"/>--%>
                    </form:select>
<%--                    <form:input path="aircraft"  class="form-control" id="" placeholder="1234 Main St"/>--%>
                </div>
                <div class="form-group col-md-4 px-0">
                    <label for="">Flight Status:</label>
                    <form:input path="flightStatus" class="form-control" id="" placeholder="1234 Main St"/>
                </div>
<%--                <div class="form-row">--%>
<%--                    <div class="form-group col-md-4">--%>
<%--                        <label for="">Airport:</label>--%>
<%--                        <form:select path="" items="${airports}" class="form-control">--%>
<%--                        </form:select>--%>
<%--                    </div>--%>
<%--                    <div class="form-group col-md-4">--%>
<%--                        <label for="">Brand:</label>--%>
<%--                        <form:select path="" items="${brands}" class="form-control">--%>
<%--                        </form:select>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <button type="submit" class="btn btn-primary">Add Aircraft</button>
            </form:form>
        </div>
    </div>
</main>
<script>
    "use strict";
    let Dashboard = function() {
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

                $(".js-menu li").on("click", function(e) {
                    menuChangeActive(e.currentTarget);
                });

                $('[data-toggle="tooltip"]').tooltip(global.tooltipOptions);
            }
        };
    }();

    Dashboard.init();
    //# sourceURL=pen.js
</script>
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
