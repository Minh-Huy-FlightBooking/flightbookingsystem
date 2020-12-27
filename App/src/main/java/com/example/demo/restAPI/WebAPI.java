package com.example.demo.restAPI;

import com.example.demo.entity.Airport;
import com.example.demo.entity.Flight;
import com.example.demo.entity.FlightRoute;
import com.example.demo.service.AirportService;
import com.example.demo.service.FlightRouteService;
import com.example.demo.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @PostMapping("/admin/destination")
    public Object getDestinationById(@RequestBody int id){
        List<String> json = new ArrayList<>();
        json.add(flightRouteService.getFlightRouteById(id).getDestinationAirport().getAirportName());
        System.out.println("ji");
        return json;
    }
}
