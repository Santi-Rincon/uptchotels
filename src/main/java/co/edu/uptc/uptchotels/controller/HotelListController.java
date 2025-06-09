package co.edu.uptc.uptchotels.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hotels")
public class HotelListController extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
req.getRequestDispatcher("WEB-INF/jsp/hotelList.jsp").forward(req, resp);
}

}
