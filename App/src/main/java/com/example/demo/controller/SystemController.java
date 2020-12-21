package com.example.demo.controller;

import com.example.demo.object.TicketInformation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

    @RequestMapping(value = "/ticketSearch")
    public String goToTicketSearch(Model model){
        model.addAttribute("ticketInformation", new TicketInformation());
        return "ticket-searching-test";
    }

    @RequestMapping(value = "/ticketSearch", method = RequestMethod.POST)
    public String goToTicketList (@ModelAttribute("ticketForm") TicketInformation t) {
        System.out.println(t.getOrigin());
        System.out.println(t.getDestination());
        return "ticket-list";
    }

}
