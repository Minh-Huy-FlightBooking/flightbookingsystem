package com.example.demo.controller;

import com.example.demo.entity.CreditCard;
import com.example.demo.entity.Flight;
import com.example.demo.object.*;
import com.example.demo.service.CreditCardService;
import com.example.demo.service.FlightService;
import com.example.demo.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/")
public class PaymentController {
    @Autowired
    private CreditCardService creditCardService;

    @Autowired
    private FlightService flightService;

    @Autowired
    private TicketService ticketService;
    // Payment Method
    @RequestMapping(value = "/paymentMethod", method = RequestMethod.GET)
    public String goToPaymentMethod(Model model, HttpServletRequest request, HttpSession session) {
        model.addAttribute("sessionId", request.getSession().getId());
        System.out.println(request.getSession().getId());
        FlightPicker flightPicker = (FlightPicker) session.getAttribute(request.getSession().getId());
        System.out.println(flightPicker.getDepartureTrip().getTravelClass());
        if (flightPicker != null) {
            System.out.println("Say hi!!!: " + flightPicker.getTicketInformation().getTravelClass());
            List<PaymentInformation> paymentInformationList = new ArrayList<>();

            Flight departureFlight = flightService.getFlightById(flightPicker.getDepartureTrip().getDepartureFlightId());
            Flight returnFlight = flightService.getFlightById(flightPicker.getReturnTrip().getReturnFlightId());

            //Add passenger information for departure trip
            for (PassengerInformation p: flightPicker.getPassengerInformation()){
                String passengerName = p.getFirstName() + " " + p.getLastName();
                System.out.println(passengerName);
                System.out.println("I am a loop");
                for (SeatPossession s: flightPicker.getDepartureTrip().getDepartureSeatPossessions()) {
                    if (s.getPassengerName().equals(passengerName)) {
                        paymentInformationList.add(new PaymentInformation(departureFlight, p, flightPicker.getDepartureTrip().getTravelClass(), ticketService.getTicketByFlightIdAndSeatCode(departureFlight.getFlightId(), s.getSeatCode())));
                        System.out.println("I am added");
                    }
                }
            }
            //Add passenger information for return trip
            for (PassengerInformation p: flightPicker.getPassengerInformation()){
                String passengerName = p.getFirstName() + " " + p.getLastName();
                System.out.println(passengerName);
                System.out.println("I am in a loop");
                for (SeatPossession s: flightPicker.getReturnTrip().getReturnSeatPossessions()) {
                    if (s.getPassengerName().equals(passengerName)) {
                        paymentInformationList.add(new PaymentInformation(returnFlight, p, flightPicker.getDepartureTrip().getTravelClass(), ticketService.getTicketByFlightIdAndSeatCode(returnFlight.getFlightId(), s.getSeatCode())));
                        System.out.println("I am added");
                    }
                }
            }

           /* session.setAttribute(request.getSession().getId() + request.getSession().getId(), paymentInformationList);*/
            model.addAttribute("paymentInformationList", paymentInformationList);
        }

        return "payment-method";
    }

    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public String goToPaymentPage (Model model) {
        model.addAttribute("creditCard", new CreditCard());
        System.out.println("I have gone through Payment...");
        return "payment";
    }

    @RequestMapping(value = "/payment", method = RequestMethod.POST)
    public String handlePayment (@ModelAttribute CreditCard creditCard, Model model) {
        double totalAmount = 1000;
        if (creditCard != null) {
            CreditCard creditCardReceived = creditCardService.getCreditCardByCardNumber(creditCard.getCardNumber());
            if (creditCardReceived == null) {
                model.addAttribute("message", "This credit card does not exist...");
                return "payment";
            } else {
                if ((creditCardReceived.getCardNumber().equals(creditCard.getCardNumber())) && (creditCardReceived.getOTP().equals(creditCard.getOTP()))){
                    if ((creditCardReceived.getBalance() - totalAmount) >= 0) {
                        model.addAttribute("message", "Booking Successfully");

                        ////////////////////Do a tons of things here to save the booking data
                        return "payment-receipt";
                    } else {
                        model.addAttribute("message", "Fail to pay for the ticket's prices --> your balance is not enough!!!");
                        return "payment";
                    }
                } else {
                    model.addAttribute("message", "Please check your otp again...");
                    return "payment";
                }
            }






        }
        System.out.println("I have gone through Payment...");
        return "payment";
    }
}
