<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="co.edu.uptc.uptchotels.model.Booking" %>
<%
    Booking booking = (Booking) request.getAttribute("booking");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cambiar Estado de la Reserva</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/estilo5.css">
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

    <br><br><br><br><br><br>
    <div class="form-container">
        <h1 style="text-align: center; color: #d4af37;">Modificar Estado de la Reserva</h1>
        <form action="editbooking" method="post">
            <input type="hidden" name="guest_id" value="<%= booking.getGuestId() %>"/>

            <p>Estado actual: <strong><%= booking.getBookingStatus() %></strong></p>

            <label>Nuevo Estado de la Reserva:</label><br>
            <select name="newStatus" required>
                <%
                    String bookingStatus = booking.getBookingStatus();
                    if ("Registrada".equals(bookingStatus)) {
                %>
                    <option value="Check-in">Check-in</option>
                    <option value="Cancelada">Cancelada</option>
                <%
                    } else if ("Check-in".equals(bookingStatus)) {
                %>
                    <option value="Check-out">Check-out</option>
                <%
                    } else {
                %>
                    <option disabled>No hay transiciones disponibles</option>
                <%
                    }
                %>
            </select><br><br>

            <input type="submit" value="Actualizar Estado">
        </form>
        
        <a href="bookings" class="link-back">Volver a la lista de Reservas</a>
    </div>
    <br><br><br><br>
    <div class="footer">
        <p>© 2025 UPTCHOTELS App. Todos los derechos reservados.</p>
    </div>
</body>
</html>
