package com.example.demo.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "ticket_type")
public class TicketType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ticket_type_id")
    private int ticketTypeId;

    @Column(name = "ticket_type_name")
    private String ticketTypeName;

    @Column(name = "rate")
    private double rate;

    @Column(name = "description")
    private String description;

    @OneToMany(mappedBy = "ticketType")
    private List<Ticket> tickets;
}
