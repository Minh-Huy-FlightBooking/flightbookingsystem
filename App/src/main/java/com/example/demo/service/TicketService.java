package com.example.demo.service;

import com.example.demo.entity.Ticket;
import com.example.demo.object.TicketInformation;
import com.example.demo.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketService {
    @Autowired
    private TicketRepository ticketRepository;

    public Ticket getTicketByFlightIdAndSeatCode (int flightId, String seatCode) {
        return ticketRepository.findByFlightFlightIdAndSeatCode(flightId, seatCode);
    }
}
