package com.example.demo.controller;

import com.example.demo.entity.Aircraft;
import com.example.demo.entity.Flight;
import com.example.demo.entity.FlightRoute;
<<<<<<< HEAD
import com.example.demo.repository.FlightRepository;
=======
>>>>>>> 093500dea5f41d403abfbd7f8227223ca1a38425
import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    private AircraftService aircraftService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private AirportService airportService;

<<<<<<< HEAD
=======
    @Autowired
    private SeatService seatService;


>>>>>>> 093500dea5f41d403abfbd7f8227223ca1a38425
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
        int totalEconomySeats = aircraft.getTotal_economy();
        int totalBusinessSeats = aircraft.getTotal_business();

        //Auto-Generated Seats For a newly aircraft
        seatService.generateSeatsForAircraft(aircraft);
        return "redirect:/admin/viewAircraft";
    }

    @RequestMapping(value = "/viewAircraft")
    public String viewAircraft (Model model){
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        return "administration/aircraft-list";
    }

    @RequestMapping(value = "/deleteAircraft")
    public String deleteAircraft (@RequestParam(value = "aircraftId")int aircraftId){
        seatService.deleteSeatsByAircraftId(aircraftId);
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
    // CRUD Flight Route
    @Autowired
    private FlightRouteService flightRouteService;
    @RequestMapping(value = "/flightRouteList")
    public String returnListFlightRoute(Model model){
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
        return "administration/flight-route-list";
    }
    @RequestMapping("/addFlightRoute")
    public String gotoActionFlightRoutePage(Model model){
        model.addAttribute("flightRoute", new FlightRoute());
        model.addAttribute("originAirport", airportService.getAllAirports());
        model.addAttribute("destinationAirport", airportService.getAllAirports());
        model.addAttribute("message","add");
        return "administration/flight-route-action";
    }
    @RequestMapping("/handlingSaveFlightRoute")
    public String handleSaveFlightRoute(FlightRoute flightRoute, Model model, RedirectAttributes attributes){
        if(flightRouteService.saveFlightRoute(flightRoute)){
            attributes.addFlashAttribute("message","Successfully");
        }else {
            attributes.addFlashAttribute("message","failed");
        }
        return "redirect:/admin/flightRouteList";
    }
    @RequestMapping("/deleteFlightRoute")
    public String deleteFlightRoute(@RequestParam("id") int id, Model model){
        if(flightRouteService.deleteFlightRoute(id)){
            model.addAttribute("message","Delete Successed");
        }else {
            model.addAttribute("message","Delete failed");
        }
        return "redirect:/admin/flightRouteList";
    }
    @RequestMapping("/editFlightRoute")
    public String gotoActionFlightRoute(@RequestParam("id") int id, Model model){
        model.addAttribute("flightRoute",flightRouteService.getFlightRouteById(id));
        model.addAttribute("originAirport", airportService.getAllAirports());
        model.addAttribute("destinationAirport", airportService.getAllAirports());
        model.addAttribute("message","edit");
        return "administration/flight-route-action";
    }
    // End Flight Route
    // Flight Manager
    @Autowired
    private FlightService flightService;
    @RequestMapping("/flightList")
    public String returnFlightList(Model model){
        model.addAttribute("flightList",flightService.getAllFlight());
        return "administration/flight-list";
    }

}
