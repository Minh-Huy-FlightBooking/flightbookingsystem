package com.example.demo.restAPI;

import com.example.demo.entity.Flight;
import com.example.demo.service.FlightRouteService;
import com.example.demo.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/")
public class WebAPI {
    @Autowired
    private FlightRouteService flightRouteService;

    @Autowired
    private FlightService flightService;

    @GetMapping("/origin")
    public Object getOrigins (){
        return flightRouteService.getAllOriginsWithMapType();
    }

    @GetMapping("/")

}
