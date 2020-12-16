package com.example.demo.service;

import com.example.demo.entity.Airport;
import com.example.demo.repository.AirportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AirportService {
    @Autowired
    private AirportRepository airportRepository;

    public List<Airport> getAllAirports (){
        return (List<Airport>) airportRepository.findAll();
    }

    public Map<Integer, String> getAllAirportsWithMapType () {
        List<Airport> airportList = getAllAirports();
        Map<Integer, String> airports = new HashMap<>();

        if (!airportList.isEmpty()){
            for (Airport a: airportList){
                airports.put(a.getAirportId(), a.getAirportName());
            }
        }
        return airports;
    }
}
