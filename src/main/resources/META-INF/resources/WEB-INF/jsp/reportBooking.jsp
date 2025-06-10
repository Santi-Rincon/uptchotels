<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, co.edu.uptc.uptchotels.model.Report, java.time.format.DateTimeFormatter, java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Reservas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/estilo4.css">
</head>
<body>
    <div class="topnav">
        <div class="dropdown">
            <button class="dropbtn">Menú Hotel</button>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/introcreatehotel">Crear Hotel</a>
                <a href="hotels">Gestionar Hotel</a>
                <a href="findhotel">Buscar Hotel</a>
            </div>
        </div>
        <div class="dropdown">
            <button class="dropbtn">Menú Reserva</button>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/introcreatebooking">Crear Reserva</a>
                <a href="bookings">Gestionar Reserva</a>
                <a href="reportbooking">Generar Reporte De Reservas</a>
            </div>
        </div>
    </div>
    <div class="content">
        <h1 class="title">Generar Reporte de Reservas</h1>
        <form method="post" action="reportbooking" style="margin-bottom: 30px;">
            <label for="startDate">Fecha de inicio:</label>
            <input type="date" id="startDate" name="startDate" required value="<%= request.getAttribute("startDate") != null ? request.getAttribute("startDate") : "" %>">
            <label for="endDate">Fecha de fin:</label>
            <input type="date" id="endDate" name="endDate" required value="<%= request.getAttribute("endDate") != null ? request.getAttribute("endDate") : "" %>">
            <label for="city">Ciudad:</label>
            <input type="text" id="city" name="city" required value="<%= request.getAttribute("city") != null ? request.getAttribute("city") : "" %>">
            <button type="submit">Generar Reporte</button>
        </form>
        <% if (request.getAttribute("error") != null) { %>
            <div style="color: red;"><%= request.getAttribute("error") %></div>
        <% } %>
        <% List<Report> reports = (List<Report>) request.getAttribute("reports");
           if (reports != null && !reports.isEmpty()) { %>
            <table class="booking-table">
                <thead>
                    <tr>
                        <th>Fecha de llegada</th>
                        <th>Nombre del hotel</th>
                        <th>Habitaciones registradas</th>
                        <th>Habitaciones ocupadas por fecha</th>
                        <th>Habitaciones liberadas por fecha</th>
                    </tr>
                </thead>
                <tbody>
                <% for (Report report : reports) { %>
                    <tr>
                        <td><%= report.getArrivalDate() != null ? report.getArrivalDate().format(DateTimeFormatter.ISO_DATE) : "-" %></td>
                        <td><%= report.getHotelName() %></td>
                        <td><%= report.getRegisteredRooms() %></td>
                        <td>
                            <% Map<LocalDate, Integer> occupied = report.getOccupiedRoomsPerDate();
                               if (occupied != null && !occupied.isEmpty()) {
                                   for (Map.Entry<LocalDate, Integer> entry : occupied.entrySet()) { %>
                                       <div><%= entry.getKey().format(DateTimeFormatter.ISO_DATE) %>: <%= entry.getValue() %></div>
                            <%     }
                               } else { %>
                                   <div>-</div>
                            <% } %>
                        </td>
                        <td>
                            <% Map<LocalDate, Integer> released = report.getReleasedRoomsPerDate();
                               if (released != null && !released.isEmpty()) {
                                   for (Map.Entry<LocalDate, Integer> entry : released.entrySet()) { %>
                                       <div><%= entry.getKey().format(DateTimeFormatter.ISO_DATE) %>: <%= entry.getValue() %></div>
                            <%     }
                               } else { %>
                                   <div>-</div>
                            <% } %>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        <% } else if (request.getAttribute("reports") != null) { %>
            <div>No se encontraron resultados para los criterios seleccionados.</div>
        <% } %>
    </div>
    <div class="footer">
        <p>© 2025 UPTCHOTELS App. Todos los derechos reservados.</p>
    </div>
</body>
</html> 