package com.example.demo.controller;

import com.example.demo.entity.Aircraft;
import com.example.demo.entity.Flight;
import com.example.demo.entity.FlightRoute;
import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;


@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    private AircraftService aircraftService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private AirportService airportService;

    @Autowired
    private FlightRouteService flightRouteService;

    @Autowired
    private FlightService flightService;
    @RequestMapping(value = "/adminHome", method = RequestMethod.GET)
    public String goToAdministratorPage() {
        return "administration/adminHome";
    }

    /////////////////////////////////
    //For editing and viewing Aircraft!!!
    @RequestMapping(value = "/addAircraft")
    public String goToAircraftAdditionPage(Model model) {
        model.addAttribute("aircraft", new Aircraft());
        model.addAttribute("brands", brandService.getAllAircraftBrandsWithMapType());
        model.addAttribute("airports", airportService.getAllAirportsWithMapType());
        return "administration/aircraftAddition";
    }

    @RequestMapping(value = "/handlingAircraftAddition")
    public String handleAircraftAddition(Aircraft aircraft) {
        aircraftService.saveAircraft(aircraft);
        int totalEconomySeats = aircraft.getTotal_economy();
        int totalBusinessSeats = aircraft.getTotal_business();

        return "redirect:/admin/viewAircraft";
    }

    @RequestMapping(value = "/viewAircraft")
    public String viewAircraft(Model model) {
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        return "administration/aircraft-list";
    }

    @RequestMapping(value = "/deleteAircraft")
    public String deleteAircraft(@RequestParam(value = "aircraftId") int aircraftId) {
        aircraftService.deleteAircraftById(aircraftId);
        return "redirect:/admin/viewAircraft";
    }

    @RequestMapping(value = "/editAircraft", method = RequestMethod.GET)
    public String editAircraft(@RequestParam(value = "aircraftId") int aircraftId, Model model) {
        model.addAttribute("aircraft", aircraftService.getAircraftById(aircraftId));
        model.addAttribute("status", "Edit Aircraft");

        model.addAttribute("brands", brandService.getAllAircraftBrandsWithMapType());
        model.addAttribute("airports", airportService.getAllAirportsWithMapType());
        return "administration/aircraftAddition";
    }

    /////////////////////////////////
    // CRUD Flight Route

    @RequestMapping(value = "/flightRouteList")
    public String returnListFlightRoute(Model model) {
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
        return "administration/flight-route-list";
    }

    @RequestMapping("/addFlightRoute")
    public String gotoActionFlightRoutePage(Model model) {
        model.addAttribute("flightRoute", new FlightRoute());
        model.addAttribute("originAirport", airportService.getAllAirports());
        model.addAttribute("destinationAirport", airportService.getAllAirports());
        return "administration/flight-route-action";
    }

    @RequestMapping("/handlingSaveFlightRoute")
    public String handleSaveFlightRoute(FlightRoute flightRoute, Model model) {
        String origin = flightRoute.getOriginAirport().getAirportName();
        String destination = flightRoute.getDestinationAirport().getAirportName();
        if (origin==destination) {
            if(flightRoute.getRouteId()!=0){
                model.addAttribute("message", "Invalid value.");
                model.addAttribute("flightRoute", flightRouteService.getFlightRouteById(flightRoute.getRouteId()));
                model.addAttribute("originAirport", airportService.getAllAirports());
                model.addAttribute("destinationAirport", airportService.getAllAirports());
                model.addAttribute("type", "edit");
                return "administration/flight-route-action";
            }
            model.addAttribute("message", "Invalid value.");
            model.addAttribute("flightRoute", new FlightRoute());
            model.addAttribute("originAirport", airportService.getAllAirports());
            model.addAttribute("destinationAirport", airportService.getAllAirports());
            return "administration/flight-route-action";
        } else {
            for (FlightRoute f : flightRouteService.getAllFlightRoute()){
                String origin_db = f.getOriginAirport().getAirportName();
                String destination_db = f.getDestinationAirport().getAirportName();
                if(origin_db==origin&&destination_db==destination){
                    if(flightRoute.getRouteId()!=0){
                        model.addAttribute("message", "Data is existed.");
                        model.addAttribute("flightRoute", flightRouteService.getFlightRouteById(flightRoute.getRouteId()));
                        model.addAttribute("originAirport", airportService.getAllAirports());
                        model.addAttribute("destinationAirport", airportService.getAllAirports());
                        model.addAttribute("type", "edit");
                        return "administration/flight-route-action";
                    }
                    model.addAttribute("message", "Data is existed.");
                    model.addAttribute("flightRoute", new FlightRoute());
                    model.addAttribute("originAirport", airportService.getAllAirports());
                    model.addAttribute("destinationAirport", airportService.getAllAirports());
                    return "administration/flight-route-action";
                }
            }
            if (flightRouteService.saveFlightRoute(flightRoute)) {
                model.addAttribute("message", "Save Success!!!");
                model.addAttribute("flightRouteList",flightRouteService.getAllFlightRoute());
            } else {
                model.addAttribute("message", "Save Fail!!!");
            }
            return "administration/flight-route-list";
        }
    }

    @RequestMapping("/deleteFlightRoute")
    public String deleteFlightRoute(@RequestParam("id") int id, Model model) {
        model.addAttribute("flightRouteList",flightRouteService.getAllFlightRoute());
        if (flightRouteService.deleteFlightRoute(id)) {
            model.addAttribute("message", "Delete Successed");
        } else {
            model.addAttribute("message", "Delete failed");
        }
        return "administration/flight-route-list";
    }

    @RequestMapping("/editFlightRoute")
    public String gotoActionFlightRoute(@RequestParam("id") int id, Model model) {
        model.addAttribute("flightRoute", flightRouteService.getFlightRouteById(id));
        model.addAttribute("originAirport", airportService.getAllAirports());
        model.addAttribute("destinationAirport", airportService.getAllAirports());
        model.addAttribute("type", "edit");
        return "administration/flight-route-action";
    }

    // End Flight Route

    /////////////////////////////

    // Flight Manager


    @RequestMapping("/flightList")
    public String returnFlightList(Model model) {
        model.addAttribute("flightList", flightService.getAllFlight());
        return "administration/flight-list";
    }

    @RequestMapping("/addFlight")
    public String addFlight(Model model) {
        model.addAttribute("flight", new Flight());
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
        model.addAttribute("aircraft", aircraftService.getAllAircraftWithMapType());
        return "administration/flight-addition";
    }
    @RequestMapping("/editFlight")
    public String editFlight(@RequestParam("id")int id,Model model) {
        model.addAttribute("flight", flightService.getFlightById(id));
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
        model.addAttribute("aircraft", aircraftService.getAllAircraftWithMapType());
        return "administration/flight-addition";
    }
    @RequestMapping("/deleteFlight")
    public String deleteFlight(@RequestParam("id") int id, Model model) {
        try{
            flightService.deleteFLight(id);
            model.addAttribute("message", "Delete Succeed");
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
        }
        return "redirect:/admin/flightList";
    }

    @RequestMapping("/handlingFLightAddition")
    public String handlingFLightAddition(Flight flight, Model model, RedirectAttributes attributes) {
        try{
            flightService.saveFlight(flight);
            attributes.addFlashAttribute("message", "Successfully!!!");
        } catch (Exception e){
            attributes.addFlashAttribute("message", e.getMessage());
        }
        return "redirect:/admin/flightList";
    }
    //For Date time formatter!!!
}
