<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*, co.edu.uptc.uptchotels.model.Hotel" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Hoteles</title>
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
        <h1 class="title">Hoteles</h1>
        <table class="employee-table">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Ciudad</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                    <th>Capacidad de Habitaciones</th>
                    <th>Estado</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<Hotel> list = (List<Hotel>) session.getAttribute("hotellist");
                if (list != null && !list.isEmpty()) {
                    for (Hotel hotel : list) {
            %>
                <tr>
                    <td><%= hotel.getName() %></td>
                    <td><%= hotel.getCity() %></td>
                    <td><%= hotel.getAddress() %></td>
                    <td><%= hotel.getPhone() %></td>
                    <td><%= hotel.getEmail() %></td>
                    <td><%= hotel.getRoomCapacity() %></td>
                    <td><%= hotel.isStatus() ? "Activo" : "Inactivo"%></td>
                    
                    <td>
                        <a href="edithotel?name=<%= hotel.getName() %>" class="btn edit">Modificar</a>
                        <a href="deletehotel?name=<%= hotel.getName() %>" class="btn delete">Eliminar</a>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="5">No hay Hoteles registrados.</td>
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
