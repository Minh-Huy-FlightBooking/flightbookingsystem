package com.example.demo.object;

import java.time.LocalDateTime;

public class FlightInformation {
    private int flightId;
    private TicketInformation ticketInformation;

    public FlightInformation() {
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public TicketInformation getTicketInformation() {
        return ticketInformation;
    }

    public void setTicketInformation(TicketInformation ticketInformation) {
        this.ticketInformation = ticketInformation;
    }
}
