package co.edu.uptc.uptchotels.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import co.edu.uptc.uptchotels.model.Hotel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deletehotel")
public class DeleteHotelController extends HttpServlet {

    @Override
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

        request.getRequestDispatcher("WEB-INF/jsp/deleteHotel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

                String name = request.getParameter("name");
                List<Hotel> list = (List<Hotel>) request.getSession().getAttribute("hotellist");

        Iterator<Hotel> iterator = list.iterator();
        while (iterator.hasNext()) {
            Hotel hotel = iterator.next();
            if (hotel.getName().equals(name)) {
                iterator.remove();
                break;
            }
        }

        response.sendRedirect("hotels");
    }
}
