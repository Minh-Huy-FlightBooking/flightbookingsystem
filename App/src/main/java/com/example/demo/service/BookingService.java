package com.example.demo.service;

import com.example.demo.entity.Booking;
import com.example.demo.entity.Payment;
import com.example.demo.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingService {
    @Autowired
    private BookingRepository bookingRepository;

    public void saveNewBookingData (Booking booking) {
        bookingRepository.save(booking);
    }

    public Booking getBookingByPayment (Payment payment) {
        return bookingRepository.findByPayment(payment);
    }

    public Booking getBookingByPaymentId (int paymentId) {
        return  bookingRepository.findByPaymentPaymentId(paymentId);
    }

}
