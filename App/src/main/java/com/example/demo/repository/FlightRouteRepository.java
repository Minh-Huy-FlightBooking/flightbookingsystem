package com.example.demo.repository;

import com.example.demo.entity.Aircraft;
import com.example.demo.entity.FlightRoute;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FlightRouteRepository extends CrudRepository<FlightRoute,Integer> {
    FlightRoute findByRouteId(int id);
}
