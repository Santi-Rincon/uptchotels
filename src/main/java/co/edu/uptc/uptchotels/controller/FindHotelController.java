package co.edu.uptc.uptchotels.controller;

import java.io.IOException;
import java.util.List;

import co.edu.uptc.uptchotels.model.Hotel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/findhotel")
public class FindHotelController extends HttpServlet {

    public FindHotelController() {
        super();
    }

    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/jsp/findHotel.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/jsp/findHotel.jsp").forward(req, resp);
    }

}
