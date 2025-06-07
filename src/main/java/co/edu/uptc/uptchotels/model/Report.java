package co.edu.uptc.uptchotels.model;

import java.time.LocalDate;
import java.util.Map;

public class Report {
    private LocalDate startDate;
    private LocalDate endDate;
    private String city;
    private String hotelName;
    private LocalDate arrivalDate;
    private int registeredRooms;
    private Map<LocalDate, Integer> occupiedRoomsPerDate;
    private Map<LocalDate, Integer> releasedRoomsPerDate;

    // Getters y Setters

    public LocalDate getStartDate() {
        return startDate;
    }
    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }
    public LocalDate getEndDate() {
        return endDate;
    }
    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public String getHotelName() {
        return hotelName;
    }
    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }
    public LocalDate getArrivalDate() {
        return arrivalDate;
    }
    public void setArrivalDate(LocalDate arrivalDate) {
        this.arrivalDate = arrivalDate;
    }
    public int getRegisteredRooms() {
        return registeredRooms;
    }
    public void setRegisteredRooms(int registeredRooms) {
        this.registeredRooms = registeredRooms;
    }
    public Map<LocalDate, Integer> getOccupiedRoomsPerDate() {
        return occupiedRoomsPerDate;
    }
    public void setOccupiedRoomsPerDate(Map<LocalDate, Integer> occupiedRoomsPerDate) {
        this.occupiedRoomsPerDate = occupiedRoomsPerDate;
    }
    public Map<LocalDate, Integer> getReleasedRoomsPerDate() {
        return releasedRoomsPerDate;
    }
    public void setReleasedRoomsPerDate(Map<LocalDate, Integer> releasedRoomsPerDate) {
        this.releasedRoomsPerDate = releasedRoomsPerDate;
    }
}
