package co.edu.uptc.uptchotels.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import co.edu.uptc.uptchotels.model.Hotel;

@Service
public class HotelService {
    private List<Hotel> hotels = new ArrayList<Hotel>();

    public void addHotel(Hotel hotel) {
        
        boolean exists = hotels.stream()
            .anyMatch(h -> h.getName().equalsIgnoreCase(hotel.getName()) 
                    && h.getCity().equalsIgnoreCase(hotel.getCity()));
        
        if (!exists) {
            hotel.setStatus(true); // Por defecto activo (status=true) al crearlo
            hotels.add(hotel);
        } else {
            throw new IllegalArgumentException("Ya existe un hotel con ese nombre en la misma ciudad");
        }
    }

    public void editHotel(Hotel hotel) {
        for (Hotel h : hotels) {
            if (h.getName().equals(hotel.getName()) && h.getCity().equals(hotel.getCity())) {
                // Actualizar todos los campos excepto el estado (se maneja con toggle)
                h.setAddress(hotel.getAddress());
                h.setPhone(hotel.getPhone());
                h.setEmail(hotel.getEmail());
                h.setRoomCapacity(hotel.getRoomCapacity());
                return;
            }
        }
        throw new IllegalArgumentException("Hotel no encontrado para editar");
    }

    public void toggleHotelStatus(String name) {
        for (Hotel h : hotels) {
            if (h.getName().equals(name)) {
                h.setStatus(!h.isStatus()); // Cambia el estado actual
                return;
            }
        }
        throw new IllegalArgumentException("Hotel no encontrado");
    }

    public Hotel getHotelByName(String name) {
        return hotels.stream()
            .filter(h -> h.getName().equalsIgnoreCase(name))
            .findFirst()
            .orElse(null);
    }

    public List<Hotel> getAllHotels() {
        return hotels;
    }

    public List<Hotel> searchHotels(String name, String city) {
        List<Hotel> result = new ArrayList<>();
        
        for (Hotel h : hotels) {
            boolean nameMatches = name == null || name.isEmpty() || 
                                h.getName().equalsIgnoreCase(name);
            boolean cityMatches = city == null || city.isEmpty() || 
                                h.getCity().equalsIgnoreCase(city);
            
            if (nameMatches && cityMatches) {
                result.add(h);
            }
        }
        return result;
    }
}