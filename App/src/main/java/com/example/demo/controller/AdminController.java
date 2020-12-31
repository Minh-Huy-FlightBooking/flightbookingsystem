package com.example.demo.controller;

import com.example.demo.entity.Aircraft;
import com.example.demo.entity.Flight;
import com.example.demo.entity.FlightRoute;
import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    // Flight Manager
    @Autowired
    private FlightService flightService;
    @Autowired
    private AircraftService aircraftService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private AirportService airportService;

    @Autowired
    private FlightRouteService flightRouteService;

    @RequestMapping(value = "/adminHome", method = RequestMethod.GET)
    public String goToAdministratorPage() {
        return "administration/adminHome";
    }

    /////////////////////////////////
    //For editing and viewing Aircraft!!!
    // go to add new aircraft page
    @RequestMapping(value = "/addAircraft")
    public String goToAircraftAdditionPage(Model model) {
        model.addAttribute("aircraft", new Aircraft());
        model.addAttribute("brands", brandService.getAllAircraftBrandsWithMapType());
        model.addAttribute("airports", airportService.getAllAirportsWithMapType());
        return "administration/aircraftAddition";
    }

    // Save new aircraft
    @RequestMapping(value = "/handlingAircraftAddition")
    public String handleAircraftAddition(Aircraft aircraft) {
        aircraftService.saveAircraft(aircraft);
        int totalEconomySeats = aircraft.getTotal_economy();
        int totalBusinessSeats = aircraft.getTotal_business();

        return "redirect:/admin/viewAircraft";
    }

    // go to view aircraft page
    @RequestMapping(value = "/viewAircraft")
    public String viewAircraft(Model model) {
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        return "administration/aircraft-list";
    }

    // delete aircraft
    @RequestMapping(value = "/deleteAircraft")
    public String deleteAircraft(@RequestParam(value = "aircraftId") int aircraftId) {
        aircraftService.deleteAircraftById(aircraftId);
        return "redirect:/admin/viewAircraft";
    }

    // go to edit aircraft page
    @RequestMapping(value = "/editAircraft", method = RequestMethod.GET)
    public String editAircraft(@RequestParam(value = "aircraftId") int aircraftId, Model model) {
        model.addAttribute("aircraft", aircraftService.getAircraftById(aircraftId));
        model.addAttribute("type", "edit");

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
        if (origin == destination) {
            if (flightRoute.getRouteId() != 0) {
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
            for (FlightRoute f : flightRouteService.getAllFlightRoute()) {
                String origin_db = f.getOriginAirport().getAirportName();
                String destination_db = f.getDestinationAirport().getAirportName();
                if (origin_db == origin && destination_db == destination) {
                    if (flightRoute.getRouteId() != 0) {
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
                model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
            } else {
                model.addAttribute("message", "Save Fail!!!");
            }
            return "administration/flight-route-list";
        }
    }

    @RequestMapping("/deleteFlightRoute")
    public String deleteFlightRoute(@RequestParam("id") int id, Model model) {
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
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

    //go to view flight page
    @RequestMapping("/flightList")
    public String returnFlightList(Model model) {
        model.addAttribute("flightList", flightService.getAllFlight());
        return "administration/flight-list";
    }

    // go to add flight page
    @RequestMapping("/addFlight")
    public String addFlight(Model model) {
        model.addAttribute("flight", new Flight());
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        model.addAttribute("brand", brandService.getAllAircraftBrands());
        return "administration/flight-addition";
    }

    // go to edit flight page
    @RequestMapping("/editFlight")
    public String editFlight(@RequestParam("id") int id, Model model) {
        model.addAttribute("flight", flightService.getFlightById(id));
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        model.addAttribute("type", "edit");
        return "administration/flight-addition";
    }

    // delete flight
    @RequestMapping("/deleteFlight")
    public String deleteFlight(@RequestParam("id") int id, Model model) {
        Flight flight = flightService.getFlightById(id);
        if (flightService.deleteFLight(id)) {
            model.addAttribute("message", "Deleted Flight!!!");
            model.addAttribute("type", "delete");
            model.addAttribute("newFlight", flight);
        } else {
            model.addAttribute("message", "Don't Delete Flight " + flight.getFlightId());
            model.addAttribute("type", "fail");
        }
        model.addAttribute("flightList", flightService.getAllFlight());
        return "administration/flight-list";
    }

    // Save new Flight
    @RequestMapping("/handlingFLightAddition")
    public String handlingFLightAddition(Flight flight, Model model) {
        if (flightService.checkFlight(flight)) {
            model.addAttribute("message", "Invalid value");
            model.addAttribute("flight", new Flight());
            model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
            model.addAttribute("aircraft", aircraftService.getAllAircraftWithMapType());
            return "administration/flight-addition";
        } else {
            try {
                Flight oldFlight = flightService.getFlightById(flight.getFlightId());
                flightService.saveFlight(flight);
                if (flightService.getFlightById(flight.getFlightId()).getAircraft() != null) {
                    model.addAttribute("type", "edit");
                    model.addAttribute("oldFlight", oldFlight);
                    model.addAttribute("message", "Edit Flight " + flight.getFlightId());
                } else {
                    model.addAttribute("type", "add");
                    model.addAttribute("message", "Added New Flight !!!");
                }
                model.addAttribute("newFlight", flight);
            } catch (Exception e) {
                model.addAttribute("message", e.getMessage());
            }
            model.addAttribute("flightList", flightService.getAllFlight());
            return "administration/flight-list";
        }

    }

    // For Date time formatter!!!
    @InitBinder
    public void initBinder(final WebDataBinder binder) {
        final DateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss:SSS'Z'");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(timeFormat, true));
    }
    // test ajax
}
