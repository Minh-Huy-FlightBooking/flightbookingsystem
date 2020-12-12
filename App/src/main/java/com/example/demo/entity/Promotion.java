package com.example.demo.entity;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "promotion")
public class Promotion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "promotion_id")
    private int promotionId;

    @Column(name = "event_name")
    private String eventName;

    @Column(name = "discount_amount")
    private double discountAmount;

    @Column(name = "end_date_of_event")
    private LocalDate endDateOfEvent;

    @OneToOne
    @JoinColumn(name = "flight_id")
    private Flight flight;
}
