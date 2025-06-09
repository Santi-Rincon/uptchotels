package co.edu.uptc.uptchotels.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import co.edu.uptc.uptchotels.model.Booking;
import co.edu.uptc.uptchotels.model.Hotel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;

@WebServlet("/createbooking")
public class CreateBookingController extends HttpServlet{
    public CreateBookingController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String hotelName = req.getParameter("hotel_name");
            String hotelCity = req.getParameter("hotel_city");
            String guestName = req.getParameter("guest_name");
            String guestId = req.getParameter("guest_id");
            String guestEmail = req.getParameter("guest_email");
            LocalDate arrivalDate = req.getParameter("arrival_date") != null ? LocalDate.parse(req.getParameter("arrival_date")) : LocalDate.now();
            LocalDate departureDate = req.getParameter("departure_date") != null ? LocalDate.parse(req.getParameter("departure_date")) : LocalDate.now();

            String bookingStatus = req.getParameter("booking_status");
            bookingStatus = "Registrada";
            if (bookingStatus == null || bookingStatus.isEmpty()) {
                bookingStatus = "Registrada"; 
            }

            List<Hotel> hotelList = (List<Hotel>) req.getSession().getAttribute("hotellist");
            List<Booking> bookingList = (List<Booking>) req.getSession().getAttribute("bookinglist");

            if(bookingList == null) {
                bookingList = new ArrayList<>();
            }

            if(hotelList == null || hotelList.isEmpty()) {
                req.getSession().setAttribute("error", "No hay hoteles disponibles para realizar la reserva.");
                resp.sendRedirect("error.html");
                return;
            }


            Hotel selectedHotel = null;
            for (Hotel hotel : hotelList) {
                if (hotel.getName().equalsIgnoreCase(hotelName) && hotel.getCity().equalsIgnoreCase(hotelCity)) {
                    selectedHotel = hotel;
                    break;
                }
            }

            if (selectedHotel == null) {
                req.getSession().setAttribute("error", "El hotel seleccionado no está disponible.");
                resp.sendRedirect("error.html");
                return;
            }
    
            int reservasActivas = 0;
            for (Booking b : bookingList) {
                if (b.getHotelName().equalsIgnoreCase(hotelName) && b.getHotelCity().equalsIgnoreCase(hotelCity)
                    && (b.getBookingStatus().equalsIgnoreCase("Registrada") || b.getBookingStatus().equalsIgnoreCase("Check-in"))){
                    reservasActivas++;                    
                }
            }

            if (reservasActivas >= selectedHotel.getRoomCapacity()) {
                req.getSession().setAttribute("error", "No hay habitaciones disponibles en el hotel seleccionado.");
                resp.sendRedirect("error.html");
                return;
            }

            Booking booking = new Booking();
            booking.setHotelName(hotelName);
            booking.setHotelCity(hotelCity);
            booking.setGuestName(guestName);
            booking.setGuestId(guestId);
            booking.setGuestEmail(guestEmail);
            booking.setArrivalDate(arrivalDate);
            booking.setDepartureDate(departureDate);
            booking.setBookingStatus(bookingStatus);
            
            bookingList.add(booking);
            
            req.getSession().setAttribute("oper", "success");
            req.getSession().setAttribute("bookinglist", bookingList);
            resp.sendRedirect("confirm.html");
    
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("error", "Ocurrió un error inesperado.");
            resp.sendRedirect("error.html");
        }
    }

}
