package com.example.demo.service;

import com.example.demo.entity.Airport;
import com.example.demo.entity.FlightRoute;
import com.example.demo.repository.FlightRouteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FlightRouteService {
    @Autowired
    private FlightRouteRepository flightRouteRepository;

    public List<FlightRoute> getAllFlightRoute(){
        return (List<FlightRoute>) flightRouteRepository.findAll();
    }

    public Map<Integer, String> getAllFlightRouteNameWithMap (){
        List<FlightRoute> routeList = getAllFlightRoute();
        Map<Integer, String> routes = new HashMap<>();
        if (!routeList.isEmpty()){
            for (FlightRoute fr: routeList){
                routes.put(fr.getRouteId(), fr.getOriginAirport().getAirportName());
            }
        }
        return routes;
    }

    public FlightRoute getFlightRouteById(int id){
        return flightRouteRepository.findByRouteId(id);
    }
    public boolean saveFlightRoute(FlightRoute flightRoute){
        try {
            flightRouteRepository.save(flightRoute);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public boolean deleteFlightRoute(int id){
        try {
            flightRouteRepository.deleteById(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
