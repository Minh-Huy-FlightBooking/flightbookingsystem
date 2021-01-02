package com.example.demo.controller;

import com.example.demo.entity.Aircraft;
import com.example.demo.entity.Flight;
import com.example.demo.entity.FlightRoute;
import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


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
    private TicketService ticketService;

    @Autowired
    private FlightRouteService flightRouteService;
//-----------------------------------Home---------------------------------//
    @RequestMapping(value = "/adminHome", method = RequestMethod.GET)
    public String goToAdministratorPage() {
        return "administration/adminHome";
    }

//-----------------------------------Aircraft---------------------------------//
    // go to add new aircraft page
    @RequestMapping(value = "/addAircraft")
    public String goToAircraftAdditionPage (Model model) {
        model.addAttribute("aircraft", new Aircraft());
        model.addAttribute("brands", brandService.getAllAircraftBrands());
        model.addAttribute("type","Add");
        return "administration/addAircraft";
    }
    // Save new aircraft
    @RequestMapping(value = "/handlingAircraftAddition")
    public String handleAircraftAddition (Aircraft aircraft, Model model) {
        if(aircraftService.getAircraftById(aircraft.getAircraftId())!=null){
            if(aircraftService.isException(aircraft)){
                model.addAttribute("message","Data is existed.");
            }else {
                if(aircraftService.saveAircraft(aircraft)){
                    model.addAttribute("message","Save successed.");
                }else{
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("aircraft", aircraftService.getAircraftById(aircraft.getAircraftId()));
            model.addAttribute("brands", brandService.getAllAircraftBrands());
            model.addAttribute("type","Edit");
            return "administration/addAircraft";
        }else{
            if(aircraftService.isException(aircraft)){
                model.addAttribute("message","Data is existed.");
            }else{
                if(aircraftService.saveAircraft(aircraft)){
                    model.addAttribute("message","Save successed.");
                }else{
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("aircraft", new Aircraft());
            model.addAttribute("brands", brandService.getAllAircraftBrands());
            model.addAttribute("type","Add");
            return "administration/addAircraft";
        }
//        int totalEconomySeats = aircraft.getTotal_economy();
//        int totalBusinessSeats = aircraft.getTotal_business();
//        return "administration/addAircraft";
    }
    // go to view aircraft page
    @RequestMapping(value = "/viewAircraft")
    public String viewAircraft (Model model) {
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        return "administration/viewAircraft";
    }
    // delete aircraft
    @RequestMapping(value = "/deleteAircraft")
    public String deleteAircraft (@RequestParam(value = "aircraftId") int aircraftId,Model model) {
        if (aircraftService.deleteAircraftById(aircraftId)){
            model.addAttribute("message","Delete successed.");
        }else{
            model.addAttribute("message","Delete failed.");
        }
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        return "administration/viewAircraft";
    }
    // go to edit aircraft page
    @RequestMapping(value = "/editAircraft")
    public String editAircraft (@RequestParam(value = "aircraftId") int aircraftId, Model model) {
        model.addAttribute("aircraft", aircraftService.getAircraftById(aircraftId));
        model.addAttribute("type", "Edit");
        model.addAttribute("brands", brandService.getAllAircraftBrands());
        return "administration/addAircraft";
    }

//-----------------------------------Flight Route---------------------------------//

    @RequestMapping(value = "/viewFlightRoute")
    public String returnListFlightRoute (Model model) {
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
        return "administration/viewFlightRoute";
    }

    @RequestMapping("/addFlightRoute")
    public String gotoActionFlightRoutePage(Model model) {
        model.addAttribute("flightRoute", new FlightRoute());
        model.addAttribute("originAirport", airportService.getAllAirports());
        model.addAttribute("destinationAirport", airportService.getAllAirports());
        model.addAttribute("type","Add");
        return "administration/addFlightRoute";
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
                return "administration/addFlightRoute";
            }
            model.addAttribute("message", "Invalid value.");
            model.addAttribute("flightRoute", new FlightRoute());
            model.addAttribute("originAirport", airportService.getAllAirports());
            model.addAttribute("destinationAirport", airportService.getAllAirports());
            return "administration/addFlightRoute";
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
                        return "administration/addFlightRoute";
                    }
                    model.addAttribute("message", "Data is existed.");
                    model.addAttribute("flightRoute", new FlightRoute());
                    model.addAttribute("originAirport", airportService.getAllAirports());
                    model.addAttribute("destinationAirport", airportService.getAllAirports());
                    return "administration/addFlightRoute";
                }
            }
            if (flightRouteService.saveFlightRoute(flightRoute)) {
                model.addAttribute("message", "Save successed.");
                model.addAttribute("flightRoute", new FlightRoute());
                model.addAttribute("originAirport", airportService.getAllAirports());
                model.addAttribute("destinationAirport", airportService.getAllAirports());
            } else {
                model.addAttribute("message", "Save failed.");
            }
            return "administration/addFlightRoute";
        }
    }
    @RequestMapping("/deleteFlightRoute")
    public String deleteFlightRoute (@RequestParam("id") int id, Model model) {
        if (flightRouteService.deleteFlightRoute(id)) {
            model.addAttribute("message", "Delete successed.");
        } else {
            model.addAttribute("message", "Delete failed.");
        }
        model.addAttribute("flightRouteList",flightRouteService.getAllFlightRoute());
        return "administration/viewFlightRoute";
    }
    @RequestMapping("/editFlightRoute")
    public String gotoActionFlightRoute (@RequestParam("id") int id, Model model) {
        model.addAttribute("flightRoute", flightRouteService.getFlightRouteById(id));
        model.addAttribute("originAirport", airportService.getAllAirports());
        model.addAttribute("destinationAirport", airportService.getAllAirports());
        model.addAttribute("type", "Edit");
        return "administration/addFlightRoute";
    }

    // End Flight Route

