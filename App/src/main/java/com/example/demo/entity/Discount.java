package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "discount")
public class Discount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "discount_id")
    private int discount_id;

    @Column(name = "discount_code")
    private String discount_code;

    @Column(name = "discount_amount")
    private double discount_amount;

    @Column(name = "discount_quantity")
    private int discount_quantity;

    @ManyToOne
    @JoinColumn(name = "promotion_id")
    private Promotion promotion;

    public Discount() {
    }

    public int getDiscount_id() {
        return discount_id;
    }

    public void setDiscount_id(int discount_id) {
        this.discount_id = discount_id;
    }

    public String getDiscount_code() {
        return discount_code;
    }

    public void setDiscount_code(String discount_code) {
        this.discount_code = discount_code;
    }

    public double getDiscount_amount() {
        return discount_amount;
    }

    public void setDiscount_amount(double discount_amount) {
        this.discount_amount = discount_amount;
    }

    public int getDiscount_quantity() {
        return discount_quantity;
    }

    public void setDiscount_quantity(int discount_quantity) {
        this.discount_quantity = discount_quantity;
    }

    public Promotion getPromotion() {
        return promotion;
    }

    public void setPromotion(Promotion promotion) {
        this.promotion = promotion;
    }
}
