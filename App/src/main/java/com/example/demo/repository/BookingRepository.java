package com.example.demo.repository;

import com.example.demo.entity.Booking;
import com.example.demo.entity.Payment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends CrudRepository<Booking, Integer> {
    Booking findByPayment(Payment payment);
    Booking findByPaymentPaymentId(int paymentId);
}
