package co.edu.uptc.uptchotels.service;

import co.edu.uptc.uptchotels.model.Booking;
import co.edu.uptc.uptchotels.model.Report;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ReportService {

    public List<Report> generateReport(LocalDate startDate, LocalDate endDate, String city) {
        List<Booking> allBookings = BookingService.getAllBookings();

      
        List<Booking> filtered = allBookings.stream()
                .filter(b -> b.getHotelCity().equalsIgnoreCase(city))
                .filter(b -> !b.getArrivalDate().isBefore(startDate) && !b.getArrivalDate().isAfter(endDate))
                .collect(Collectors.toList());

       
        Map<String, List<Booking>> bookingsByHotel = filtered.stream()
                .collect(Collectors.groupingBy(Booking::getHotelName));

        List<Report> reports = new ArrayList<>();

        for (Map.Entry<String, List<Booking>> entry : bookingsByHotel.entrySet()) {
            String hotelName = entry.getKey();
            List<Booking> hotelBookings = entry.getValue();

            int registeredCount = (int) hotelBookings.stream()
                    .filter(b -> b.getBookingStatus().equalsIgnoreCase("Registrada"))
                    .count();

            Map<LocalDate, Integer> occupied = countByDate(hotelBookings, "Check-in");
            Map<LocalDate, Integer> released = countByDate(hotelBookings, "Check-out");

            
            LocalDate arrivalDate = hotelBookings.get(0).getArrivalDate();

            Report report = new Report();
            report.setStartDate(startDate);
            report.setEndDate(endDate);
            report.setCity(city);
            report.setHotelName(hotelName);
            report.setArrivalDate(arrivalDate);
            report.setRegisteredRooms(registeredCount);
            report.setOccupiedRoomsPerDate(occupied);
            report.setReleasedRoomsPerDate(released);

            reports.add(report);
        }

        return reports;
    }

    private Map<LocalDate, Integer> countByDate(List<Booking> bookings, String status) {
        Map<LocalDate, Integer> result = new HashMap<>();
        for (Booking b : bookings) {
            if (b.getBookingStatus().equalsIgnoreCase(status)) {
                LocalDate date;
                if (status.equalsIgnoreCase("Check-in")) {
                    date = b.getArrivalDate();
                } else if (status.equalsIgnoreCase("Check-out")) {
                    date = b.getDepartureDate();
                } else {
                    date = b.getArrivalDate(); // fallback
                }
                result.put(date, result.getOrDefault(date, 0) + 1);
            }
        }
        return result;
    }
}
