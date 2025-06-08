package co.edu.uptc.uptchotels.controllerWeb;

import co.edu.uptc.uptchotels.model.Report;
import co.edu.uptc.uptchotels.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RequestMapping("wsrest")
@RestController
public class ReportController {

    @Autowired
    private ReportService reportService;

    @RequestMapping(value = "/report", method = RequestMethod.GET)
    public List<Report> generateReport(
            @RequestParam("startDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam("endDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
            @RequestParam("city") String city) {

        return reportService.generateReport(startDate, endDate, city);
    }
}
