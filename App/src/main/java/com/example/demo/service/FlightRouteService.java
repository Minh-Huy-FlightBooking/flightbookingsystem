package com.example.demo.service;

import com.example.demo.entity.Airport;
import com.example.demo.repository.FlightRouteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class FlightRouteService {
    @Autowired
    private static FlightRouteRepository flightRouteRepository;
    @Autowired
    private static AirportService airportService;


    public static void main(String[] args) {
        System.out.println(airportService.getAllAirports());
    }
}
