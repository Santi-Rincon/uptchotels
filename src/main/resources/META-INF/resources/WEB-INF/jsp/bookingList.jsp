<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*, co.edu.uptc.uptchotels.model.Booking" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Reserva</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/estilo4.css">
</head>
<body>
    <div class="topnav">

        <div class="dropdown">
            <button class="dropbtn">Menú Hotel</button>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/introcreatehotel">Crear Hotel</a>
                <a href="hotels">Gestionar Hotel</a>
                <a href="findemployee">Buscar Hotel</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">Menú Reserva</button>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/introcreatebooking">Crear Reserva</a>
                <a href="bookings">Gestionar Reserva</a>
                <a href="findcustomer">Buscar Reserva</a>
                <a href="findcustomer">Generar Reporte De Reservas</a>
            </div>
        </div>

    </div>

    <div class="content">
        <h1 class="title">Reservas</h1>
        <table class="booking-table">
            <thead>
                <tr>
                    <th>Nombre Hotel</th>
                    <th>Ciudad Hotel</th>
                    <th>Nombre de la Persona</th>
                    <th>Documento de Identidad</th>
                    <th>Email de la Persona</th>
                    <th>Fecha de Llegada</th>
                    <th>Fecha de Salida</th>
                    <th>Estado de la Reserva</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<Booking> list = (List<Booking>) session.getAttribute("bookinglist");
                if (list != null && !list.isEmpty()) {
                    for (Booking booking : list) {
            %>
                <tr>
                    <td><%= booking.getHotelName() %></td>
                    <td><%= booking.getHotelCity() %></td>
                    <td><%= booking.getGuestName() %></td>
                    <td><%= booking.getGuestId() %></td>
                    <td><%= booking.getGuestEmail() %></td>
                    <td><%= booking.getArrivalDate() %></td>
                    <td><%= booking.getDepartureDate() %></td>
                    <td><%= booking.getBookingStatus() %></td>

                    <td>
                        <a href="editbooking?guestId=<%= booking.getGuestId() %>" class="btn edit">Modificar Estado de la Reserva</a>
                    </td>
                </tr>
                    
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="5">No hay reservas registrados.</td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="footer">
        <p>© 2025 UPTCHOTELS App. Todos los derechos reservados.</p>
    </div>
</body>
</html>
