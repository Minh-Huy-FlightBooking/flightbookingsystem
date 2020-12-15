package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {





    @RequestMapping(value = "/loginPage")
    public String goToCustomLoginPage (){
        return "login";
    }

    @RequestMapping(value = "/flightList")
    public String goToFlightListPage (){
        return "administration/flight-list";
    }
//    @RequestMapping(value = "/admin")
//    public String goToAdmin (){
//        return "admin";
//    }

    @RequestMapping(value = "/administrator", method = RequestMethod.GET)
    public String goToAdministratorPage(){
        return "admin2";
    }
}
