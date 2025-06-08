package co.edu.uptc.uptchotels.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import co.edu.uptc.uptchotels.model.Hotel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/createhotel")
public class CreateHotelController extends HttpServlet {
    private List<Hotel> hotelList = new ArrayList<Hotel>();

    public CreateHotelController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("hotel_name");
            String city = req.getParameter("hotel_city");
            String address = req.getParameter("hotel_address"); // Corregido el nombre de la variable de 'addres' a 'address'
            String phone = req.getParameter("hotel_phone");
            String email = req.getParameter("hotel_email");
            String roomCapacityStr = req.getParameter("hotel_roomCapacity");
            int roomCapacity = 0; // Valor predeterminado
            if (roomCapacityStr != null && !roomCapacityStr.trim().isEmpty()) {
                roomCapacity = Integer.parseInt(roomCapacityStr);
            }
            
        
            String statusStr = req.getParameter("hotel_status");
            boolean status = false; 
            if (statusStr != null && statusStr.equalsIgnoreCase("true")) {
                status = true;
            }
        
            Hotel hotel = new Hotel();
            hotel.setName(name);
            hotel.setCity(city);
            hotel.setAddress(address);
            hotel.setPhone(phone);
            hotel.setEmail(email);
            hotel.setRoomCapacity(roomCapacity);
            hotel.setStatus(status);
            
          
            hotelList.add(hotel);
        
            req.getSession().setAttribute("oper", "success");
            req.getSession().setAttribute("hotellist", hotelList);
            resp.sendRedirect("confirm.html"); 
        
        } catch (NumberFormatException e) {
            
            e.printStackTrace(); 
            req.getSession().setAttribute("error", "El formato de número ingresado no es válido.");
            resp.sendRedirect("error.html");
        } catch (Exception e) {
            
            e.printStackTrace();
            req.getSession().setAttribute("error", "Ocurrió un error inesperado.");
            resp.sendRedirect("error.html");
        }
        

    }

  
}
