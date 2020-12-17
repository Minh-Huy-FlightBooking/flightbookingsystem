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

    public Promotion() {
    }

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(double discountAmount) {
        this.discountAmount = discountAmount;
    }

    public LocalDate getEndDateOfEvent() {
        return endDateOfEvent;
    }

    public void setEndDateOfEvent(LocalDate endDateOfEvent) {
        this.endDateOfEvent = endDateOfEvent;
    }

    public Flight getFlight() {
        return flight;
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }
}
