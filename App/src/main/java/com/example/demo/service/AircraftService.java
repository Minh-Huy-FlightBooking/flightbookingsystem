package com.example.demo.service;

import com.example.demo.repository.AircraftRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AircraftService {
    @Autowired
    private AircraftRepository aircraftRepository;
}
