<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="co.edu.uptc.uptchotels.model.Hotel,java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Empleados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/estilo4.css">
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
                    <th>Numero De Habitaciones</th>
                    <th>Estado</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty sessionScope.hotellist}">
                    <c:forEach var="emp" items="${sessionScope.hotellist}">
                        <tr>
                            <td>${hotel.name}</td>
                            <td>${hotel.city}</td>
                            <td>${hotel.address}</td>
                            <td>${hotel.phone}</td>
                            <td>${hotel.email}</td>
                            <td>${hotel.roomCapacity}</td>
                            <td>${hotel.status}</td>
                            
                            <td>
                                <form action="edithotel" method="post" style="display:inline;">
                                    <input type="hidden" name="hotel_name" value="${hotel.name}">
                                    <button type="submit" class="btn edit">Modificar</button>
                                </form>

                                <form action="deletehotel" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${emp.id}">
                                    <input type="hidden" name="confirm" value="false">
                                    <button type="submit" class="btn delete">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5">No hay Hoteles registrados.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>
</html>