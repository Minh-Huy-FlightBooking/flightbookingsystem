package com.example.demo.service;

import com.example.demo.entity.Flight;
import com.example.demo.repository.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlightService {
    @Autowired
    private FlightRepository flightRepository;

    public List<Flight> getAllFlight(){
        return (List<Flight>) flightRepository.findAll();
    }

    public Flight getFlightById(int id){
        return flightRepository.findByFlightId(id);
    }

    public boolean deleteFLight(int id){
        try{
            flightRepository.deleteById(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public boolean saveFlight(Flight flight){
        try{
            flightRepository.save(flight);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
