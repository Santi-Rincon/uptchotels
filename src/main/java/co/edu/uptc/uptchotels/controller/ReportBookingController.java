package co.edu.uptc.uptchotels.controller;

import co.edu.uptc.uptchotels.model.Report;
import co.edu.uptc.uptchotels.service.ReportService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/reportbooking")
public class ReportBookingController extends HttpServlet {
    private ReportService reportService = new ReportService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/reportBooking.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String startDateStr = req.getParameter("startDate");
            String endDateStr = req.getParameter("endDate");
            String city = req.getParameter("city");

            LocalDate startDate = LocalDate.parse(startDateStr);
            LocalDate endDate = LocalDate.parse(endDateStr);

            List<Report> reports = reportService.generateReport(startDate, endDate, city);
            req.setAttribute("reports", reports);
            req.setAttribute("startDate", startDateStr);
            req.setAttribute("endDate", endDateStr);
            req.setAttribute("city", city);
            req.getRequestDispatcher("/WEB-INF/jsp/reportBooking.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Error al generar el reporte: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/jsp/reportBooking.jsp").forward(req, resp);
        }
    }
} 