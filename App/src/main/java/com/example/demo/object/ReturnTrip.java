package com.example.demo.object;

public class ReturnTrip {
    private int returnFlightId;
    private String travelClass;
    private int adults;
    private int children;
    private int infant;

    public ReturnTrip() {
    }

    public int getReturnFlightId() {
        return returnFlightId;
    }

    public void setReturnFlightId(int returnFlightId) {
        this.returnFlightId = returnFlightId;
    }

    public String getTravelClass() {
        return travelClass;
    }

    public void setTravelClass(String travelClass) {
        this.travelClass = travelClass;
    }

    public int getAdults() {
        return adults;
    }

    public void setAdults(int adults) {
        this.adults = adults;
    }

    public int getChildren() {
        return children;
    }

    public void setChildren(int children) {
        this.children = children;
    }

    public int getInfant() {
        return infant;
    }

    public void setInfant(int infant) {
        this.infant = infant;
    }
}
