package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(name = "/employee")
public class EmployeeController {
    @RequestMapping(value = "/employee")
    public String goToEmployeePage (){
        return "employee";
    }


}
