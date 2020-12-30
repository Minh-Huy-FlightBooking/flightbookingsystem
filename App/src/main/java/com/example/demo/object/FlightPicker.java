package com.example.demo.object;

import java.util.List;

public class FlightPicker {
    private DepartureTrip departureTrip;
    private ReturnTrip returnTrip;
    private List<PassengerInformation> passengerInformation;
    private TicketInformation ticketInformation;
    public FlightPicker() {
    }

    public TicketInformation getTicketInformation() {
        return ticketInformation;
    }

    public void setTicketInformation(TicketInformation ticketInformation) {
        this.ticketInformation = ticketInformation;
    }

    public List<PassengerInformation> getPassengerInformation() {
        return passengerInformation;
    }

    public void setPassengerInformation(List<PassengerInformation> passengerInformation) {
        this.passengerInformation = passengerInformation;
    }

    public DepartureTrip getDepartureTrip() {
        return departureTrip;
    }

    public void setDepartureTrip(DepartureTrip departureTrip) {
        this.departureTrip = departureTrip;
    }

    public ReturnTrip getReturnTrip() {
        return returnTrip;
    }

    public void setReturnTrip(ReturnTrip returnTrip) {
        this.returnTrip = returnTrip;
    }
}
