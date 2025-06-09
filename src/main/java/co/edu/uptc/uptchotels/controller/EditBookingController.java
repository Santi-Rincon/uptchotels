package co.edu.uptc.uptchotels.controller;

import java.io.IOException;
import java.util.List;

import co.edu.uptc.uptchotels.model.Booking;
import co.edu.uptc.uptchotels.model.Hotel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editbooking")
public class EditBookingController extends HttpServlet{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        String guestId = request.getParameter("guestId");
        List<Booking> list = (List<Booking>) request.getSession().getAttribute("bookinglist");

        for (Booking booking : list) {
            if (booking.getGuestId().equals(guestId)) {
                request.setAttribute("booking", booking);
                break;
            }
        }

        request.getRequestDispatcher("WEB-INF/jsp/editBooking.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        String guestId = request.getParameter("guest_id");
        String newStatus = request.getParameter("newStatus");

        List<Booking> list = (List<Booking>) request.getSession().getAttribute("bookinglist");
        if (newStatus == null) {

            for (Booking booking : list) {
                if (booking.getGuestId().equals(guestId)) {
                    request.setAttribute("booking", booking);
                    break;
                }
            }
            request.getRequestDispatcher("WEB-INF/jsp/editBooking.jsp").forward(request, response);
        } else {

            for (Booking booking : list) {
                if (booking.getGuestId().equals(guestId)) {
                    booking.setBookingStatus(newStatus);
                    break;
                }
            }
            response.sendRedirect("bookings");
        }


        
    }


}
