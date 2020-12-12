package com.example.demo.repository;

import com.example.demo.entity.Aircraft;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AircraftRepository extends CrudRepository<Aircraft,Integer> {
}
