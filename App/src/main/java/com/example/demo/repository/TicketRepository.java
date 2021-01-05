package com.example.demo.repository;

import com.example.demo.entity.Flight;
import com.example.demo.entity.Ticket;
import com.example.demo.entity.TravelClass;
import com.example.demo.object.TicketInformation;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface TicketRepository extends CrudRepository<Ticket, Integer> {

    /* @Query("select t from Ticket t " +
             "where t.flight.flightRoute.originAirport.airportName like %:origin% " +
             "and t.flight.flightRoute.destinationAirport.airportName like  %:destination% " +
             "and t.flight.departureTime = :departureTime " +
             "and t.enabled = true")
     List<Ticket> findAllTicketsFromSearch(@Param("origin") String origin, @Param("destination") String destination, @Param("departureTime") LocalDate departureTime);
 */
    /*@Query("select t from Ticket t " +
            "where t.flight = :flight " +
            "and t.enabled = true ")*/
    List<Ticket> findByFlightAndEnabled (Flight flight, boolean enabled);
    Ticket findByFlightFlightIdAndSeatCode (int flightId, String seatCode);

    Ticket findByFlightFlightIdAndSeatCodeAndAndTravelClass(int flightId, String seatCode, TravelClass travelClass);
    void deleteByTicketId(int id);
    List<Ticket> findByFlight_FlightId(int id);
    List<Ticket> findByFlightFlightIdAndTravelClassClassName (int flightId, String travelClass);

    @Query("select t from Ticket t where t.booking.bookingId = :bookingId and lower(t.passenger.lastName) like %:lastName%")
    List<Ticket> findByBookingIdAndLowercaseLastName (int bookingId, String lastName);
}
