package com.example.demo.controller;

import com.example.demo.entity.Aircraft;
import com.example.demo.entity.FlightRoute;
import com.example.demo.service.AircraftService;
import com.example.demo.service.AirportService;
import com.example.demo.service.BrandService;
import com.example.demo.service.FlightRouteService;
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

    @RequestMapping(value = "/flightList")
    public String goToFlightListPage (){
        return "administration/flight-list";
    }

    @RequestMapping(value = "/adminHome", method = RequestMethod.GET)
    public String goToAdministratorPage(){
        return "administration/adminHome";
    }

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
        return "redirect:flightRouteList";
    }
    @RequestMapping("/deleteFlightRoute")
    public String deleteFlightRoute(@RequestParam("id") int id, Model model){
        if(flightRouteService.deleteFlightRoute(id)){
            model.addAttribute("message","Delete Successed");
        }else {
            model.addAttribute("message","Delete failed");
        }
        return "redirect:flightRouteList";
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
}
