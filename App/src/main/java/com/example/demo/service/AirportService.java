package com.example.demo.service;

import com.example.demo.entity.Airport;
import com.example.demo.repository.AirportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AirportService {
    @Autowired
    private static AirportRepository airportRepository;

    public static List<Airport> getAll(){
        return (List<Airport>) airportRepository.findAll();
    }

}
