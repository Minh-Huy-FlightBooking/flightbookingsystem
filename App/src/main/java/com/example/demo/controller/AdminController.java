package com.example.demo.controller;

import com.example.demo.entity.Aircraft;
import com.example.demo.service.AircraftService;
import com.example.demo.service.AirportService;
import com.example.demo.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    private AircraftService aircraftService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private AirportService airportService;

    @RequestMapping(value = "/flightList")
    public String goToFlightListPage (){
        return "administration/flight-list";
    }

    @RequestMapping(value = "/adminHome", method = RequestMethod.GET)
    public String goToAdministratorPage(){
        return "administration/adminHome";
    }

    //For editing and viewing Aircraft!!!
    @RequestMapping(value = "/addAircraft")
    public String goToAircraftAdditionPage (Model model){
        model.addAttribute("aircraft", new Aircraft());
        model.addAttribute("brands", brandService.getAllAircraftBrandsWithMapType());
        model.addAttribute("airports", airportService.getAllAirportsWithMapType());
        return "administration/aircraftAddition";
    }

    @RequestMapping(value = "/handlingAircraftAddition")
    public String handleAircraftAddition (Aircraft aircraft) {
        aircraftService.saveAircraft(aircraft);
        return "administration/adminHome";
    }

    @RequestMapping(value = "/viewAircraft")
    public String viewAircraft (Model model){
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        return "administration/aircraft-list";
    }

    @RequestMapping(value = "/deleteAircraft")
    public String deleteAircraft (@RequestParam(value = "aircraftId")int aircraftId){
        aircraftService.deleteAircraftById(aircraftId);
        return "redirect:/admin/viewAircraft";
    }

    @RequestMapping(value = "/editAircraft", method = RequestMethod.GET)
    public String editAircraft (@RequestParam(value = "aircraftId") int aircraftId, Model model){
        model.addAttribute("aircraft", aircraftService.getAircraftById(aircraftId));
        model.addAttribute("status", "Edit Aircraft");

        model.addAttribute("brands", brandService.getAllAircraftBrandsWithMapType());
        model.addAttribute("airports", airportService.getAllAirportsWithMapType());
        return "administration/aircraftAddition";
    }
}
