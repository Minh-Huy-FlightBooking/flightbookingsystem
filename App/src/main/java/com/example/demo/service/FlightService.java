package com.example.demo.service;

import com.example.demo.entity.Flight;
import com.example.demo.entity.Ticket;
import com.example.demo.repository.FlightRepository;
import com.example.demo.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class FlightService {
    @Autowired
    private FlightRepository flightRepository;

    @Autowired
    private TicketRepository ticketRepository;
    //Search flights
    public List<Flight> getAllOneWayFlightsBySearchConditions (String origin, String destination, LocalDateTime departureDate,LocalDateTime departureDate2,int numberOfPeople){
        List<Flight> flights = flightRepository.findFlightsByFlightRouteAndDepartureTime(origin, destination,departureDate, departureDate2);
        List<Flight> flightsFiltered = new ArrayList<>();
        if (!flights.isEmpty()){
            for (Flight f: flights){
                List<Ticket> tickets = ticketRepository.findByFlightAndEnabled(f, true);
                if (tickets.size() >= numberOfPeople) {
                    System.out.println(f.getFlightId());
                    flightsFiltered.add(f);
                }
            }
        }
        return flightsFiltered;
    }

   /* public List<Flight> getAllFlightsTest (LocalDateTime date, LocalDateTime date2){
        return flightRepository.findByDepartureTimeHere(date, date2);
    }
    public List<Flight> getAllFlightsByDepartureDate (LocalDateTime date, LocalDateTime date2){
        return flightRepository.findByDepartureTimeBetween(date, date2);
    }*/
    //
    public List<Flight> getAllFlight(){
        return (List<Flight>) flightRepository.findAll();
    }

    public Flight getFlightById(int id){
        return flightRepository.findByFlightId(id);
    }

    public boolean deleteFLight(int id){
        try{
            flightRepository.deleteById(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public boolean saveFlight(Flight flight){
        try{
            flightRepository.save(flight);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
