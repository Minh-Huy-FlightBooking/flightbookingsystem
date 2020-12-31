package com.example.demo.service;

import com.example.demo.entity.Brand;
import com.example.demo.repository.BrandRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BrandService {
    @Autowired
    private BrandRepository brandRepository;

    public List<Brand> getAllAircraftBrands() {
        return (List<Brand>) brandRepository.findAll();
    }

    public Map<Integer, String> getAllAircraftBrandsWithMapType() {
        Map<Integer, String> aircraftBrands = new HashMap<>();
        List<Brand> brandList = getAllAircraftBrands();
        if (!brandList.isEmpty()) {
            for (Brand b : brandList) {
                aircraftBrands.put(b.getBrandId(), b.getBrandName());
            }
        }
        return aircraftBrands;
    }
}
