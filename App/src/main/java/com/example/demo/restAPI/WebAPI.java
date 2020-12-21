package com.example.demo.restAPI;

import com.example.demo.entity.Airport;
import com.example.demo.entity.Flight;
import com.example.demo.service.AirportService;
import com.example.demo.service.FlightRouteService;
import com.example.demo.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "/")
public class WebAPI {
    @Autowired
    private FlightRouteService flightRouteService;

    @Autowired
    private FlightService flightService;

    @Autowired
    private AirportService airportService;


    @GetMapping("/origin")
    public Object getOrigins (){
        List<String> airports = new ArrayList<>();
        for (Airport a: airportService.getAllAirports()){
            airports.add(a.getAirportName());
        }
        return airports;
    }
    @GetMapping("/destination/{origin}")
    public Object getDestinationCorrespondingOrigin (@PathVariable(value = "origin")String origin) {
        return flightRouteService.getAllDestinationsNameByOriginName(origin);
    }

}
