package com.example.demo.service;

import com.example.demo.entity.Discount;
import com.example.demo.repository.DiscountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiscountService {
    @Autowired
    private DiscountRepository discountRepository;

    public List<Discount> getAllDiscount(){return (List<Discount>) discountRepository.findAll();}

    public boolean saveDiscount(Discount discount){
        try{
            discountRepository.save(discount);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
