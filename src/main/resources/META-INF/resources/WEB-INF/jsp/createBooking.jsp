<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="co.edu.uptc.uptchotels.model.Booking,java.util.List" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title> Registrar Reserva</title>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/principal.css">
        </head>

        <body>

            <div class="topnav">

                <div class="dropdown">
                    <button class="dropbtn">Menu Hotel</button>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/introcreatehotel">Crear Hotel</a>
                        <a href="hotels">Gestionar Hotel</a>
                        <a href="findhotel">Buscar Hotel</a>
                    </div>
                </div>
        
                <div class="dropdown">
                    <button class="dropbtn">Menu Reserva</button>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/introcreatebooking">Crear Reserva</a>
                        <a href="bookings">Gestionar Reserva</a>
                        <a href="reportbooking">Generar Reporte De Reservas</a>
                    </div>
                </div>
        
            </div>

            <div class="centered">
                <form action="createbooking" method="post">
                    <h2> Registrar Nueva Reserva</h2>

                    <label for="hotelName">Nombre del Hotel:</label>
                    <input type="text" id="hotelName" name="hotel_name" required>

                    <label for="hotelCity">Ciudad del Hotel:</label>
                    <input type="text" id="hotelCity" name="hotel_city" required>

                    <label for="guestName">Nombre de la Persona:</label>
                    <input type="text" id="guestName" name="guest_name" required>

                    <label for="guestId">Documento de Identidad:</label>
                    <input type="text" id="guestId" name="guest_id" required>

                    <label for="guestEmail">Email de la Persona:</label>
                    <input type="email" id="guestEmail" name="guest_email">

                    <label for="arrivalDate">Fecha de Llegada:</label>
                    <input type="date" id="arrivalDate" name="arrival_date" required>

                    <label for="DepartureDate">Fecha de Salida:</label>
                    <input type="date" id="departureDate" name="departure_date" required>

                    <label for="bookingStatus">Estado de la Reserva:</label>
                    <select id="bookingStatus" name="booking_status">
                        <option value="Registrada">Registrada</option>
                        <option value="Check-in">Check-in</option>
                        <option value="Check-out">Check-out</option>
                        <option value="Cancelada">Cancelada</option>
                    </select>

                    <input type="submit" value="Registrar Reserva">
                </form>
            </div>

            <%
                List<Booking> bookinglist = (List<Booking>) request.getSession().getAttribute("bookinglist");
                if (bookinglist == null || bookinglist.isEmpty()) {
            %>
                <div style="text-align: center; margin-top: 20px; color: #ccc;">
                    <h2>Lista de reservas vacia</h2>
                </div>
            <%
                } else {
            %>
                <div style="text-align: center; margin-top: 20px; color: #ccc;">
                    <h2>Existen reservas en el sistema!</h2>
                </div>
            <%
                }
            %>
    </body>

    </html>