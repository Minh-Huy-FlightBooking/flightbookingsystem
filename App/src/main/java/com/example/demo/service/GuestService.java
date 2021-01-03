package com.example.demo.service;

import com.example.demo.entity.Guest;
import com.example.demo.repository.GuestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GuestService {
    @Autowired
    private GuestRepository guestRepository;

    public List<Guest> getAllGuestsByFirstNameAndLastNameAndPhoneNumberAndEmail(String firstName, String lastName, String phoneNumber, String email) {
        return (List<Guest>) guestRepository.findAllByFirstNameLikeAndLastNameLikeAndPhoneNumberLikeAndEmailLike(firstName, lastName, phoneNumber, email);
    }

    public Guest getGuestDataByByFirstNameAndLastNameAndPhoneNumberAndEmail(String firstName, String lastName, String phoneNumber, String email){
        return guestRepository.findByFirstNameAndLastNameAndPhoneNumberAndEmail(firstName, lastName, phoneNumber, email);
    }
    public void saveNewGuestData (Guest guest){
        guestRepository.save(guest);
    }
}
