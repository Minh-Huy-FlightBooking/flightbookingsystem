package com.example.demo.controller;

import com.example.demo.entity.Flight;
import com.example.demo.object.FlightPicker;
import com.example.demo.object.PassengerInformation;
import com.example.demo.object.TicketInformation;
import com.example.demo.restAPI.WebAPI;
import com.example.demo.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping(value = "/")
public class SystemController {
    @Autowired
    private FlightService flightService;
    
    @Autowired
    private WebAPI webAPI;

    @RequestMapping(value = "/")
    public String goToHomepage(){
        return "index";
    }

    @RequestMapping(value = "/home")
    public String goToHome (){
        return "home";
    }

    //////////////////////////////
    // a function to looking for a flight / ticket !!!
    @RequestMapping(value = "/ticketSearch")
    public String goToTicketSearch(Model model, HttpServletRequest request){
        model.addAttribute("sessionId", request.getSession().getId());
        System.out.println(request.getSession().getId());
        model.addAttribute("ticketInformation", new TicketInformation());
        return "ticket-searching-test";
    }
    // Return Ticket Searched's Results
    @RequestMapping(value = "/ticketSearch", method = RequestMethod.POST)
    public String goToTicketList (@ModelAttribute("ticketForm") TicketInformation t, Model model, HttpServletRequest request) {
        /*System.out.println(t.getOrigin());
        System.out.println(t.getDestination());
        System.out.println(t.getTripType());
        System.out.println(t.getDepartureDate());
        System.out.println(t.getReturnDate());
        System.out.println(t.getPassengerType().getNumberOfAdults());
        System.out.println(t.getPassengerType().getNumberOfChildren());
        System.out.println(t.getPassengerType().getNumberOfInfant());
        System.out.println(t.getTravelClass());*/
        model.addAttribute("sessionId", request.getSession().getId());
        /*int numberOfPeople = t.getPassengerType().getNumberOfAdults() + t.getPassengerType().getNumberOfChildren() + t.getPassengerType().getNumberOfInfant();*/
        int numberOfPeople = t.getAdults() + t.getChildren() + t.getInfant();
        /////////////
        // Departure Time
        LocalDateTime initialTimeOfDepartureDate = t.getDepartureDate().atStartOfDay();
        LocalDateTime endTimeOfDepartureDate = t.getDepartureDate().atTime(23,59);

        model.addAttribute("sessionId", request.getSession().getId());
        //Format!!!
        /*System.out.println(initialTimeOfDepartureDate);*/
        model.addAttribute("ticketInformation", t);
        if (t.getTripType().equals("oneWay")){
            model.addAttribute("departFlights", flightService.getAllOneWayFlightsBySearchConditions(t.getOrigin(), t.getDestination(),initialTimeOfDepartureDate, endTimeOfDepartureDate, numberOfPeople));
        } else if (t.getTripType().equals("roundTrip")) {
            //This is an easy way to show data --> upgrade later!!!
            model.addAttribute("departFlights", flightService.getAllOneWayFlightsBySearchConditions(t.getOrigin(), t.getDestination(),initialTimeOfDepartureDate, endTimeOfDepartureDate, numberOfPeople));
            LocalDateTime initialTimeOfReturnDate = t.getReturnDate().atStartOfDay();
            LocalDateTime endTimeOfReturnDate = t.getReturnDate().atTime(23, 59);
            model.addAttribute("returnFlights", flightService.getAllOneWayFlightsBySearchConditions( t.getDestination(), t.getOrigin(), initialTimeOfReturnDate,endTimeOfReturnDate, numberOfPeople));

            //Display table return flights!!!
            model.addAttribute("returnStatus", "true");
        }
        return "ticket-list";
    }
    //////////////////////////////
    // Passengers' information
    @RequestMapping(value = "/passengerDetails", method = RequestMethod.GET)
    public String getPassengerDetails (Model model, HttpServletRequest request, HttpSession session) {
//        FlightPicker flightPicker = webAPI.getFlightsPicked();
        /*System.out.println(flightPicker.getDepartureTrip().getTravelClass());*/
        model.addAttribute("sessionId", request.getSession().getId());
        FlightPicker flightPicker = (FlightPicker) session.getAttribute(session.getId());
        System.out.println("Hello: " + flightPicker.getDepartureTrip().getTravelClass());
        int adults, infants, children;
        adults = flightPicker.getDepartureTrip().getAdults();
        infants = flightPicker.getDepartureTrip().getInfant();
        children = flightPicker.getDepartureTrip().getChildren();
        System.out.println("Adult, Children, Infants: " + adults + children + infants);

        //Handle Form -->
        List<PassengerInformation> passengerList = new ArrayList<>();

        for (int i = 1; i <= (adults + children + infants) ; i++){
            PassengerInformation passengerInformation = new PassengerInformation();
            if (i <= adults) {
                passengerInformation.setTitle("adult");
            } else if (i <= (adults + children)) {
                passengerInformation.setTitle("child");
            } else {
                passengerInformation.setTitle("infant");
            }
            passengerList.add(passengerInformation);
        }

        model.addAttribute("passengerList", passengerList);
        /*model.addAttribute("passenger", new PassengerInformation());*/
        return "passenger-details";

    }

    //Seat Selection Function while booking flight ticket!!!
    @RequestMapping(value = "/seatSelection", method = RequestMethod.GET)
    public String goToSeatSelection (Model model, HttpServletRequest request, HttpSession session) {
        model.addAttribute("sessionId", request.getSession().getId());
        System.out.println(request.getSession().getId());

        FlightPicker flightPicker = (FlightPicker) session.getAttribute(request.getSession().getId());
//        my edit
        model.addAttribute("flight",flightService.getFlightById(flightPicker.getDepartureTrip().getDepartureFlightId()));
//        end

        String tripType = "";

        // get the initial values
        if (flightPicker != null) {
            //Print out to test if this is either null or not...
            System.out.println(flightPicker.getDepartureTrip().getDepartureFlightId());
            for (PassengerInformation p : flightPicker.getPassengerInformation()){
                System.out.println("Full name: " + p.getFirstName() + p.getLastName());
            }

            int numberOfEconomySeats = flightService.getFlightById(flightPicker.getDepartureTrip().getDepartureFlightId()).getAircraft().getTotal_economy();
            int numberOfBusinessSeats = flightService.getFlightById(flightPicker.getDepartureTrip().getDepartureFlightId()).getAircraft().getTotal_economy();
            System.out.println("Economy: " + numberOfEconomySeats + ", Business: " + numberOfBusinessSeats);

            // branch out each circumstance
            if (tripType.equals("roundTrip")) {


            }
            tripType = flightPicker.getTicketInformation().getTripType();
            System.out.println(tripType);
        } else {
            System.out.println("FLight Picker is null!!!");
        }





        System.out.println("Reach the final line of codes in this request!!!");
        return "seat-selection";
    }

    // Payment Method
    @RequestMapping(value = "/paymentMethod", method = RequestMethod.GET)
    public String goToPaymentMethod (Model model, HttpServletRequest request){
        model.addAttribute("sessionId", request.getSession().getId());
        return "payment-method";
    }
    //For Date Time formatter
    @InitBinder
    private void dateBinder(WebDataBinder binder) {
        //The date format to parse or output your dates
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        //Create a new CustomDateEditor
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);

        //Register it as custom editor for the Date type
        binder.registerCustomEditor(Date.class, editor);

    }

}
