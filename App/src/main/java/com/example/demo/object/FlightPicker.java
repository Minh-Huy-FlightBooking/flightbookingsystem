package com.example.demo.object;

public class FlightPicker {
    private DepartureTrip departureTrip;
    private ReturnTrip returnTrip;

    public FlightPicker() {
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
