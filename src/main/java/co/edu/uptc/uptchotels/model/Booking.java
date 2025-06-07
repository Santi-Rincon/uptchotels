package co.edu.uptc.uptchotels.model;

import java.time.LocalDate;

public class Booking {
    
    private String hotelName;
    private String hotelCity;
    private String guestName;
    private String guestId;
    private String guestEmail;
    private LocalDate arrivalDate;
    private LocalDate departureDate;
    private String bookingStatus;

    @Override
    public String toString() {
        return "Booking [hotelName=" + hotelName + ", hotelCity=" + hotelCity + ", guestName=" + guestName
                + ", guestId=" + guestId + ", guestEmail=" + guestEmail + ", arrivalDate=" + arrivalDate
                + ", departureDate=" + departureDate + ", bookingStatus=" + bookingStatus + "]";
    }

    public Booking(String hotelName, String hotelCity, String guestName, String guestId, String guestEmail, LocalDate arrivalDate, LocalDate departureDate, String bookingStatus) {
        this.hotelName = hotelName;
        this.hotelCity = hotelCity;
        this.guestName = guestName;
        this.guestId = guestId;
        this.guestEmail = guestEmail;
        this.arrivalDate = arrivalDate;
        this.departureDate = departureDate;
        this.bookingStatus = bookingStatus;
    }

    

    public Booking() {
        this.hotelName = "";
        this.hotelCity = "";
        this.guestName = "";
        this.guestId = "";
        this.guestEmail = "";
        this.arrivalDate = LocalDate.now();
        this.departureDate = LocalDate.now();
        this.bookingStatus = "Pending";
    }

    public String getHotelName() {
        return hotelName;
    }
    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }
    public String getHotelCity() {
        return hotelCity;
    }
    public void setHotelCity(String hotelCity) {
        this.hotelCity = hotelCity;
    }
    public String getGuestName() {
        return guestName;
    }
    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }
    public String getGuestId() {
        return guestId;
    }
    public void setGuestId(String guestId) {
        this.guestId = guestId;
    }
    public String getGuestEmail() {
        return guestEmail;
    }
    public void setGuestEmail(String guestEmail) {
        this.guestEmail = guestEmail;
    }
    public LocalDate getArrivalDate() {
        return arrivalDate;
    }
    public void setArrivalDate(LocalDate arrivalDate) {
        this.arrivalDate = arrivalDate;
    }
    public LocalDate getDepartureDate() {
        return departureDate;
    }
    public void setDepartureDate(LocalDate departureDate) {
        this.departureDate = departureDate;
    }
    public String getBookingStatus() {
        return bookingStatus;
    }
    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }


}
