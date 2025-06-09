package co.edu.uptc.uptchotels.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/bookings")
public class BookingListController extends HttpServlet{

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/jsp/bookingList.jsp").forward(req, resp);
    }

}
