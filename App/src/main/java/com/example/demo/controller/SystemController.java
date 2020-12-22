package com.example.demo.controller;

import com.example.demo.object.TicketInformation;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;


import java.sql.Date;
import java.text.SimpleDateFormat;


@Controller
@RequestMapping(value = "/")
public class SystemController {
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
    public String goToTicketList (@ModelAttribute("ticketForm") TicketInformation t) {
        System.out.println(t.getOrigin());
        System.out.println(t.getDestination());
        System.out.println(t.getTripType());
        System.out.println(t.getDepartureDate());
        System.out.println(t.getReturnDate());
        System.out.println(t.getPassengerType().getNumberOfAdults());
        System.out.println(t.getPassengerType().getNumberOfChildren());
        System.out.println(t.getPassengerType().getNumberOfInfant());
        System.out.println(t.getTravelClass());
        return "ticket-list";
    }

    //For Date Time formatter
    @InitBinder
    private void dateBinder(WebDataBinder binder) {
        /* DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");*/

        //The date format to parse or output your dates
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        //Create a new CustomDateEditor
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);

        //Register it as custom editor for the Date type
        binder.registerCustomEditor(Date.class, editor);
    }

}
