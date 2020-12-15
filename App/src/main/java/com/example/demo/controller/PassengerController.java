package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/passenger", "/"})
public class PassengerController {
    @RequestMapping(value = "/")
    public String goToHomepage(){
        return "security";
    }
}
