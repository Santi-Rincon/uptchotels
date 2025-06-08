<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="co.edu.uptc.uptchotels.model.Hotel" %>
<%
    Hotel hotel = (Hotel) request.getAttribute("hotel");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Hotel</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/estilo5.css">
</head>
<body>
    <div class="topnav">

        <div class="dropdown">
            <button class="dropbtn">Menú Hotel</button>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/introcreatehotel">Crear Hotel</a>
                <a href="hotels">Gestionar Hotel</a>
                <a href="findemployee">Buscar Empleado</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">Menú Reserva</button>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/introaddcustomer">Crear Reserva</a>
                <a href="customers">Gestionar Reserva</a>
                <a href="findcustomer">Buscar Reserva</a>
                <a href="findcustomer">Generar Reporte De Reservas</a>
            </div>
        </div>

    </div>

    <br><br><br><br><br><br>
    <div class="form-container">
        <h1 style="text-align: center; color: #d4af37;">Modificar Hotel</h1>
        <form action="edithotel" method="post">
            <input type="hidden" name="hotel_name" value="<%= hotel.getName() %>"/>

            <label for="hotel_city">Ciudad:</label>
            <input type="text" id="hotel_city" name="hotel_city" value="<%= hotel.getCity() %>" pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+"/>

            <label for="hotel_address">Dirección:</label>
            <input type="text" id="hotel_address" name="hotel_address" value="<%= hotel.getAddress() %>" pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+"/>

            <label for="hotel_phone">Teléfono:</label>
            <input type="tel" id="hotel_phone" name="hotel_phone" value="<%= hotel.getPhone() %>" pattern="[0-9]{7,10}"/>

            <label for="hotel_email">Email:</label>
            <input type="email" id="hotel_email" name="hotel_email" value="<%= hotel.getEmail() %>"/>

            <label for="hotel_roomCapacity">Capacidad de Habitaciones:</label>
            <input type="number" id="hotel_roomCapacity" name="hotel_roomCapacity" value="<%= hotel.getRoomCapacity() %>" min="1"/>

            <label for="hotel_status">Estado:</label>
            <select id="hotel_status" name="hotel_status">
                <option value="true" <%= hotel.getStatus() ? "selected" : "" %>>Activo</option>
                <option value="false" <%= hotel.getStatus() ? "" : "selected" %>>Inactivo</option>
                </select>

            <button type="submit" class="btn">Guardar cambios</button>
        </form>
        <a href="hotels" class="link-back">Volver a la lista de Hoteles</a>
    </div>
    <br><br><br><br>
    <div class="footer">
        <p>© 2025 UPTCHOTELS App. Todos los derechos reservados.</p>
    </div>
</body>
</html>
