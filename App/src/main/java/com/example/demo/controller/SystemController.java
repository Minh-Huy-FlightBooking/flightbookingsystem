package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class SystemController {
    @RequestMapping(value = "/")
    public String goToHomepage(){
        return "index";
    }
    @RequestMapping(value = "/test")
    public String goToTest (){
        return "test";
    }

}
