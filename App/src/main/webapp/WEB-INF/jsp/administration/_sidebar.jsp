<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/22/2020
  Time: 1:21 AM
  To change this template use File | Settings | File Templates.
--%>
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
                    <a href="flightList" class="functionButton">
                        <div class="c-menu__item__inner" id="content-flight-route"><i class="fa fa-plane"></i>
                            <div class="c-menu-item__title"><span>Flights</span></div>
                        </div>
                    </a>
                </li>
                <li class="c-menu__item has-submenu" data-toggle="tooltip" title="Gifts">
                    <a href="flightRouteList" class="functionButton">
                        <div class="c-menu__item__inner"><i class="fa fa-gift"></i>
                            <div class="c-menu-item__title"><span>FLight Route</span></div>
                        </div>
                    </a>
                </li>
                <li class="c-menu__item has-submenu" data-toggle="tooltip" title="Gifts">
                    <a href="viewAircraft" class="functionButton">
                        <div class="c-menu__item__inner"><i class="fa fa-gift"></i>
                            <div class="c-menu-item__title"><span>Aircraft</span></div>
                        </div>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
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
