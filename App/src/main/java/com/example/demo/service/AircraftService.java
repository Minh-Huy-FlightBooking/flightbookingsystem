package com.example.demo.service;

import com.example.demo.entity.Aircraft;
import com.example.demo.repository.AircraftRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AircraftService {
    @Autowired
    private AircraftRepository aircraftRepository;

    public List<Aircraft> getAllAircraft (){
        return (List<Aircraft>) aircraftRepository.findAll();
    }

    public Map<Integer, String> getAllAircraftWithMapType(){
        Map<Integer, String> aircraftListMap = new HashMap<>();
        List<Aircraft> aircraft = getAllAircraft();
        if (!aircraft.isEmpty()){
            for (Aircraft a: aircraft){
                aircraftListMap.put(a.getAircraftId(), a.getModel());
            }
        }
        return aircraftListMap;
    }
    public void saveAircraft (Aircraft aircraft) {
        aircraftRepository.save(aircraft);
    }

    public void deleteAircraftById (int aircraftId){
        aircraftRepository.deleteById(aircraftId);
    }

    public Aircraft getAircraftById (int aircraftId){
        return aircraftRepository.findByAircraftId(aircraftId);
    }

    public List<Aircraft> getAircraftByAirportId(int id){return aircraftRepository.findAircraftsByAirport_AirportId(id);}
}
