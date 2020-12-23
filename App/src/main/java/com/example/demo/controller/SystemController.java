package com.example.demo.controller;

import com.example.demo.object.TicketInformation;
import com.example.demo.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;


@Controller
@RequestMapping(value = "/")
public class SystemController {
    @Autowired
    private FlightService flightService;
    @RequestMapping(value = "/")
    public String goToHomepage(){
        return "index";
    }

    @RequestMapping(value = "/home")
    public String goToHome (){
        return "home";
    }

    // a function to looking for a flight / ticket !!!
    @RequestMapping(value = "/ticketSearch")
    public String goToTicketSearch(Model model){
        model.addAttribute("ticketInformation", new TicketInformation());
        return "ticket-searching-test";
    }

    @RequestMapping(value = "/ticketSearch", method = RequestMethod.POST)
    public String goToTicketList (@ModelAttribute("ticketForm") TicketInformation t, Model model) {
        System.out.println(t.getOrigin());
        System.out.println(t.getDestination());
        System.out.println(t.getTripType());
        System.out.println(t.getDepartureDate());
        System.out.println(t.getReturnDate());
        System.out.println(t.getPassengerType().getNumberOfAdults());
        System.out.println(t.getPassengerType().getNumberOfChildren());
        System.out.println(t.getPassengerType().getNumberOfInfant());
        System.out.println(t.getTravelClass());

        int numberOfPeople = t.getPassengerType().getNumberOfAdults() + t.getPassengerType().getNumberOfChildren() + t.getPassengerType().getNumberOfInfant();
        /////////////
        // Departure Time
        LocalDateTime initialTimeOfDepartureDate = t.getDepartureDate().atStartOfDay();
        LocalDateTime endTimeOfDepartureDate = t.getDepartureDate().atTime(23,59);


        //Format!!!
        System.out.println(initialTimeOfDepartureDate);

        if (t.getTripType().equals("oneWay")){
            model.addAttribute("departFlights", flightService.getAllOneWayFlightsBySearchConditions(t.getOrigin(), t.getDestination(),initialTimeOfDepartureDate, endTimeOfDepartureDate, numberOfPeople));
        } else if (t.getTripType().equals("roundTrip")) {
            //This is an easy way to show data (Vietjet's Idea) --> upgrade later!!!
            model.addAttribute("departFlights", flightService.getAllOneWayFlightsBySearchConditions(t.getOrigin(), t.getDestination(),initialTimeOfDepartureDate, endTimeOfDepartureDate, numberOfPeople));
            LocalDateTime initialTimeOfReturnDate = t.getReturnDate().atStartOfDay();
            LocalDateTime endTimeOfReturnDate = t.getReturnDate().atTime(23, 59);
            model.addAttribute("returnFlights", flightService.getAllOneWayFlightsBySearchConditions( t.getDestination(), t.getOrigin(), initialTimeOfReturnDate,endTimeOfReturnDate, numberOfPeople));

            //Display table return flights!!!
            model.addAttribute("returnStatus", "true");
        }
        return "ticket-list";
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
