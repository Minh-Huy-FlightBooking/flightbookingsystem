<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/15/2020
  Time: 7:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<style>

    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Jotia,sans-serif;
    }
    .btn-learn-more:hover{
        color: #5C0931;
        text-shadow: #333 2px 2px 10px;
    }
    body{
        min-height: 300vh;
    }
    .img-header{
        height: 600px;
        width: 100%;
        overflow: hidden;
        background: linear-gradient(180deg ,rgba(0, 0, 0, 0.3),rgba(255, 255, 255, 0) 75%) ,url('img/thanhxuan.jpg') no-repeat center center;
        background-size: cover;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
    }
    header a img.logo-home{
        display: block;
        max-width:250px;
        max-height:90px;
        width: auto;
        height: auto;
    }
    header{
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        transition: 0.6s;
        padding: 0px 80px;
        z-index: 100000;
    }
    header .logo{
        position: relative;
        letter-spacing: 2px;
        transition: 0.6s;
        color: #fff;
    }
    header .logo .logo-home{
        filter: brightness(0) invert(1);
    }
    header ul {
        height: 100%;
        margin-top:  0;
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    header.sticky{
        padding:  5px 100px;
        background:  #fff;
        box-shadow: 0px 0px 10px 0px;
    }
    .contain-img-header{
        margin: 200px 40px 40px 83px;
    }
    header ul li{
        width: 100%;
        height: 100%;
        padding : 20px 0px 6px 0px;
        position: relative;
        list-style: none;
    }
    header ul li a{
        position: relative;
        margin: 0 15px;
        text-decoration: none;
        color: #FFF;
        letter-spacing: 2px;
        font-weight: 400;
        transition: 0.6s;
    }
    header ul li:hover{
        background-color: white ;
        color: #5C0931;
    }
    header ul li a:hover{
        color: #5C0931;
    }
    .banner{
        position: relative;
        width: 100%;
        height: 100%;
        background-size: cover;
    }
    header.sticky .logo .logo-home{
        filter: contrast(100%);
    }
    header.sticky .logo,
    header.sticky ul li a{
        color: #5C0931;
    }


</style>
