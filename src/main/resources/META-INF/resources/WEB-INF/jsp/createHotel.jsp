<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="co.edu.uptc.uptchotels.model.Hotel,java.util.List" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title> Crear Hotel</title>
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
                <form action="createhotel" method="post">
                    <h2> UPTCHOTELS APP</h2>
                    <label for="name">Nombre del Hotel:</label>
                    <input type="text" id="name" name="hotel_name" required>

                    <label for="city">Ciudad:</label>
                    <input type="text" id="city" name="hotel_city" required>

                    <label for="address">Direccion:</label>
                    <input type="text" id="address" name="hotel_address" required>

                    <label for="phone">Telefono:</label>
                    <input type="text" id="phone" name="hotel_phone" required>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="hotel_email" required>

                    <label for="roomCapacity">Capacidad de Habitaciones:</label>
                    <input type="number" id="roomCapacity" name="hotel_roomCapacity" min="1" required>

                    <label for="status">Estado:</label>
                    <select id="status" name="hotel_status">
                        <option value="true">Activo</option>
                        <option value="false">Inactivo</option>
                    </select>

                    <input type="submit" value="Enviar">
                </form>
            </div>

            <% List<Hotel> hotellist=(List<Hotel>)request.getSession().getAttribute("hotellist");
                if(hotellist !=null) { %>
                <div style="text-align: center; margin-top: 20px; color: #ccc;">
                    <h2> Lista de hoteles vacia </h2>
                </div>
                <%} else {%>
                    <div style="text-align: center; margin-top: 20px; color: #ccc;">
                        <h2> Existen hoteles en el sistema! </h2>
                    </div>
                    <%}%>
        </body>

        </html>