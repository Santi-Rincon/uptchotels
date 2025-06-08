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
            
            <div class="centered">
                <form action="createhotel" method="post">
                    <h2> UPTCHOTELS APP</h2>
                    <label for="name">Nombre del Hotel:</label>
                    <input type="text" id="name" name="name">

                    <label for="city">Ciudad:</label>
                    <input type="text" id="city" name="city">

                    <label for="address">Direccion:</label>
                    <input type="text" id="address" name="address">

                    <label for="phone">Telefono:</label>
                    <input type="text" id="phone" name="phone">

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email">

                    <label for="roomCapacity">Capacidad de Habitaciones:</label>
                    <input type="number" id="roomCapacity" name="roomCapacity" min="1">

                    <label for="status">Estado:</label>
                    <select id="status" name="status">
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