package com.example.bookingwithspring.ControllerWeb;

import com.example.bookingwithspring.Entity.Cleaning;
import com.example.bookingwithspring.Entity.CleaningPerson;
import com.example.bookingwithspring.Entity.Reservation;
import com.example.bookingwithspring.Repo.CleaningPersonRepo;
import com.example.bookingwithspring.Repo.CleaningRepo;
import com.example.bookingwithspring.Repo.ReservationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Controller
@RequestMapping("/cleanings")
public class CleaningControllerMvc {
    private CleaningRepo cleaningRepo;
    private CleaningPersonRepo cleaningPersonRepo;

    @Autowired
    public CleaningControllerMvc(CleaningRepo cleaningRepo, CleaningPersonRepo cleaningPersonRepo) {
        this.cleaningRepo = cleaningRepo;
        this.cleaningPersonRepo = cleaningPersonRepo;
    }




    @GetMapping
    public String listCleanings(Model model) {
        List<Cleaning> clenanings = cleaningRepo.findAll();
        List<CleaningPerson> cleaners = cleaningPersonRepo.findAll();


        List<LocalDate> dates = new ArrayList<>();
        List<String> datesFullFormat = new ArrayList<>();
        List<String> datesComparableFormat = new ArrayList<>();

        for(int i = 10; i > -10; i--) {
            LocalDate date = LocalDate
                    .now()
                    .plusDays(i);

//            String dateFullFormat = date
//                    .format(DateTimeFormatter.ofLocalizedDate(FormatStyle.FULL));
//
//            String dateComparableFormat = date
//                    .format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT))
//                    .replace(".", "-");

            dates.add(date);
//            datesFullFormat.add(dateFullFormat);
//            datesComparableFormat.add(dateComparableFormat);
        }

        model.addAttribute("cleaners", cleaners);
        model.addAttribute("cleaningsList", clenanings);
        model.addAttribute("dates", dates);
        return "CleaningsList";
    }
}
