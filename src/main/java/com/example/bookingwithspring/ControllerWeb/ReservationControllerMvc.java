package com.example.bookingwithspring.ControllerWeb;

import com.example.bookingwithspring.Entity.Reservation;
import com.example.bookingwithspring.Repo.ReservationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.Collections;

import java.util.Comparator;
import java.util.List;

@Controller
@RequestMapping("/reservations")
public class ReservationControllerMvc {
    private ReservationRepo reservationRepo;

    @Autowired
    public ReservationControllerMvc(ReservationRepo reservationRepo) {
        this.reservationRepo = reservationRepo;
    }

    @GetMapping
    public String listReservations(Model model) {
        List<Reservation> reservations = reservationRepo.findAll();
        reservations.sort(Comparator.comparing(Reservation::getReservationDate));
        Collections.reverse(reservations);
        model.addAttribute("reservationsList", reservations);
        return "ReservationsList";
    }

    @PostMapping
    public String addReservation(@ModelAttribute Reservation reservationModel, RedirectAttributes redirectAttr) {
        reservationRepo.save(reservationModel);
        redirectAttr.addFlashAttribute("message", "Reservation added successfuly");
        return "redirect:/";
    }

}
