package co.edu.uptc.uptchotels.controllerWeb;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import co.edu.uptc.uptchotels.model.Hotel;
import co.edu.uptc.uptchotels.service.HotelService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//@RequestMapping("wsrest")
//@RestController
public class HotelController {

    @Autowired
    private HotelService hotelService;

    @RequestMapping(value = "/addhotel", method = RequestMethod.POST)
    public void addHotel(@RequestBody Hotel hotel) {
        hotelService.addHotel(hotel);
    }

    @RequestMapping(value = "/edithotel", method = RequestMethod.PUT)
    public void editHotel(@RequestBody Hotel hotel) {
        hotelService.editHotel(hotel);
    }

    @RequestMapping(value = "/togglehotel/{name}", method = RequestMethod.PUT)
    public void toggleHotelStatus(@PathVariable("name") String name) {
        hotelService.toggleHotelStatus(name);
    }

    @RequestMapping(value = "/hotel/{name}", method = RequestMethod.GET)
    public Hotel getHotelByName(@PathVariable("name") String name) {
        return hotelService.getHotelByName(name);
    }

    @RequestMapping(value = "/hotels", method = RequestMethod.GET)
    public List<Hotel> getAllHotels() {
        return hotelService.getAllHotels();
    }

    @RequestMapping(value = "/hotels/{name}/{city}", method = RequestMethod.GET)
    public List<Hotel> searchHotels(@PathVariable("name") String name, 
                                  @PathVariable("city") String city) {
        return hotelService.searchHotels(name, city);
    }
}