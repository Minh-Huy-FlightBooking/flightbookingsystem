package com.example.demo.repository;

import com.example.demo.entity.FlightRoute;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FlightRouteRepository extends CrudRepository<FlightRoute,Integer> {
    FlightRoute findByRouteId(int id);
}