//-----------------------------------Flight---------------------------------//

    //go to view flight page
    @RequestMapping("/viewFlight")
    public String returnFlightList (Model model) {
        model.addAttribute("flightList", flightService.getAllFlight());
        return "administration/viewFLight";
    }
    // go to add flight page
    @RequestMapping("/addFlight")
    public String addFlight (Model model) {
        model.addAttribute("flight", new Flight());
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        model.addAttribute("brand",brandService.getAllAircraftBrands());
        model.addAttribute("type","Add");
        return "administration/addFlight";
    }
    // go to edit flight page
    @RequestMapping("/editFlight")
    public String editFlight (@RequestParam("id") int id, Model model) {
        model.addAttribute("flight", flightService.getFlightById(id));
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        model.addAttribute("type","Edit");
        return "administration/addFlight";
    }
    // delete flight
    @RequestMapping("/deleteFlight")
    public String deleteFlight (@RequestParam("id") int id, Model model) {
        if ( flightService.deleteFLight(id)&&ticketService.deleteByFlight_FlightId(id)) {
            model.addAttribute("message", "Delete successed.");
        } else {
            model.addAttribute("message", "Delete failed.");
        }
        model.addAttribute("flightList", flightService.getAllFlight());
        return "administration/viewFLight";
    }
    // Save new Flight
    @RequestMapping("/handlingFLightAddition")
    public String handlingFLightAddition(Flight flight, Model model) {
        if(flightService.getFlightById(flight.getFlightId())!=null){
            if(flightService.isException(flight)){
                model.addAttribute("message","Invalid value OR Data is existed.");
            }else {
                if(flightService.saveFlight(flight)){
                    model.addAttribute("message","Save successed.");
                }else{
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("flight", flightService.getFlightById(flight.getFlightId()));
            model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
            model.addAttribute("aircraft", aircraftService.getAllAircraft());
            model.addAttribute("type","Edit");
            return "administration/addFlight";
        }else{
            if(flightService.isException(flight)){
                model.addAttribute("message","Invalid value OR Data is existed.");
            }else{
                if(flightService.saveFlight(flight)){
                    ticketService.createTickets(flight);
                    model.addAttribute("message","Save successed.");
                }else{
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("flight", new Flight());
            model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
            model.addAttribute("aircraft", aircraftService.getAllAircraft());
            model.addAttribute("type","Add");
            return "administration/addFlight";
        }
//        if(flightService.isException(flight))
//        {
//            model.addAttribute("message", "Invalid value OR Data is existed.");
//            model.addAttribute("flight", new Flight());
//            model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
//            model.addAttribute("aircraft", aircraftService.getAllAircraft());
//            return "administration/addFlight";
//        }else{
//            if (flightService.getFlightById(flight.getFlightId())!=null){
//                if(flightService.saveFlight(flight)){
//                    model.addAttribute("message","Save successed.");
//                }
//                else {
//                    model.addAttribute("message", "Save failed.");
//                }
//                model.addAttribute("flight", flightService.getFlightById(flight.getFlightId()));
//                model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
//                model.addAttribute("aircraft", aircraftService.getAllAircraft());
//                return "administration/addFlight";
//            }else{
//                if(flightService.saveFlight(flight)){
//                    model.addAttribute("message","Save successed.");
//                }
//                else {
//                    model.addAttribute("message", "Save failed.");
//                }
//                model.addAttribute("flight", new Flight());
//                model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
//                model.addAttribute("aircraft", aircraftService.getAllAircraft());
//                return "administration/addFlight";
//            }
//        }
    }
    // For Date time formatter!!!
    @InitBinder
    public void initBinder(final WebDataBinder binder) {
        final DateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss:SSS'Z'");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(timeFormat, true));
    }
    // test ajax
}
