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
                        <a href="findemployee">Buscar Hotel</a>
                    </div>
                </div>
        
                <div class="dropdown">
                    <button class="dropbtn">Menu Reserva</button>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/introcreatebooking">Crear Reserva</a>
                        <a href="bookings">Gestionar Reserva</a>
                        <a href="findcustomer">Buscar Reserva</a>
                        <a href="findcustomer">Generar Reporte De Reservas</a>
                    </div>
                </div>
        
            </div>

            <div class="centered">
                <form action="createbooking" method="post">
                    <h2> UPTCHOTELS APP</h2>

                    <label for="name">Nombre del Hotel:</label>
                    <input type="text" id="name" name="hotel_name" required>

                    <label for="city">Ciudad del Hotel:</label>
                    <input type="text" id="city" name="hotel_city" required>

                    <label for="address">Nombre de la Persona:</label>
                    <input type="text" id="guestName" name="guest_name" required>

                    <label for="phone">Documento de Identidad:</label>
                    <input type="text" id="guestId" name="guest_id" required>

                    <label for="email">Email de la Persona:</label>
                    <input type="email" id="guestEmail" name="guest_email">

                    <label for="email">Fecha de Llegada:</label>
                    <input type="date" id="arrivalDate" name="arrival_date" required>

                    <label for="email">Fecha de Salida:</label>
                    <input type="date" id="departureDate" name="departure_date" required>

                    <label for="bookingStatus">Estado de la Reserva:</label>
                    <select id="bookingStatus" name="booking_status">
                        <option value="Registrada">Registrada</option>
                        <option value="Check-in">Check-in</option>
                        <option value="Check-out">Check-out</option>
                        <option value="Cancelada">Cancelada</option>
                    </select>

                    <input type="submit" value="Crear Reserva">
                </form>
            </div>

            <%
                List<Booking> bookinglist = (List<Booking>) request.getSession().getAttribute("bookingList");
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