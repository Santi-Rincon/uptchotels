package co.edu.uptc.uptchotels.controller;

import java.io.IOException;
import java.util.List;

import co.edu.uptc.uptchotels.model.Hotel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/edithotel")
public class EditHotelController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        List<Hotel> list = (List<Hotel>) request.getSession().getAttribute("hotellist");

        for (Hotel hotel : list) {
            if (hotel.getName().equals(name)) {
                request.setAttribute("hotel", hotel);
                break;
            }
        }

        request.getRequestDispatcher("WEB-INF/jsp/editHotel.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String nameParam = request.getParameter("hotel_name");
        String city = request.getParameter("hotel_city");
        String address = request.getParameter("hotel_address");
        String phone = request.getParameter("hotel_phone");
        String email = request.getParameter("hotel_email");
        String roomCapacityParam = request.getParameter("hotel_roomCapacity");
        String status = request.getParameter("hotel_status");
       
        List<Hotel> list = (List<Hotel>) request.getSession().getAttribute("hotellist");

        if (city == null || email == null || address == null || phone == null || roomCapacityParam == null || status == null) {
            // Solo llegó el ID → Mostrar el formulario de edición
            for (Hotel hotel : list) {
                if (hotel.getName().equals(nameParam)) {
                    request.setAttribute("hotel", hotel);
                    break;
                }
            }
            request.getRequestDispatcher("WEB-INF/jsp/editHotel.jsp").forward(request, response);
        } else {
            // Llegaron todos los datos → Actualizar Hotel
            int roomCapacity = Integer.parseInt(roomCapacityParam);

            for (Hotel hotel : list) {
                if (hotel.getName().equals(nameParam)) {
                    hotel.setCity(city);
                    hotel.setAddress(address);
                    hotel.setEmail(email);
                    hotel.setPhone(phone);
                    hotel.setRoomCapacity(roomCapacity);
                    hotel.setStatus(true);

                    break;
                }
            }
            response.sendRedirect("hotels");
        }
    }



}
