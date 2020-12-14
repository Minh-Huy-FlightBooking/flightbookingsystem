package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {
    @RequestMapping(value = "/passenger", method = RequestMethod.GET)
    public String goToPassengerPage(){
        return "passenger";
    }
    @RequestMapping(value = "/administrator", method = RequestMethod.GET)
    public String goToAdministratorPage(){
        return "admin";
    }
    @RequestMapping(value = "/employee", method = RequestMethod.GET)
    public String goToEmployeePage(){
        return "employee";
    }
    @RequestMapping(value = "/")
    public String goToHomepage(){
        return "security";
    }

    @RequestMapping(value = "/loginPage")
    public String goToCustomLoginPage (){
        return "login";
    }
}
