package com.example.demo.repository;

import com.example.demo.entity.Aircraft;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AircraftRepository extends CrudRepository<Aircraft,Integer> {
    Aircraft findByAircraftId(int aircraftId);
    List<Aircraft> findAircraftsByAirport_AirportId(int id);
}
