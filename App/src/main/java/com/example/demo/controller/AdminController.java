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
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;
import java.text.SimpleDateFormat;

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
    private SeatService seatService;

    @Autowired
    private FlightRouteService flightRouteService;

    @RequestMapping(value = "/adminHome", method = RequestMethod.GET)
    public String goToAdministratorPage(){
        return "administration/adminHome";
    }
/////////////////////////////////
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

    /////////////////////////////////
    // CRUD Flight Route

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
        return "administration/flight-route-action";
    }
    @RequestMapping("/handlingSaveFlightRoute")
    public String handleSaveFlightRoute(FlightRoute flightRoute, Model model, RedirectAttributes attributes){
        if (flightRoute.getOriginAirport().getAirportName().equals(flightRoute.getDestinationAirport().getAirportName())){
            model.addAttribute("message","Invalid value");
            return "administration/flight-route-action";
        }else{
            if(flightRouteService.saveFlightRoute(flightRoute)){
                attributes.addFlashAttribute("message","Successfully");
            }else {
                attributes.addFlashAttribute("message","failed");
            }
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
        model.addAttribute("type","edit");
        return "administration/flight-route-action";
    }

    // End Flight Route

    /////////////////////////////

    // Flight Manager
    @Autowired
    private FlightService flightService;
    @RequestMapping("/flightList")
    public String returnFlightList(Model model){
        model.addAttribute("flightList",flightService.getAllFlight());
        return "administration/flight-list";
    }
    @RequestMapping("/addFlight")
    public String addFlight(Model model){
        model.addAttribute("flight",new Flight());
        model.addAttribute("flightRouteList",flightRouteService.getAllFlightRoute());
        model.addAttribute("aircraft",aircraftService.getAllAircraftWithMapType());
        return "administration/flight-addition";
    }
    @RequestMapping("/handlingFLightAddition")
    public String handlingFLightAddition(Flight flight,Model model,RedirectAttributes attributes){
        if (flight.getArrivalTime().toString()==flight.getDepartureTime().toString()){
            attributes.addAttribute("message","Invalid value");
            return "redirect:/admin/addFlight";
        }else{
            if(flightService.saveFlight(flight)){
                attributes.addFlashAttribute("message","Successfully");
            }else {
                attributes.addFlashAttribute("message","failed");
            }
        }
        return "redirect:/admin/flightList";
    }


    //For Date time formatter!!!
    /*@InitBinder
    private void dateBinder(WebDataBinder binder) {
        *//* DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");*//*

        //The date format to parse or output your dates
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        //Create a new CustomDateEditor
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);

        //Register it as custom editor for the Date type
        binder.registerCustomEditor(Date.class, editor);
    }*/


}
