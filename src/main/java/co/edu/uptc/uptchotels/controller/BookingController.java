package co.edu.uptc.uptchotels.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import co.edu.uptc.uptchotels.model.Booking;
import co.edu.uptc.uptchotels.service.BookingService;

@RequestMapping("wsrest")
@RestController
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @RequestMapping(value = "/addbooking", method = RequestMethod.POST)
    public void registerBooking(@RequestBody Booking booking) {
        bookingService.registerBooking(booking);
    }

    @RequestMapping(value = "/changebookingstatus/{guestId}/{newStatus}", method = RequestMethod.PUT)
    public void changeBookingStatus(@PathVariable("guestId") String guestId,
                                    @PathVariable("newStatus") String newStatus) {
        bookingService.changeBookingStatus(guestId, newStatus);
    }

    @RequestMapping(value = "/bookings", method = RequestMethod.GET)
    public List<Booking> getAllBookings() {
        return bookingService.getAllBookings();
    }

    @RequestMapping(value = "/booking/{guestId}", method = RequestMethod.GET)
    public Booking getBookingByGuestId(@PathVariable("guestId") String guestId) {
        return bookingService.getBookingByGuestId(guestId);
    }

    @RequestMapping(value = "/bookingsbyhotel/{hotelName}", method = RequestMethod.GET)
    public List<Booking> getBookingsByHotel(@PathVariable("hotelName") String hotelName) {
        return bookingService.getBookingsByHotel(hotelName);
    }
}