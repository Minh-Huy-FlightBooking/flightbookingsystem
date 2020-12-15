package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employee")
public class GuestController {
    @RequestMapping(value = "/employee")
    public String goToEmployeePage (){
        return "employee";
    }
}
