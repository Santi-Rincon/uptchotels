package co.edu.uptc.uptchotels.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import co.edu.uptc.uptchotels.model.Booking;
import co.edu.uptc.uptchotels.model.Hotel;

@Service
public class BookingService {
    private static List<Booking> bookings = new ArrayList<>();
    
        private HotelService hotelService; 
    
        public BookingService(HotelService hotelService) {
            this.hotelService = hotelService;
        }
    
        public void registerBooking(Booking booking) {
            Hotel hotel = hotelService.getHotelByName(booking.getHotelName());
    
            if (hotel == null || !hotel.getCity().equalsIgnoreCase(booking.getHotelCity())) {
                throw new IllegalArgumentException("Hotel no encontrado con ese nombre y ciudad");
            }
    
            long existingBookings = bookings.stream()
                    .filter(b -> b.getHotelName().equalsIgnoreCase(booking.getHotelName())
                              && b.getHotelCity().equalsIgnoreCase(booking.getHotelCity())
                              && !b.getBookingStatus().equalsIgnoreCase("Cancelada")
                              && !b.getBookingStatus().equalsIgnoreCase("Finalizada"))
                    .count();
    
            if (existingBookings >= hotel.getRoomCapacity()) {
                throw new IllegalStateException("No hay habitaciones disponibles en el hotel");
            }
    
            if (booking.getBookingStatus() == null || booking.getBookingStatus().isEmpty()) {
                booking.setBookingStatus("Registrada");
            }
            bookings.add(booking);
        }
    
        public void changeBookingStatus(String guestId, String newStatus) {
            Booking booking = bookings.stream()
                .filter(b -> b.getGuestId().equals(guestId))
                .findFirst()
                .orElse(null);
    
            if (booking == null) {
                throw new IllegalArgumentException("Reserva no encontrada con ese documento");
            }
    
            String currentStatus = booking.getBookingStatus();
    
            switch (currentStatus) {
                case "Registrada":
                    if (newStatus.equals("Cancelada") || newStatus.equals("Check-in")) {
                        booking.setBookingStatus(newStatus);
                    } else {
                        throw new IllegalArgumentException("Transición de estado no permitida");
                    }
                    break;
    
                case "Check-in":
                    if (newStatus.equals("Check-out")) {
                        booking.setBookingStatus(newStatus);
                    } else {
                        throw new IllegalArgumentException("Transición de estado no permitida");
                    }
                    break;
    
                case "Check-out":
                    booking.setBookingStatus("Finalizada");
                    break;
    
                default:
                    throw new IllegalArgumentException("No se puede cambiar el estado desde: " + currentStatus);
            }
        }
    
    public static List<Booking> getAllBookings() {
        return new ArrayList<>(bookings);
    }

    public List<Booking> getBookingsByHotel(String hotelName) {
        List<Booking> result = new ArrayList<>();
        for (Booking b : bookings) {
            if (b.getHotelName().equalsIgnoreCase(hotelName)) {
                result.add(b);
            }
        }
        return result;
    }

    public Booking getBookingByGuestId(String guestId) {
        return bookings.stream()
                .filter(b -> b.getGuestId().equals(guestId))
                .findFirst()
                .orElse(null);
    }
}
