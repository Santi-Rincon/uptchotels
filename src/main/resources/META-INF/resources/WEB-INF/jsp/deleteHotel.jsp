<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>

<%@ page import="co.edu.uptc.uptchotels.model.Hotel" %>
<%
    Hotel hotel = (Hotel) request.getAttribute("hotel");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Hotel</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/estilo6.css">
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

    <div class="form-container">
        <h1 class="title-delete">¿Estás seguro que deseas eliminar a este hotel?</h1>
        <form action="deletehotel" method="post">
            <input type="hidden" name="name" value="<%= hotel.getName() %>"/>

            <p><strong>Nombre:</strong> <%= hotel.getName() %></p>
            <p><strong>Ciudad:</strong> <%= hotel.getCity() %></p>
            <p><strong>Dirección:</strong> <%= hotel.getAddress() %></p>
            <p><strong>Teléfono:</strong> <%= hotel.getPhone() %></p>
            <p><strong>Email:</strong> <%= hotel.getEmail() %></p>
            <p><strong>Habitaciones:</strong> <%= hotel.getRoomCapacity() %></p>
            <p><strong>Estado:</strong> <%= hotel.isStatus() %></p>
            

            <button type="submit" class="btn delete-btn">Confirmar Eliminación</button>
        </form>

        <a href="${pageContext.request.contextPath}/hotels" class="link-back">Cancelar</a>
    </div>

    <div class="footer">
        <p>© 2025 UPTCHOTEL App. Todos los derechos reservados.</p>
    </div>
</body>
</html>
