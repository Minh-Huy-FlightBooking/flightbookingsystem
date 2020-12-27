package com.example.demo.restAPI;

import com.example.demo.entity.Airport;
import com.example.demo.entity.Flight;
import com.example.demo.object.FlightPicker;
import com.example.demo.service.AirportService;
import com.example.demo.service.FlightRouteService;
import com.example.demo.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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


    @RequestMapping(value = "/origin",method = RequestMethod.GET)
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

    @RequestMapping(value = "/flightPickerHandler",method = RequestMethod.POST, produces = "application/json")
    public Object getFlightsPicked (@RequestBody FlightPicker flightPicker){
        System.out.println("Here i go flight picker handler...");
        System.out.println(flightPicker);
        return flightPicker;
    }

}
